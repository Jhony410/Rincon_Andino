/* ===========================================================
   HOME / DESCUBRIR — 7 Home · 8 Búsqueda · 9 Mapa
   10 Notificaciones · 11 Cupones
   =========================================================== */

function renderHome() { return `
<div class="app-screen scr-home">
  <div class="home-header">
    ${statusBar(true)}
    <div class="home-top">
      <div>
        <div class="home-greeting">Buenas tardes 👋</div>
        <div class="home-name">María García</div>
      </div>
      <div class="home-bell" onclick="goTo(10)">
        <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="#fff" stroke-width="1.8"><path d="M18 8a6 6 0 1 0-12 0c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.7 21a2 2 0 0 1-3.4 0"/></svg>
        <span class="bell-dot"></span>
      </div>
    </div>
    <div class="location-row">${ICON.pin} Av. Larco 345, Miraflores <span class="loc-caret">▾</span></div>
    <div class="search-bar" onclick="goTo(8)">
      <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#7a6f65" stroke-width="2"><circle cx="11" cy="11" r="7"/><path d="m20 20-3.5-3.5"/></svg>
      <span class="search-placeholder">Busca platos, restaurantes…</span>
    </div>
  </div>
  <div class="scroll-area">
    <div class="home-sections">
      <div class="cat-quad">
        ${catTile('Delivery', '#fff3e8', deliveryIcon(), 12)}
        ${catTile('Reservar', '#eaf2ee', tableIcon(), 25)}
        ${catTile('Ofertas', '#fdf0e0', tagIcon(), 11)}
        ${catTile('Mapa', '#e9f1fb', mapIcon(), 9)}
      </div>

      <div class="promo-banner" onclick="goTo(11)">
        <div class="promo-text">
          <h3>20% de descuento</h3>
          <p>En tu primer pedido del día</p>
          <span class="promo-chip">RICODIA20</span>
        </div>
        <div class="promo-photo">${photo(IMG.lomo)}</div>
      </div>

      <div class="home-block">
        <div class="section-header-row">
          <div class="section-title">Populares cerca de ti</div>
          <span class="see-all" onclick="goTo(8)">Ver todos</span>
        </div>
        <div class="h-scroll">
          ${popCard(IMG.restAndino, 'Rincón Andino', 'Cocina Andina', '4.8', '25-35 min', 12)}
          ${popCard(IMG.restMar, 'La Bahía Miraflores', 'Mariscos', '4.9', '30-40 min', 12)}
          ${popCard(IMG.restParrilla, 'La Parrilla del Chef', 'Parrilla', '4.6', '20-30 min', 12)}
        </div>
      </div>

      <div class="home-block">
        <div class="section-header-row">
          <div class="section-title">Restaurantes cercanos</div>
          <span class="see-all" onclick="goTo(8)">Ver todos</span>
        </div>
        <div class="shop-list">
          ${shopRow(IMG.restAndino, 'Rincón Andino', '4.8', '25-35 min', 'S/ 3.50 envío', 'Abierto', 'green')}
          ${shopRow(IMG.restWarm, 'El Buen Sabor', '4.5', '20-30 min', 'Envío gratis', 'Abierto', 'green')}
          ${shopRow(IMG.sushi, 'Sakura Nikkei', '4.9', '30-45 min', 'S/ 5.00 envío', 'Ocupado', 'orange')}
        </div>
      </div>
    </div>
  </div>
  ${bottomNav('home')}
</div>`; }

function catTile(label, bg, icon, to) {
  return `<div class="cat-tile" onclick="goTo(${to})">
    <div class="cat-icon" style="background:${bg};">${icon}</div>
    <div class="cat-label">${label}</div>
  </div>`;
}
function popCard(img, name, type, rating, time, to) {
  return `<div class="pop-card" onclick="goTo(${to})">
    <div class="pop-img">${photo(img)}<span class="pop-rating">${ICON.star} ${rating}</span></div>
    <div class="pop-name">${name}</div>
    <div class="pop-meta">${type} · ${time}</div>
  </div>`;
}
function shopRow(img, name, rating, time, fee, status, color) {
  return `<div class="shop-card" onclick="goTo(12)">
    <div class="shop-img">${photo(img)}</div>
    <div class="shop-info">
      <div class="shop-name">${name}</div>
      <div class="shop-meta">${ICON.star}<span class="rating-text">${rating}</span><span class="shop-dot"></span>${time}<span class="shop-dot"></span>${fee}</div>
    </div>
    <span class="badge badge-${color}">${status}</span>
  </div>`;
}

