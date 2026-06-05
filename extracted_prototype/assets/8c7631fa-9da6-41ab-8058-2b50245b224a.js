/* ===========================================================
   Rincón Andino — Shared helpers, image library & UI atoms
   =========================================================== */

/* ---- Unsplash image library (curated, Andean / Peruvian) ---- */
/* ---- Image library resolved from bundled resources (standalone) ---- */
const IMG = new Proxy({}, {
  get(_t, key) {
    return (window.__resources && window.__resources[key]) || '';
  }
});

/* photo(): fills its parent (which must be position-ish & overflow:hidden) */
function photo(url, extra = '') {
  return `<img src="${url}" loading="lazy" alt="" class="ph-img" style="${extra}"
    onerror="this.classList.add('ph-err')">`;
}

/* ---- Status bar ---- */
function statusBar(light = false) {
  return `<div class="status-bar${light ? ' light' : ''}">
    <span class="sb-time">9:41</span>
    <div class="status-icons">
      <svg width="18" height="11" viewBox="0 0 18 11" fill="none"><rect x="0" y="6" width="3" height="5" rx="1" fill="currentColor"/><rect x="5" y="4" width="3" height="7" rx="1" fill="currentColor"/><rect x="10" y="2" width="3" height="9" rx="1" fill="currentColor"/><rect x="15" y="0" width="3" height="11" rx="1" fill="currentColor"/></svg>
      <svg width="16" height="11" viewBox="0 0 16 11" fill="none"><path d="M8 2.2c2.1 0 4 .8 5.5 2.1l1.3-1.5C13 1 10.6 0 8 0S3 1 1.2 2.8l1.3 1.5C4 3 5.9 2.2 8 2.2z" fill="currentColor"/><path d="M8 5.4c1.2 0 2.3.5 3.1 1.2l1.3-1.5C11.2 4 9.7 3.4 8 3.4S4.8 4 3.6 5.1l1.3 1.5C5.7 5.9 6.8 5.4 8 5.4z" fill="currentColor"/><circle cx="8" cy="9" r="1.6" fill="currentColor"/></svg>
      <svg width="25" height="12" viewBox="0 0 25 12" fill="none"><rect x="0.5" y="0.5" width="21" height="11" rx="3" stroke="currentColor" opacity="0.4"/><rect x="2" y="2" width="16" height="8" rx="1.5" fill="currentColor"/><rect x="23" y="4" width="2" height="4" rx="1" fill="currentColor" opacity="0.5"/></svg>
    </div>
  </div>`;
}

/* ---- Bottom nav (5 items per brief) ---- */
const NAV_ITEMS = [
  { id: 'home',    label: 'Inicio',  to: 7,
    path: '<path d="M3 10.5 12 3l9 7.5M5 9.5V20a1 1 0 0 0 1 1h4v-6h4v6h4a1 1 0 0 0 1-1V9.5"/>' },
  { id: 'search',  label: 'Buscar',  to: 8,
    path: '<circle cx="11" cy="11" r="7"/><path d="m20 20-3.5-3.5"/>' },
  { id: 'cart',    label: 'Carrito', to: 15,
    path: '<path d="M3 4h2l2.2 11.2a1 1 0 0 0 1 .8h8.6a1 1 0 0 0 1-.8L20 7H6"/><circle cx="9" cy="20" r="1.4"/><circle cx="18" cy="20" r="1.4"/>' },
  { id: 'orders',  label: 'Pedidos', to: 22,
    path: '<rect x="5" y="3" width="14" height="18" rx="2"/><path d="M9 8h6M9 12h6M9 16h4"/>' },
  { id: 'profile', label: 'Perfil',  to: 33,
    path: '<circle cx="12" cy="8" r="4"/><path d="M4 21c0-4 3.6-7 8-7s8 3 8 7"/>' },
];

function bottomNav(active = 'home') {
  return `<div class="bottom-nav">
    ${NAV_ITEMS.map(i => `<div class="nav-item${active === i.id ? ' active' : ''}" onclick="goTo(${i.to})">
      <svg class="nav-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">${i.path}</svg>
      <span class="nav-label">${i.label}</span>
    </div>`).join('')}
  </div>`;
}

/* ---- Generic back header ---- */
function appHeader(title, opts = {}) {
  const right = opts.right || '';
  const back = opts.back === false ? '' :
    `<button class="back-btn" onclick="goTo(${opts.back || 7})">
      <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 5-7 7 7 7"/></svg>
    </button>`;
  return `<div class="app-header">
    ${back}
    <div class="header-title">${title}</div>
    ${right ? `<div style="margin-left:auto;display:flex;align-items:center;gap:10px;">${right}</div>` : ''}
  </div>`;
}

