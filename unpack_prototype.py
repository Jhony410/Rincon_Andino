import re
import json
import base64
import os
import gzip

html_path = r"E:\Dowloads\Rincón Andino (offline).html"
output_dir = r"e:\Universidad 2026-I\INTERACCION HUMANO COMPUTADOR\rincon_andino\extracted_prototype"

os.makedirs(output_dir, exist_ok=True)

print(f"Reading HTML file from {html_path}...")
with open(html_path, "r", encoding="utf-8") as f:
    content = f.read()

print("Searching for bundler script tags...")

# Find manifest
manifest_match = re.search(r'<script type="__bundler/manifest">(.*?)</script>', content, re.DOTALL)
if manifest_match:
    manifest_data = json.loads(manifest_match.group(1).strip())
    print(f"Found manifest with {len(manifest_data)} files.")
    
    # Save manifest summary
    with open(os.path.join(output_dir, "manifest_summary.json"), "w", encoding="utf-8") as out:
        summary = {k: {"mime": v.get("mime"), "compressed": v.get("compressed"), "size": len(v.get("data", ""))} for k, v in manifest_data.items()}
        json.dump(summary, out, indent=2)
        
    # Extract files
    assets_dir = os.path.join(output_dir, "assets")
    os.makedirs(assets_dir, exist_ok=True)
    for uuid, entry in manifest_data.items():
        mime = entry.get("mime", "")
        compressed = entry.get("compressed", False)
        base64_data = entry.get("data", "")
        
        # Determine extension
        ext = "bin"
        if "image/jpeg" in mime or "image/jpg" in mime:
            ext = "jpg"
        elif "image/png" in mime:
            ext = "png"
        elif "image/svg+xml" in mime:
            ext = "svg"
        elif "image/gif" in mime:
            ext = "gif"
        elif "text/html" in mime:
            ext = "html"
        elif "text/css" in mime:
            ext = "css"
        elif "javascript" in mime:
            ext = "js"
        elif "json" in mime:
            ext = "json"
            
        filename = f"{uuid}.{ext}"
        filepath = os.path.join(assets_dir, filename)
        
        try:
            file_bytes = base64.b64decode(base64_data)
            if compressed:
                try:
                    file_bytes = gzip.decompress(file_bytes)
                except Exception as e:
                    print(f"Failed to decompress {uuid}: {e}")
            
            with open(filepath, "wb") as f_out:
                f_out.write(file_bytes)
        except Exception as e:
            print(f"Error extracting asset {uuid}: {e}")
    print("Assets extracted successfully.")
else:
    print("No manifest found!")

# Find template
template_match = re.search(r'<script type="__bundler/template">(.*?)</script>', content, re.DOTALL)
if template_match:
    template_str = json.loads(template_match.group(1).strip())
    print("Found template. Saving...")
    
    # Replace UUID references if possible to make a readable HTML
    # We will write the raw template and also a mock-replaced version if possible
    with open(os.path.join(output_dir, "template_raw.html"), "w", encoding="utf-8") as out:
        out.write(template_str)
        
    print("Template saved to template_raw.html.")
else:
    print("No template found!")

# Find ext_resources
ext_res_match = re.search(r'<script type="__bundler/ext_resources">(.*?)</script>', content, re.DOTALL)
if ext_res_match:
    ext_res_data = json.loads(ext_res_match.group(1).strip())
    with open(os.path.join(output_dir, "ext_resources.json"), "w", encoding="utf-8") as out:
        json.dump(ext_res_data, out, indent=2)
    print("Found and saved external resources mapping.")
else:
    print("No external resources mapping found.")
