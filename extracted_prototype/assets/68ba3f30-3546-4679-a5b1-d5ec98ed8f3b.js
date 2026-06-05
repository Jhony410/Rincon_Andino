/* ===========================================================
   FLUJO DELIVERY — 12 Comercio · 13 Categorías · 14 Producto
   15 Carrito · 16 Dirección · 17 Resumen · 18 Pago
   19 Confirmación · 20 Seguimiento · 21 Calificación
   22 Historial · 23 Detalle pasado · 24 Favoritos
   =========================================================== */

function renderComercio() { return `
<div class="app-screen scr-comercio">
  <div class="cover-img">${photo(IMG.restAndino)}
    <div class="cover-fade"></div>
    <button class="float-btn left" onclick="goTo(7)">
      <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 5-7 7 7 7"/></svg>
    </button>
    <div class="cover-actions">
      <button class="float-btn" onclick="goTo(24)" style="color:#fff;">${ICON.heart}</button>
      <button class="float-btn" style="color:#fff;">${ICON.share}</button>
    </div>
    ${statusBar(true)}
  </div>
  <div class="scroll-area">
    <div class="comercio-card">
      <div class="comercio-head">
        <div class="shop-detail-name">Rincón Andino</div>
        <span class="badge badge-green">Abierto</span>
      </div>
      <div class="info-pills">
        <div class="info-pill">${ICON.star} <strong>4.8</strong> (342)</div>
        <div class="info-pill">${ICON.clock} 25-35 min</div>
        <div class="info-pill">${ICON.moto} S/ 3.50</div>
        <div class="info-pill">${ICON.pin} 1.2 km</div>
      </div>
      <div class="comercio-desc">Restaurante tradicional andino con más de 20 años ofreciendo los sabores auténticos de la sierra peruana.</div>
    </div>
    <div class="chip-row sticky-cats">
      <div class="chip active" onclick="goTo(13)">Platos principales</div>
      <div class="chip" onclick="goTo(13)">Entradas</div>
      <div class="chip" onclick="goTo(13)">Postres</div>
      <div class="chip" onclick="goTo(13)">Bebidas</div>
    </div>
    <div class="menu-section">
      <div class="menu-section-title">Platos principales</div>
      ${menuItem(IMG.lomo, 'Lomo Saltado Andino', 'Carne de res al wok, papas fritas, tomate y ají amarillo', '34.00')}
      ${menuItem(IMG.cuy, 'Cuy al Horno', 'Cuy entero horneado con hierbas andinas y papas doradas', '48.00')}
      ${menuItem(IMG.seco, 'Seco de Cordero', 'Guiso de cordero con cilantro, frijoles y yuca frita', '38.00')}
      ${menuItem(IMG.rocoto, 'Rocoto Relleno', 'Rocoto arequipeño relleno de carne y queso gratinado', '32.00')}
    </div>
  </div>
  <div class="cart-fab" onclick="goTo(15)">
    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="#fff" stroke-width="1.9"><path d="M3 4h2l2.2 11.2a1 1 0 0 0 1 .8h8.6a1 1 0 0 0 1-.8L20 7H6"/><circle cx="9" cy="20" r="1.4"/><circle cx="18" cy="20" r="1.4"/></svg>
    Ver carrito (2) <span class="fab-total">S/ 68.00</span>
  </div>
</div>`; }

function menuItem(img, name, desc, price) {
  return `<div class="menu-item" onclick="goTo(14)">
    <div class="menu-item-info">
      <div class="menu-item-name">${name}</div>
      <div class="menu-item-desc">${desc}</div>
      <div class="menu-item-price">S/ ${price}</div>
    </div>
    <div class="menu-item-right">
      <div class="menu-item-img">${photo(img)}</div>
      <button class="add-btn" onclick="event.stopPropagation()">+</button>
    </div>
  </div>`;
}

