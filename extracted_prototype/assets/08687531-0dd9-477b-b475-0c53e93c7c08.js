/* ===========================================================
   RESERVA DE MESA — 25 Lista · 26 Detalle · 27 Formulario
   28 Confirmación · 29 Activa+QR · 30 Historial
   31 Modificar · 32 Cancelar
   =========================================================== */

function renderReservaLista() { return `
<div class="app-screen scr-rlist">
  ${statusBar()}
  ${appHeader('Reservar mesa', { back: 7, right: `<div class="hdr-ic" onclick="goTo(9)">${mapIcon(20)}</div>` })}
  <div class="chip-row" style="padding:0 16px 12px;">
    <div class="chip active">Todos</div><div class="chip">Andina</div>
    <div class="chip">Mariscos</div><div class="chip">Parrilla</div><div class="chip">Fusión</div>
  </div>
  <div class="scroll-area">
    ${restCard(IMG.restAndino, 'Rincón Andino', 'Cocina Andina', '4.8', '342', '$$', '8:00 PM', 'Mesas disponibles', 'avail')}
    ${restCard(IMG.restMar, 'La Bahía Miraflores', 'Mariscos', '4.9', '518', '$$$', '7:30 PM', '3 mesas disponibles', 'avail')}
    ${restCard(IMG.restParrilla, 'La Parrilla del Chef', 'Parrilla', '4.6', '204', '$$', '9:00 PM', 'Últimas mesas', 'low')}
  </div>
  ${bottomNav('orders')}
</div>`; }

function restCard(img, name, type, rating, reviews, price, time, avail, state) {
  return `<div class="rest-card" onclick="goTo(26)">
    <div class="rest-card-cover">${photo(img)}<span class="rest-price">${price}</span></div>
    <div class="rest-card-body">
      <div class="rest-card-top">
        <div class="rest-card-name">${name}</div>
        <div class="rest-card-rate">${ICON.star} ${rating}</div>
      </div>
      <div class="rest-card-meta">${type} · ${reviews} reseñas</div>
      <div class="rest-card-avail ${state}">
        <span class="avail-dot"></span> Próximo turno ${time} · ${avail}
      </div>
      <button class="rest-card-btn" onclick="event.stopPropagation();goTo(27)">Reservar mesa</button>
    </div>
  </div>`;
}

function renderReservaDetalle() { return `
<div class="app-screen scr-rdetail">
  <div class="rest-cover">${photo(IMG.restAndino)}
    <div class="cover-fade"></div>
    <button class="float-btn left" onclick="goTo(25)">
      <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 5-7 7 7 7"/></svg>
    </button>
    <div class="cover-actions">
      <button class="float-btn" style="color:#fff;" onclick="goTo(24)">${ICON.heart}</button>
      <button class="float-btn" style="color:#fff;">${ICON.share}</button>
    </div>
    ${statusBar(true)}
  </div>
  <div class="scroll-area">
    <div class="gallery-row">
      ${[IMG.restWarm, IMG.cuy, IMG.pisco, IMG.restPatio].map(g => `<div class="gallery-thumb">${photo(g)}</div>`).join('')}
    </div>
    <div class="rest-detail-info">
      <div class="rdetail-head">
        <div class="rest-detail-name">Rincón Andino</div>
        <span class="badge badge-green">Abierto</span>
      </div>
      <div class="detail-pills">
        <div class="detail-pill">${ICON.star} 4.8 (342)</div>
        <div class="detail-pill">🍽 Andina</div>
        <div class="detail-pill">$$ Precio medio</div>
        <div class="detail-pill">${ICON.clock} 12pm–11pm</div>
      </div>
      <div class="rest-detail-desc">Restaurante tradicional andino con más de 20 años ofreciendo los sabores auténticos de la sierra peruana. Especialistas en cuy al horno, lomo saltado y chicha morada artesanal.</div>
    </div>
    <div class="reviews-block">
      <div class="reviews-title">Reseñas recientes</div>
      ${review(IMG.ana, 'Ana Castro', 5, 'hace 2 días', 'El cuy al horno es espectacular. Ambiente cálido y servicio muy atento.')}
      ${review(IMG.luis, 'Luis Mendoza', 4, 'hace 1 semana', 'Muy buena sazón, porciones generosas. El lomo saltado es de los mejores de Lima.')}
    </div>
    <div class="map-static">${mapSVG()}<div class="map-addr">${ICON.pin} Av. Petit Thouars 234, Miraflores</div></div>
  </div>
  <div class="bar-foot"><button class="btn-primary" onclick="goTo(27)">Reservar mesa</button></div>
</div>`; }