function renderBuscar() { return `
<div class="app-screen scr-search">
  <div class="search-header">
    ${statusBar()}
    <div class="search-top">
      <div class="search-bar inpage">
        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#7a6f65" stroke-width="2"><circle cx="11" cy="11" r="7"/><path d="m20 20-3.5-3.5"/></svg>
        <input value="Lomo saltado" placeholder="Buscar…">
      </div>
      <span class="search-cancel" onclick="goTo(7)">Cancelar</span>
    </div>
    <div class="chip-row">
      <div class="chip active">Todo</div>
      <div class="chip">Delivery</div>
      <div class="chip">Bebidas</div>
      <div class="chip">Mejor calif.</div>
      <div class="chip">$ Precio</div>
    </div>
  </div>
  <div class="scroll-area">
    <div class="result-count">12 resultados para “Lomo saltado”</div>
    ${resultRow(IMG.lomo, 'Lomo Saltado Andino', 'Rincón Andino · 25 min', '4.8', 'S/ 3.50 envío', '34.00')}
    ${resultRow(IMG.arroz, 'Lomo Saltado Premium', 'El Buen Sabor · 30 min', '4.5', 'Envío gratis', '28.00')}
    ${resultRow(IMG.seco, 'Lomo Saltado Clásico', 'La Cocina Peruana · 20 min', '4.7', 'S/ 2.00 envío', '25.00')}
    ${resultRow(IMG.veg, 'Lomo al Wok Vegano', 'Green Kitchen · 35 min', '4.3', 'Envío gratis', '22.00')}
    ${resultRow(IMG.chicharron, 'Lomo a lo Pobre', 'Doña Rosa · 28 min', '4.6', 'S/ 3.00 envío', '36.00')}
  </div>
  ${bottomNav('search')}
</div>`; }

function resultRow(img, name, type, rating, fee, price) {
  return `<div class="result-item" onclick="goTo(14)">
    <div class="result-img">${photo(img)}</div>
    <div class="result-info">
      <div class="result-name">${name}</div>
      <div class="result-type">${type}</div>
      <div class="result-sub">${ICON.star} ${rating} · ${fee}</div>
    </div>
    <div class="result-price">S/ ${price}</div>
  </div>`;
}

function renderMapa() { return `
<div class="app-screen scr-mapa">
  <div class="mapa-full">${mapSVG({ pin: false })}
    ${statusBar()}
    <div class="mapa-search">
      <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#7a6f65" stroke-width="2"><circle cx="11" cy="11" r="7"/><path d="m20 20-3.5-3.5"/></svg>
      <span>Restaurantes cerca de Miraflores</span>
    </div>
    <div class="mapa-pin p1" onclick="goTo(12)"><span class="mp-label">Rincón Andino</span><span class="mp-dot">${ICON.pin}</span></div>
    <div class="mapa-pin p2" onclick="goTo(26)"><span class="mp-label">La Bahía</span><span class="mp-dot alt">${ICON.pin}</span></div>
    <div class="mapa-pin p3"><span class="mp-dot alt">${ICON.pin}</span></div>
    <div class="mapa-pin p4"><span class="mp-dot alt">${ICON.pin}</span></div>
    <div class="mapa-filters">
      <div class="chip active">Todos</div>
      <div class="chip">Andina</div>
      <div class="chip">Mariscos</div>
      <div class="chip">Abierto ahora</div>
    </div>
  </div>
  <div class="mapa-sheet">
    <div class="sheet-grab"></div>
    <div class="mapa-card" onclick="goTo(12)">
      <div class="mapa-card-img">${photo(IMG.restAndino)}</div>
      <div class="mapa-card-info">
        <div class="mapa-card-name">Rincón Andino</div>
        <div class="mapa-card-meta">${ICON.star} 4.8 · Cocina Andina · 1.2 km</div>
        <div class="mapa-card-open">Abierto · cierra 11 PM</div>
      </div>
      <button class="mini-btn">Ver</button>
    </div>
  </div>
  ${bottomNav('home')}
</div>`; }

function renderNotificaciones() { return `
<div class="app-screen scr-notif">
  ${statusBar()}
  ${appHeader('Notificaciones', { right: '<span class="link-sm">Marcar leídas</span>' })}
  <div class="scroll-area">
    <div class="notif-day">Hoy</div>
    ${notif('order', 'Tu pedido va en camino', 'Carlos está llegando con tu pedido de Rincón Andino · hace 5 min', true, 20)}
    ${notif('promo', '¡20% en tu próximo pedido!', 'Usa el cupón RICODIA20 antes de medianoche · hace 1 h', true, 11)}
    <div class="notif-day">Ayer</div>
    ${notif('resv', 'Reserva confirmada', 'Tu mesa en La Bahía Miraflores para el sáb 10 may · 7:30 PM', false, 29)}
    ${notif('rate', '¿Cómo estuvo tu pedido?', 'Califica tu experiencia con Taquería del Valle', false, 21)}
    ${notif('new', 'Nuevo restaurante cerca', 'La Parrilla del Chef ya hace delivery a tu zona', false, 12)}
  </div>
  ${bottomNav('home')}
</div>`; }