function renderCategorias() { return `
<div class="app-screen scr-cats">
  ${statusBar()}
  ${appHeader('Menú · Rincón Andino', { back: 12 })}
  <div class="scroll-area">
    <div class="cats-grid">
      ${catCard(IMG.salad, 'Entradas', '8 platos')}
      ${catCard(IMG.lomo, 'Fondos', '14 platos')}
      ${catCard(IMG.picarones, 'Postres', '6 platos')}
      ${catCard(IMG.chicha, 'Bebidas', '12 opciones')}
      ${catCard(IMG.ceviche, 'Especiales', '5 platos')}
      ${catCard(IMG.pisco, 'Cócteles', '9 opciones')}
    </div>
    <div class="menu-section">
      <div class="menu-section-title">Fondos · más pedidos</div>
      ${menuItem(IMG.lomo, 'Lomo Saltado Andino', 'El clásico de la casa, al wok', '34.00')}
      ${menuItem(IMG.ajidegallina, 'Ají de Gallina', 'Crema de ají amarillo con pollo deshilachado', '28.00')}
    </div>
  </div>
  <div class="cart-fab" onclick="goTo(15)">
    <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="#fff" stroke-width="1.9"><path d="M3 4h2l2.2 11.2a1 1 0 0 0 1 .8h8.6a1 1 0 0 0 1-.8L20 7H6"/><circle cx="9" cy="20" r="1.4"/><circle cx="18" cy="20" r="1.4"/></svg>
    Ver carrito (2) <span class="fab-total">S/ 68.00</span>
  </div>
</div>`; }

function catCard(img, name, count) {
  return `<div class="cat-card" onclick="goTo(14)">
    <div class="cat-card-img">${photo(img)}</div>
    <div class="cat-card-name">${name}</div>
    <div class="cat-card-count">${count}</div>
  </div>`;
}

function renderProducto() { return `
<div class="app-screen scr-producto">
  <div class="product-cover">${photo(IMG.lomo)}
    <button class="float-btn left" onclick="goTo(12)">
      <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#1a1208" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 5-7 7 7 7"/></svg>
    </button>
    ${statusBar()}
  </div>
  <div class="scroll-area">
    <div class="product-info">
      <div class="product-top">
        <div class="product-name">Lomo Saltado Andino</div>
        <div class="product-rating">${ICON.star} 4.8</div>
      </div>
      <div class="product-price">S/ 34.00</div>
      <div class="product-desc">Deliciosa carne de res salteada al wok con papas fritas, tomate, cebolla morada y ají amarillo. Servido con arroz blanco recién hecho.</div>
    </div>
    <div class="option-section">
      <div class="option-title">Tamaño de porción</div>
      <div class="option-row">
        <div class="option-chip">Personal</div>
        <div class="option-chip selected">Familiar</div>
        <div class="option-chip">Para compartir</div>
      </div>
    </div>
    <div class="option-section">
      <div class="option-title">Extras <span class="opt-note">+S/ 5.00 c/u</span></div>
      <div class="option-row">
        <div class="option-chip selected">🥚 Huevo frito</div>
        <div class="option-chip">🥑 Palta</div>
        <div class="option-chip">🌶 Ají extra</div>
      </div>
    </div>
    <div class="option-section">
      <div class="option-title">Instrucciones especiales</div>
      <textarea class="input-field" rows="2" placeholder="Ej: Sin cebolla, término medio…"></textarea>
    </div>
  </div>
  <div class="product-foot">
    <div class="quantity-row">
      <button class="qty-btn">−</button>
      <span class="qty-num">2</span>
      <button class="qty-btn">+</button>
      <div class="qty-total">S/ 68.00</div>
    </div>
    <button class="btn-primary" onclick="goTo(15)">Agregar al carrito</button>
  </div>
</div>`; }

function renderCarrito() { return `
<div class="app-screen scr-cart">
  ${statusBar()}
  ${appHeader('Mi carrito', { back: 12 })}
  <div class="scroll-area">
    <div class="cart-shop">
      <div class="cart-shop-img">${photo(IMG.restAndino)}</div>
      <div><div class="cart-shop-name">Rincón Andino</div><div class="cart-shop-meta">${ICON.clock} 25-35 min · ${ICON.pin} 1.2 km</div></div>
    </div>
    <div class="cart-items">
      ${cartItem(IMG.lomo, 'Lomo Saltado Andino', 'Familiar · Huevo frito', '68.00', 2)}
      ${cartItem(IMG.seco, 'Seco de Cordero', 'Con yuca extra', '38.00', 1)}
    </div>
    <div class="coupon-input">
      <input class="input-field" placeholder="Código de descuento" value="RICODIA20">
      <button class="apply-btn">Aplicar</button>
    </div>
    <div class="cart-total-area">
      <div class="total-row"><span class="label">Subtotal</span><span class="value">S/ 106.00</span></div>
      <div class="total-row"><span class="label">Costo de envío</span><span class="value">S/ 3.50</span></div>
      <div class="total-row"><span class="label">Descuento · RICODIA20</span><span class="value green">−S/ 21.20</span></div>
      <div class="total-divider"></div>
      <div class="total-row big"><span class="label">Total</span><span class="value">S/ 88.30</span></div>
    </div>
  </div>
  <div class="bar-foot"><button class="btn-primary" onclick="goTo(16)">Ir a pagar · S/ 88.30</button></div>
</div>`; }