function review(img, name, rating, time, text) {
  let st = '';
  for (let i = 1; i <= 5; i++) st += `<span style="color:${i <= rating ? '#f5a623' : '#d8cfc2'}">★</span>`;
  return `<div class="review-item">
    <div class="review-header">
      <div class="review-avatar">${photo(img)}</div>
      <div class="review-name">${name}</div>
      <span class="review-stars">${st}</span>
      <span class="review-time">${time}</span>
    </div>
    <div class="review-text">${text}</div>
  </div>`;
}

function renderReservaForm() { return `
<div class="app-screen scr-rform">
  ${statusBar()}
  ${appHeader('Nueva reserva', { back: 26 })}
  <div class="step-indicator">
    ${stepDot('done', '✓', 'Fecha')}${stepLine(true)}
    ${stepDot('active', '2', 'Hora')}${stepLine(false)}
    ${stepDot('', '3', 'Personas')}${stepLine(false)}
    ${stepDot('', '4', 'Datos')}
  </div>
  <div class="scroll-area">
    <div class="form-block done-block">
      <div class="form-block-title done">✓ Fecha seleccionada</div>
      <div class="picked-row">📅
        <div><div class="picked-main">Viernes, 16 de mayo 2026</div><div class="picked-sub">Disponible</div></div>
        <span class="change-link">Cambiar</span>
      </div>
    </div>
    <div class="form-block">
      <div class="form-block-title">Paso 2 — Selecciona la hora</div>
      <div class="time-grid">
        ${timeSlot('6:00 PM', 'full')}${timeSlot('6:30 PM', 'full')}${timeSlot('7:00 PM', '', '4 mesas')}
        ${timeSlot('7:30 PM', '', '6 mesas')}${timeSlot('8:00 PM', 'selected', 'Elegido')}${timeSlot('8:30 PM', '', '5 mesas')}
        ${timeSlot('9:00 PM', '', '3 mesas')}${timeSlot('9:30 PM', '', '2 mesas')}${timeSlot('10:00 PM', 'full')}
      </div>
    </div>
    <div class="form-block muted">
      <div class="form-block-title">Paso 3 — Número de personas</div>
      <div class="people-selector">
        <button class="people-btn">−</button><span class="people-num">4</span><button class="people-btn">+</button>
      </div>
      <div class="people-hint">Máximo 8 personas por reserva en este turno</div>
    </div>
  </div>
  <div class="bar-foot"><button class="btn-primary" onclick="goTo(28)">Siguiente</button></div>
</div>`; }

function stepDot(state, label, name) {
  return `<div class="step-wrap"><div class="step-dot ${state}">${label}</div><div class="step-name">${name}</div></div>`;
}
function stepLine(done) { return `<div class="step-line${done ? ' done' : ''}"></div>`; }
function timeSlot(t, state = '', note = '') {
  return `<div class="time-slot ${state}">${t}${note || state === 'full' ? `<span class="ts-note">${state === 'full' ? 'Agotado' : note}</span>` : ''}</div>`;
}