/* ---- Small inline icons ---- */
const ICON = {
  star:  '<svg viewBox="0 0 24 24" width="14" height="14" fill="#f5a623"><path d="M12 2l2.9 6.3 6.9.7-5.1 4.6 1.4 6.8L12 17.8 5.9 20.4l1.4-6.8L2.2 9l6.9-.7z"/></svg>',
  clock: '<svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="1.8"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg>',
  pin:   '<svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M12 21s7-6.3 7-11a7 7 0 1 0-14 0c0 4.7 7 11 7 11z"/><circle cx="12" cy="10" r="2.5"/></svg>',
  moto:  '<svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="1.7"><circle cx="5.5" cy="17" r="3"/><circle cx="18.5" cy="17" r="3"/><path d="M8.5 17h6l2-6h3M5.5 11h4l2.5 6"/></svg>',
  heart: '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.9"><path d="M12 20s-7-4.5-9.2-9C1.3 8 2.6 4.5 6 4.5c2 0 3.2 1.2 4 2.3.8-1.1 2-2.3 4-2.3 3.4 0 4.7 3.5 3.2 6.5C19 15.5 12 20 12 20z"/></svg>',
  share: '<svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.9"><circle cx="18" cy="5" r="2.5"/><circle cx="6" cy="12" r="2.5"/><circle cx="18" cy="19" r="2.5"/><path d="M8.2 10.8 15.8 6.4M8.2 13.2l7.6 4.4"/></svg>',
};

/* ---- Simulated street map (SVG) ---- */
function mapSVG(opts = {}) {
  const pin = opts.pin !== false;
  return `<svg class="map-svg" viewBox="0 0 375 240" preserveAspectRatio="xMidYMid slice">
    <rect width="375" height="240" fill="#e9ede7"/>
    <g stroke="#d3dccb" stroke-width="14">
      <path d="M-10 60 H385"/><path d="M-10 150 H385"/><path d="M60 -10 V250"/><path d="M200 -10 V250"/><path d="M310 -10 V250"/>
    </g>
    <g stroke="#fff" stroke-width="3">
      <path d="M-10 60 H385"/><path d="M-10 150 H385"/><path d="M60 -10 V250"/><path d="M200 -10 V250"/><path d="M310 -10 V250"/>
    </g>
    <g fill="#dde4d6"><rect x="20" y="80" width="28" height="48" rx="3"/><rect x="80" y="80" width="100" height="48" rx="3"/><rect x="220" y="20" width="70" height="28" rx="3"/><rect x="220" y="170" width="70" height="50" rx="3"/><rect x="80" y="170" width="100" height="50" rx="3"/></g>
    <path d="M40 200 Q120 150 180 120 T330 70" stroke="#b85c2a" stroke-width="4" fill="none" stroke-dasharray="2 7" stroke-linecap="round"/>
    ${pin ? `<g transform="translate(180 110)"><circle r="22" fill="#b85c2a" opacity="0.18"/><path d="M0 -16c-6 0-11 5-11 11 0 8 11 17 11 17s11-9 11-17c0-6-5-11-11-11z" fill="#b85c2a"/><circle cy="-5" r="4" fill="#fff"/></g>` : ''}
  </svg>`;
}

/* ---- QR code (SVG, deterministic-ish blocks) ---- */
function qrSVG(size = 150) {
  let cells = '';
  const seed = [
    '1111111010101111111','1000001011010000001','1011101001001011101',
    '1011101110101011101','1011101010001011101','1000001011110000001',
    '1111111010101111111','0000000111000000000','1101011010110100101',
    '0100110001011011010','1110001110100110001','0011100101011100110',
    '1010111010001011011','0000000110101101001','1111111001010110101',
    '1000001011100100110','1011101101011011011','1011101000110100101','1111111011010011010'
  ];
  const n = seed.length, c = size / n;
  for (let y = 0; y < n; y++) for (let x = 0; x < n; x++)
    if (seed[y][x] === '1') cells += `<rect x="${(x*c).toFixed(1)}" y="${(y*c).toFixed(1)}" width="${c.toFixed(1)}" height="${c.toFixed(1)}" fill="#1a1208"/>`;
  return `<svg width="${size}" height="${size}" viewBox="0 0 ${size} ${size}">${cells}</svg>`;
}