function cartItem(img, name, opts, price, qty) {
  return `<div class="cart-item">
    <div class="cart-item-img">${photo(img)}</div>
    <div class="cart-item-info">
      <div class="cart-item-name">${name}</div>
      <div class="cart-item-qty">${opts}</div>
      <div class="cart-item-price">S/ ${price}</div>
    </div>
    <div class="qty-stepper">
      <button class="qty-btn sm">−</button><span>${qty}</span><button class="qty-btn sm">+</button>
    </div>
  </div>`;
}

function renderDireccion() { return `
<div class="app-screen scr-addr">
  <div class="map-area">${mapSVG()}
    ${statusBar()}
    <button class="float-btn left" onclick="goTo(15)">
      <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#1a1208" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 5-7 7 7 7"/></svg>
    </button>
    <button class="locate-btn">
      <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#b85c2a" stroke-width="2"><circle cx="12" cy="12" r="3.5"/><path d="M12 2v3M12 19v3M2 12h3M19 12h3"/></svg>
    </button>
  </div>
  <div class="scroll-area">
    <div class="addr-form">
      <div class="addr-title">¿Dónde entregamos?</div>
      ${field('Calle / Avenida', 'Av. Larco 345, Miraflores')}
      ${field('Departamento / piso', '', 'text', 'Ej: Dpto 304, Piso 3')}
      ${field('Referencias', '', 'text', 'Ej: Frente al parque, edificio rojo')}
      <div class="addr-tags">
        <div class="chip active">🏠 Casa</div>
        <div class="chip">🏢 Oficina</div>
        <div class="chip">📍 Otro</div>
      </div>
      <button class="btn-primary" onclick="goTo(17)">Confirmar dirección</button>
    </div>
  </div>
</div>`; }

function renderResumen() { return `
<div class="app-screen scr-summary">
  ${statusBar()}
  ${appHeader('Resumen del pedido', { back: 16 })}
  <div class="scroll-area">
    <div class="summary-section">
      <div class="summary-section-title">Comercio</div>
      <div class="summary-shop">
        <div class="summary-shop-img">${photo(IMG.restAndino)}</div>
        <div><div class="summary-shop-name">Rincón Andino</div><div class="summary-shop-meta">${ICON.star} 4.8 · 25-35 min</div></div>
      </div>
    </div>
    <div class="summary-section">
      <div class="summary-section-title">Productos</div>
      <div class="summary-row"><span class="label">2× Lomo Saltado Andino</span><span class="value">S/ 68.00</span></div>
      <div class="summary-row"><span class="label">1× Seco de Cordero</span><span class="value">S/ 38.00</span></div>
    </div>
    <div class="summary-section">
      <div class="summary-section-title">Entrega</div>
      <div class="summary-row"><span class="label">${ICON.pin} Dirección</span><span class="value addr">Av. Larco 345, Miraflores</span></div>
      <div class="summary-row"><span class="label">${ICON.clock} Tiempo estimado</span><span class="value">25-35 min</span></div>
    </div>
    <div class="summary-section">
      <div class="summary-section-title">Costos</div>
      <div class="summary-row"><span class="label">Subtotal</span><span class="value">S/ 106.00</span></div>
      <div class="summary-row"><span class="label">Envío</span><span class="value">S/ 3.50</span></div>
      <div class="summary-row"><span class="label">Descuento</span><span class="value green">−S/ 21.20</span></div>
      <div class="summary-row total"><span>Total</span><span>S/ 88.30</span></div>
    </div>
  </div>
  <div class="bar-foot"><button class="btn-primary" onclick="goTo(18)">Seleccionar método de pago</button></div>
</div>`; }