function renderReservaConfirm() { return `
<div class="app-screen scr-rconfirm">
  ${statusBar()}
  <div class="resv-confirm">
    <div class="success-circle pop brand">
      <svg viewBox="0 0 48 48" width="44" height="44" fill="none"><path d="M4 40 L16 16 L24 30 L31 12 L44 40 Z" fill="#fff"/><path d="M16 16 L24 30 L20 40 H4 Z" fill="#f0c060"/></svg>
    </div>
    <div class="confirm-title">¡Reserva confirmada!</div>
    <div class="confirm-sub">Tu mesa está reservada en<br><strong>Rincón Andino</strong></div>
    <div class="resv-code">RES-2847-XK</div>
    <div class="resv-detail-card">
      ${resvRow('📅', 'Fecha', 'Viernes, 16 mayo 2026')}
      ${resvRow('🕐', 'Hora', '8:00 PM')}
      ${resvRow('👥', 'Personas', '4 personas')}
      ${resvRow('🎂', 'Ocasión', 'Cumpleaños', true)}
    </div>
    <button class="btn-primary" onclick="goTo(29)">Ver mi reserva</button>
    <button class="btn-secondary" onclick="goTo(30)">Mis reservas</button>
  </div>
</div>`; }

function resvRow(icon, label, value, last) {
  return `<div class="resv-detail-row${last ? ' last' : ''}">
    <div class="resv-detail-icon">${icon}</div>
    <div class="resv-detail-info"><div class="resv-detail-label">${label}</div><div class="resv-detail-value">${value}</div></div>
  </div>`;
}

function renderReservaActiva() { return `
<div class="app-screen scr-ractive">
  ${statusBar()}
  ${appHeader('Mi reserva', { back: 30, right: '<span class="resv-status-badge status-confirmed">Confirmada</span>' })}
  <div class="scroll-area">
    <div class="qr-area">
      <div class="qr-lead">Muestra este código en el restaurante</div>
      <div class="qr-code">${qrSVG(150)}</div>
      <div class="qr-label">RES-2847-XK</div>
    </div>
    <div class="resv-detail-card flat">
      ${resvRow('🏔', 'Restaurante', 'Rincón Andino')}
      ${resvRow('📅', 'Fecha y hora', 'Viernes, 16 mayo · 8:00 PM')}
      ${resvRow('👥', 'Personas', '4 personas')}
      ${resvRow('👤', 'Titular', 'María García')}
      ${resvRow('🎂', 'Ocasión', 'Cumpleaños', true)}
    </div>
    <div class="policy-box">
      <div class="policy-title">📋 Política de cancelación</div>
      Puedes cancelar sin costo hasta <strong>2 horas antes</strong> de tu reserva. Cancelaciones tardías pueden generar cargos.
    </div>
    <div class="bar-foot inline two">
      <button class="btn-secondary" onclick="goTo(31)">Modificar</button>
      <button class="cancel-btn" onclick="goTo(32)">Cancelar reserva</button>
    </div>
  </div>
</div>`; }

function renderHistorialReservas() { return `
<div class="app-screen scr-rhist">
  ${statusBar()}
  ${appHeader('Mis reservas', { back: false })}
  <div class="chip-row" style="padding:0 16px 12px;">
    <div class="chip active">Todas</div><div class="chip">Activas</div>
    <div class="chip">Pasadas</div><div class="chip">Canceladas</div>
  </div>
  <div class="scroll-area">
    ${resvHist(IMG.restAndino, 'Rincón Andino', 'Vie 16 may · 8:00 PM · 4 pers.', 'RES-2847-XK', 'Confirmada', 'confirmed', 29)}
    ${resvHist(IMG.restMar, 'La Bahía Miraflores', 'Sáb 10 may · 7:30 PM · 2 pers.', 'RES-1923-AB', 'Completada', 'confirmed', 29)}
    ${resvHist(IMG.restParrilla, 'La Parrilla del Chef', 'Dom 4 may · 9:00 PM · 6 pers.', 'RES-0412-CD', 'Pendiente', 'pending', 29)}
    ${resvHist(IMG.restBar, 'Vino & Mar', 'Mié 30 abr · 8:30 PM · 3 pers.', 'RES-8834-EF', 'Cancelada', 'cancelled', 29)}
  </div>
  ${bottomNav('orders')}
</div>`; }