function notif(type, title, body, unread, to) {
  const map = {
    order: ['#fff3e8', ICON.moto], promo: ['#fdf0e0', tagIcon(14)],
    resv: ['#eaf2ee', tableIcon(14)], rate: ['#fef6e0', ICON.star],
    new: ['#e9f1fb', mapIcon(14)],
  };
  const [bg, icon] = map[type];
  return `<div class="notif-item${unread ? ' unread' : ''}" onclick="goTo(${to})">
    <div class="notif-ic" style="background:${bg};">${icon}</div>
    <div class="notif-body">
      <div class="notif-title">${title} ${unread ? '<span class="badge badge-orange" style="margin-left:4px;">Nuevo</span>' : ''}</div>
      <div class="notif-text">${body}</div>
    </div>
    ${unread ? '<span class="unread-dot"></span>' : ''}
  </div>`;
}

function renderCupones() { return `
<div class="app-screen scr-coupon">
  ${statusBar()}
  ${appHeader('Cupones y promociones')}
  <div class="chip-row" style="padding:0 16px 12px;">
    <div class="chip active">Disponibles</div>
    <div class="chip">Mis cupones</div>
    <div class="chip">Vencidos</div>
  </div>
  <div class="scroll-area">
    <div class="coupon-list">
      ${coupon('RICODIA20', '20% de descuento', 'En tu primer pedido del día. Máx. S/ 25.', 'Vence 30 jun', '#b85c2a', true)}
      ${coupon('ENVIOGRATIS', 'Envío gratis', 'En pedidos mayores a S/ 40 en restaurantes seleccionados.', 'Vence 15 jun', '#2c4a3e', true)}
      ${coupon('ANDINO15', 'S/ 15 de regalo', 'Por invitar a un amigo a Rincón Andino.', 'Vence 28 jun', '#c89a3a', false)}
      ${coupon('FINDE2X1', '2x1 en postres', 'Solo sábados y domingos. Aplica en postres seleccionados.', 'Vence 31 jul', '#a8472a', false)}
    </div>
  </div>
  ${bottomNav('home')}
</div>`; }

function coupon(code, title, desc, exp, color, saved) {
  return `<div class="coupon">
    <div class="coupon-left" style="background:${color};">
      <div class="coupon-pct">${tagIcon(20, '#fff')}</div>
      <div class="coupon-code">${code}</div>
    </div>
    <div class="coupon-perf"></div>
    <div class="coupon-body">
      <div class="coupon-title">${title}</div>
      <div class="coupon-desc">${desc}</div>
      <div class="coupon-foot">
        <span class="coupon-exp">${ICON.clock} ${exp}</span>
        <button class="coupon-btn${saved ? ' saved' : ''}">${saved ? 'Usar' : 'Guardar'}</button>
      </div>
    </div>
  </div>`;
}

/* ---- category icons ---- */
function deliveryIcon() { return `<svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="#b85c2a" stroke-width="1.7"><circle cx="5.5" cy="17" r="2.6"/><circle cx="18" cy="17" r="2.6"/><path d="M8 17h7l1.6-6H19M4.5 11h4l2.2 6"/><path d="M13 8h4l1 3"/></svg>`; }
function tableIcon(s = 26) { return `<svg viewBox="0 0 24 24" width="${s}" height="${s}" fill="none" stroke="#2c4a3e" stroke-width="1.7"><path d="M3 7h18M5 7v13M19 7v13M3 11h18"/><path d="M9 4h6l1 3H8z"/></svg>`; }
function tagIcon(s = 26, c = '#c89020') { return `<svg viewBox="0 0 24 24" width="${s}" height="${s}" fill="none" stroke="${c}" stroke-width="1.7"><path d="M3 12 12 3h7v7l-9 9z"/><circle cx="15.5" cy="8.5" r="1.4" fill="${c}"/></svg>`; }
function mapIcon(s = 26) { return `<svg viewBox="0 0 24 24" width="${s}" height="${s}" fill="none" stroke="#4a86c4" stroke-width="1.7"><path d="m9 4 6 2 5-2v14l-5 2-6-2-5 2V6z"/><path d="M9 4v14M15 6v14"/></svg>`; }