function renderPago() { return `
<div class="app-screen scr-pay">
  ${statusBar()}
  ${appHeader('Método de pago', { back: 17 })}
  <div class="scroll-area">
    <div class="pay-list">
      ${payOpt('cash', 'Efectivo', 'Paga al repartidor', true, '#3ecf8e')}
      ${payOpt('yape', 'Yape', '+51 ••• ••• 321', false, '#6c2bd9')}
      ${payOpt('plin', 'Plin', 'Pago instantáneo', false, '#00b3a4')}
      ${payOpt('card', 'Tarjeta', 'Visa •••• 4521', false, '#1a1f71')}
    </div>
    <div class="pay-summary">
      <div class="pay-summary-title">Resumen de pago</div>
      <div class="summary-row"><span class="label">Total a pagar</span><span class="value big-primary">S/ 88.30</span></div>
    </div>
  </div>
  <div class="bar-foot"><button class="btn-primary" onclick="goTo(19)">Confirmar pedido</button></div>
</div>`; }

function payOpt(id, name, desc, sel, color) {
  const logos = {
    cash: '<svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="#fff" stroke-width="1.8"><rect x="2" y="6" width="20" height="12" rx="2"/><circle cx="12" cy="12" r="2.5"/></svg>',
    yape: '<span class="pay-word">Y</span>',
    plin: '<span class="pay-word">P</span>',
    card: '<svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="#fff" stroke-width="1.8"><rect x="2" y="5" width="20" height="14" rx="2"/><path d="M2 9h20"/></svg>',
  };
  return `<div class="pay-opt${sel ? ' selected' : ''}">
    <div class="pay-logo" style="background:${color};">${logos[id]}</div>
    <div class="pay-info"><div class="pay-name">${name}</div><div class="pay-desc">${desc}</div></div>
    <div class="pay-radio${sel ? ' sel' : ''}"></div>
  </div>`;
}

function renderConfirmacion() { return `
<div class="app-screen scr-confirm">
  ${statusBar()}
  <div class="confirm-wrap">
    <div class="success-circle pop">
      <svg viewBox="0 0 24 24" width="46" height="46" fill="none" stroke="#fff" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"><path d="m4 13 5 5L20 6"/></svg>
    </div>
    <div class="confirm-title">¡Pedido confirmado!</div>
    <div class="confirm-sub">Tu pedido fue enviado a<br><strong>Rincón Andino</strong></div>
    <div class="order-code">RA-7291-MG</div>
    <div class="confirm-card">
      <div class="cc-row"><span>${ICON.clock} Tiempo estimado</span><strong>30-40 min</strong></div>
      <div class="cc-row"><span>${ICON.pin} Entregar en</span><strong class="addr">Av. Larco 345</strong></div>
      <div class="cc-row"><span>💵 Total</span><strong class="primary">S/ 88.30</strong></div>
    </div>
    <button class="btn-primary" onclick="goTo(20)">Seguir pedido en tiempo real</button>
    <button class="btn-secondary" onclick="goTo(7)">Volver al inicio</button>
  </div>
</div>`; }