function resvHist(img, name, date, code, status, cls, to) {
  return `<div class="resv-hist-item" onclick="goTo(${to})">
    <div class="resv-hist-img">${photo(img)}</div>
    <div class="resv-hist-info">
      <div class="resv-hist-name">${name}</div>
      <div class="resv-hist-date">${date}</div>
      <div class="resv-hist-code">${code}</div>
    </div>
    <span class="resv-status-badge status-${cls}">${status}</span>
  </div>`;
}

function renderModificar() { return `
<div class="app-screen scr-rmod">
  ${statusBar()}
  ${appHeader('Modificar reserva', { back: 29 })}
  <div class="scroll-area">
    <div class="mod-banner">Editando reserva <strong>RES-2847-XK</strong> · Rincón Andino</div>
    <div class="form-block">
      <div class="form-block-title">Fecha</div>
      <div class="cal-header">${['L','M','M','J','V','S','D'].map(d => `<div class="cal-day-name">${d}</div>`).join('')}</div>
      <div class="calendar-grid">${calendarDays(16)}</div>
    </div>
    <div class="form-block">
      <div class="form-block-title">Hora</div>
      <div class="time-grid">
        ${timeSlot('7:00 PM', '', '4 mesas')}${timeSlot('7:30 PM', '', '6 mesas')}${timeSlot('8:00 PM', 'selected', 'Actual')}
        ${timeSlot('8:30 PM', '', '5 mesas')}${timeSlot('9:00 PM', '', '3 mesas')}${timeSlot('9:30 PM', '', '2 mesas')}
      </div>
    </div>
    <div class="form-block">
      <div class="form-block-title">Personas</div>
      <div class="people-selector"><button class="people-btn">−</button><span class="people-num">4</span><button class="people-btn">+</button></div>
    </div>
  </div>
  <div class="bar-foot two"><button class="btn-secondary" onclick="goTo(29)">Descartar</button><button class="btn-primary" onclick="goTo(29)">Guardar cambios</button></div>
</div>`; }

function calendarDays(sel) {
  let html = '';
  for (let i = 0; i < 2; i++) html += '<div class="cal-day empty"></div>';
  for (let d = 1; d <= 31; d++) {
    const cls = d < 10 ? 'unavail' : d === sel ? 'selected' : d === 12 ? 'today' : '';
    html += `<div class="cal-day ${cls}">${d}</div>`;
  }
  return html;
}

function renderCancelar() { return `
<div class="app-screen scr-rcancel">
  ${statusBar()}
  ${appHeader('Cancelar reserva', { back: 29 })}
  <div class="scroll-area">
    <div class="cancel-warn">
      <div class="cancel-warn-ic">
        <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="#d4600a" stroke-width="1.8"><path d="M12 9v4M12 17h.01"/><path d="M10.3 3.9 1.8 18a2 2 0 0 0 1.7 3h17a2 2 0 0 0 1.7-3L13.7 3.9a2 2 0 0 0-3.4 0z"/></svg>
      </div>
      <div class="cancel-warn-title">¿Seguro que quieres cancelar?</div>
      <div class="cancel-warn-text">Tu reserva en <strong>Rincón Andino</strong> para el viernes 16 mayo, 8:00 PM se cancelará. Esta acción no se puede deshacer.</div>
    </div>
    <div class="form-block">
      <div class="form-block-title">Motivo de cancelación</div>
      <div class="reason-list">
        ${reason('Cambio de planes', true)}
        ${reason('Reservé en otro lugar', false)}
        ${reason('Demasiadas personas / pocas', false)}
        ${reason('Otro motivo', false)}
      </div>
    </div>
    <div class="policy-box">
      <div class="policy-title">📋 Política</div>
      Estás cancelando con más de 2 horas de anticipación, por lo que <strong>no se aplicará ningún cargo</strong>.
    </div>
  </div>
  <div class="bar-foot two"><button class="btn-secondary" onclick="goTo(29)">No cancelar</button><button class="cancel-btn solid" onclick="goTo(30)">Confirmar cancelación</button></div>
</div>`; }

function reason(text, sel) {
  return `<label class="reason-row${sel ? ' sel' : ''}"><span class="reason-radio${sel ? ' sel' : ''}"></span>${text}</label>`;
}
