import os
import json
import shutil

ext_res_path = r"e:\Universidad 2026-I\INTERACCION HUMANO COMPUTADOR\rincon_andino\extracted_prototype\ext_resources.json"
extracted_assets_dir = r"e:\Universidad 2026-I\INTERACCION HUMANO COMPUTADOR\rincon_andino\extracted_prototype\assets"
flutter_assets_dir = r"e:\Universidad 2026-I\INTERACCION HUMANO COMPUTADOR\rincon_andino\assets\images"

os.makedirs(flutter_assets_dir, exist_ok=True)

with open(ext_res_path, "r", encoding="utf-8") as f:
    resources = json.load(f)

print(f"Loaded {len(resources)} mappings from ext_resources.json")

copied_count = 0
for res in resources:
    res_id = res["id"]
    uuid = res["uuid"]
    
    # Find the corresponding file in extracted assets
    found = False
    for ext in ["jpg", "png", "jpeg", "svg", "gif"]:
        src_file = os.path.join(extracted_assets_dir, f"{uuid}.{ext}")
        if os.path.exists(src_file):
            dest_file = os.path.join(flutter_assets_dir, f"{res_id}.{ext}")
            shutil.copy(src_file, dest_file)
            print(f"Copied: {uuid}.{ext} -> {res_id}.{ext}")
            found = True
            copied_count += 1
            break
            
    if not found:
        print(f"Warning: Could not find extracted asset file for uuid {uuid} (id: {res_id})")

print(f"Finished organizing assets. Copied {copied_count} files to {flutter_assets_dir}")