function renderSeguimiento() { return `
<div class="app-screen scr-track">
  <div class="track-map">${mapSVG()}
    ${statusBar()}
    ${appHeader('Seguimiento', { back: 19, right: '<span class="track-eta">En camino</span>' })}
  </div>
  <div class="scroll-area">
    <div class="track-progress">
      <div class="progress-steps">
        <div class="progress-line"><div class="progress-fill" style="width:66%"></div></div>
        ${progStep('done', 'Recibido')}
        ${progStep('done', 'Preparando')}
        ${progStep('active', 'En camino', true)}
        ${progStep('', 'Entregado')}
      </div>
      <div class="track-eta-text">Llega en <strong>~18 minutos</strong></div>
    </div>
    <div class="rider-card">
      <div class="rider-avatar">${photo(IMG.carlos)}</div>
      <div class="rider-info">
        <div class="rider-name">Carlos Mamani</div>
        <div class="rider-sub">${ICON.moto} Moto · ABC-4521</div>
        <div class="rider-stars">${ICON.star} 4.9</div>
      </div>
      <div class="rider-actions">
        <button class="rider-btn" onclick="goTo(38)"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#b85c2a" stroke-width="1.8"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg></button>
        <button class="rider-btn"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#b85c2a" stroke-width="1.8"><path d="M22 16.9v3a2 2 0 0 1-2.2 2 19.8 19.8 0 0 1-8.6-3 19.5 19.5 0 0 1-6-6 19.8 19.8 0 0 1-3-8.6A2 2 0 0 1 4.1 2h3a2 2 0 0 1 2 1.7c.1 1 .4 1.9.7 2.8a2 2 0 0 1-.5 2.1L8.1 9.9a16 16 0 0 0 6 6l1.3-1.3a2 2 0 0 1 2.1-.4c.9.3 1.8.6 2.8.7a2 2 0 0 1 1.7 2z"/></svg></button>
      </div>
    </div>
    <div class="track-order">
      <div class="track-order-img">${photo(IMG.restAndino)}</div>
      <div><div class="track-order-name">Rincón Andino</div><div class="track-order-items">2× Lomo Saltado · 1× Seco de Cordero</div></div>
    </div>
    <div class="bar-foot inline"><button class="btn-secondary" onclick="goTo(37)">¿Problemas con tu pedido?</button></div>
  </div>
</div>`; }

function progStep(state, label, dot) {
  const inner = state === 'done'
    ? '<svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="#fff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><path d="m5 13 4 4L19 7"/></svg>'
    : state === 'active' ? ICON.moto : '';
  return `<div class="prog-step">
    <div class="prog-circle ${state}">${inner}</div>
    <div class="prog-label">${label}</div>
  </div>`;
}

function renderCalificacion() { return `
<div class="app-screen scr-rate">
  ${statusBar()}
  ${appHeader('¿Cómo estuvo?', { back: 22 })}
  <div class="scroll-area">
    <div class="rate-wrap">
      <div class="rate-lead">Tu opinión nos ayuda a mejorar</div>
      <div class="rate-card">
        <div class="rate-head">
          <div class="rate-avatar">${photo(IMG.restAndino)}</div>
          <div><div class="rate-name">Rincón Andino</div><div class="rate-role">Califica el restaurante</div></div>
        </div>
        <div class="stars-row">${stars(5)}</div>
      </div>
      <div class="rate-card">
        <div class="rate-head">
          <div class="rate-avatar">${photo(IMG.carlos)}</div>
          <div><div class="rate-name">Carlos Mamani</div><div class="rate-role">Califica al repartidor</div></div>
        </div>
        <div class="stars-row">${stars(5)}</div>
      </div>
      <div class="rate-chips">
        <div class="chip active">🔥 Comida caliente</div>
        <div class="chip active">⚡ Entrega rápida</div>
        <div class="chip">📦 Buen empaque</div>
        <div class="chip">😊 Amable</div>
      </div>
      <div class="field">
        <div class="input-label">Comentario (opcional)</div>
        <textarea class="input-field" rows="3" placeholder="Cuéntanos más sobre tu experiencia…">La comida llegó caliente y Carlos fue muy amable.</textarea>
      </div>
      <button class="btn-primary" onclick="goTo(22)">Enviar calificación</button>
    </div>
  </div>
</div>`; }

function stars(lit) {
  let s = '';
  for (let i = 1; i <= 5; i++)
    s += `<span class="star${i <= lit ? ' lit' : ''}"><svg viewBox="0 0 24 24" width="30" height="30" fill="${i <= lit ? '#f5a623' : 'none'}" stroke="${i <= lit ? '#f5a623' : '#d8cfc2'}" stroke-width="1.5"><path d="M12 2l2.9 6.3 6.9.7-5.1 4.6 1.4 6.8L12 17.8 5.9 20.4l1.4-6.8L2.2 9l6.9-.7z"/></svg></span>`;
  return s;
}

function renderHistorial() { return `
<div class="app-screen scr-orders">
  ${statusBar()}
  ${appHeader('Mis pedidos', { back: false })}
  <div class="chip-row" style="padding:0 16px 12px;">
    <div class="chip active">Todos</div><div class="chip">En curso</div>
    <div class="chip">Entregados</div><div class="chip">Cancelados</div>
  </div>
  <div class="scroll-area">
    ${histItem(IMG.restAndino, 'Rincón Andino', 'Hoy, 7:45 PM · 3 productos', '88.30', 'En camino', 'orange', 23)}
    ${histItem(IMG.tacos, 'Taquería del Valle', 'Ayer, 12:30 PM · 2 productos', '42.00', 'Entregado', 'green', 23)}
    ${histItem(IMG.sushi, 'Sakura Nikkei', '14 may · 5 productos', '135.00', 'Entregado', 'green', 23)}
    ${histItem(IMG.pizza, 'Pizza House', '10 may · 1 producto', '38.00', 'Cancelado', 'red', 23)}
  </div>
  ${bottomNav('orders')}
</div>`; }

function histItem(img, name, date, total, status, color, to) {
  return `<div class="order-hist-item" onclick="goTo(${to})">
    <div class="hist-img">${photo(img)}</div>
    <div class="hist-info">
      <div class="hist-name">${name}</div>
      <div class="hist-date">${date}</div>
      <div class="hist-total">S/ ${total}</div>
    </div>
    <span class="badge badge-${color}">${status}</span>
  </div>`;
}

function renderPedidoPasado() { return `
<div class="app-screen scr-past">
  ${statusBar()}
  ${appHeader('Detalle del pedido', { back: 22 })}
  <div class="scroll-area">
    <div class="past-hero">
      <div class="past-hero-img">${photo(IMG.restAndino)}</div>
      <div class="past-hero-info">
        <div class="past-hero-name">Rincón Andino</div>
        <div class="past-hero-code">Pedido RA-6620-MG</div>
        <span class="badge badge-green">Entregado</span>
      </div>
    </div>
    <div class="summary-section">
      <div class="summary-section-title">Productos</div>
      ${pastItem(IMG.lomo, '2× Lomo Saltado Andino', 'Familiar · Huevo frito', '68.00')}
      ${pastItem(IMG.seco, '1× Seco de Cordero', 'Con yuca extra', '38.00')}
    </div>
    <div class="summary-section">
      <div class="summary-section-title">Entrega y pago</div>
      <div class="summary-row"><span class="label">${ICON.pin} Dirección</span><span class="value addr">Av. Larco 345, Miraflores</span></div>
      <div class="summary-row"><span class="label">📅 Fecha</span><span class="value">14 may 2026, 7:45 PM</span></div>
      <div class="summary-row"><span class="label">💵 Pago</span><span class="value">Efectivo</span></div>
      <div class="summary-row total"><span>Total</span><span>S/ 88.30</span></div>
    </div>
  </div>
  <div class="bar-foot two"><button class="btn-secondary" onclick="goTo(21)">Calificar</button><button class="btn-primary" onclick="goTo(15)">Volver a pedir</button></div>
</div>`; }

function pastItem(img, name, opts, price) {
  return `<div class="past-item">
    <div class="past-item-img">${photo(img)}</div>
    <div class="past-item-info"><div class="past-item-name">${name}</div><div class="past-item-opts">${opts}</div></div>
    <div class="past-item-price">S/ ${price}</div>
  </div>`;
}

function renderFavoritos() { return `
<div class="app-screen scr-fav">
  ${statusBar()}
  ${appHeader('Favoritos', { back: 33 })}
  <div class="chip-row" style="padding:0 16px 12px;">
    <div class="chip active">Restaurantes</div><div class="chip">Platos</div>
  </div>
  <div class="scroll-area">
    <div class="fav-grid">
      ${favCard(IMG.restAndino, 'Rincón Andino', 'Cocina Andina', '4.8')}
      ${favCard(IMG.restMar, 'La Bahía Miraflores', 'Mariscos', '4.9')}
      ${favCard(IMG.restParrilla, 'La Parrilla del Chef', 'Parrilla', '4.6')}
      ${favCard(IMG.sushi, 'Sakura Nikkei', 'Nikkei', '4.9')}
    </div>
  </div>
  ${bottomNav('profile')}
</div>`; }

function favCard(img, name, type, rating) {
  return `<div class="fav-card" onclick="goTo(12)">
    <div class="fav-card-img">${photo(img)}<button class="fav-heart">${ICON.heart}</button></div>
    <div class="fav-card-name">${name}</div>
    <div class="fav-card-meta">${ICON.star} ${rating} · ${type}</div>
  </div>`;
}
