/* ===========================================================
   CUENTA — 33 Perfil · 34 Editar · 35 Direcciones
   36 Agregar dirección · 37 Ayuda · 38 Chat soporte
   ESTADOS — 39 Sin conexión · 40 Estado vacío
   =========================================================== */

function renderPerfil() { return `
<div class="app-screen scr-profile">
  <div class="profile-hero">
    ${statusBar(true)}
    <div class="profile-avatar">${photo(IMG.maria)}</div>
    <div class="profile-name">María García</div>
    <div class="profile-email">maria.garcia@email.com</div>
    <div class="profile-stats">
      ${pStat('18', 'Pedidos')}${pDiv()}${pStat('5', 'Reservas')}${pDiv()}${pStat('240', 'Puntos')}
    </div>
    <button class="edit-profile-btn" onclick="goTo(34)">Editar perfil</button>
  </div>
  <div class="scroll-area">
    <div class="profile-menu">
      ${pItem(pinIc(), 'Mis direcciones', 35)}
      ${pItem(cardIc(), 'Métodos de pago', 18)}
      ${pItem(heartIc(), 'Favoritos', 24)}
      ${pItem(tagMini(), 'Cupones y promociones', 11)}
      ${pItem(bellIc(), 'Notificaciones', 10)}
      ${pItem(helpIc(), 'Ayuda y soporte', 37)}
      ${pItem(lockIc(), 'Privacidad y seguridad', 33)}
    </div>
    <div class="profile-menu" style="margin-top:10px;">
      <div class="profile-item danger" onclick="goTo(1)">
        <span class="profile-item-icon">${outIc()}</span>
        <span class="profile-item-label">Cerrar sesión</span>
      </div>
    </div>
    <div class="app-version">Rincón Andino · v2.4.1</div>
  </div>
  ${bottomNav('profile')}
</div>`; }

function pStat(n, l) { return `<div class="p-stat"><div class="p-stat-n">${n}</div><div class="p-stat-l">${l}</div></div>`; }
function pDiv() { return '<div class="p-stat-div"></div>'; }
function pItem(icon, label, to) {
  return `<div class="profile-item" onclick="goTo(${to})">
    <span class="profile-item-icon">${icon}</span>
    <span class="profile-item-label">${label}</span>
    <svg class="profile-item-arrow" viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#bcae9e" stroke-width="2"><path d="m9 6 6 6-6 6"/></svg>
  </div>`;
}

function renderEditarPerfil() { return `
<div class="app-screen scr-edit">
  ${statusBar()}
  ${appHeader('Editar perfil', { back: 33 })}
  <div class="scroll-area">
    <div class="edit-avatar-wrap">
      <div class="edit-avatar">${photo(IMG.maria)}
        <button class="edit-cam">
          <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#fff" stroke-width="1.8"><path d="M3 8a2 2 0 0 1 2-2h2l1.5-2h7L19 6h2a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" transform="translate(-1 0)"/><circle cx="11" cy="12" r="3.2"/></svg>
        </button>
      </div>
      <div class="edit-avatar-hint">Toca para cambiar tu foto</div>
    </div>
    <div class="edit-form">
      ${field('Nombre completo', 'María García')}
      ${field('Teléfono', '+51 987 654 321')}
      ${field('Correo electrónico', 'maria.garcia@email.com')}
      ${field('Fecha de nacimiento', '12/03/1994')}
      <div class="field">
        <div class="input-label">Género</div>
        <div class="chip-row" style="padding:0;">
          <div class="chip active">Femenino</div><div class="chip">Masculino</div><div class="chip">Prefiero no decir</div>
        </div>
      </div>
    </div>
  </div>
  <div class="bar-foot"><button class="btn-primary" onclick="goTo(33)">Guardar cambios</button></div>
</div>`; }

function renderDirecciones() { return `
<div class="app-screen scr-addrs">
  ${statusBar()}
  ${appHeader('Mis direcciones', { back: 33 })}
  <div class="scroll-area">
    <div class="addr-list">
      ${addrCard('🏠', 'Casa', 'Av. Larco 345, Dpto 304', 'Miraflores, Lima', true)}
      ${addrCard('🏢', 'Trabajo', 'Av. Javier Prado 1520, Piso 8', 'San Isidro, Lima', false)}
      ${addrCard('📍', 'Casa de mamá', 'Jr. Las Begonias 210', 'Surco, Lima', false)}
    </div>
    <button class="add-addr-btn" onclick="goTo(36)">
      <svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="#b85c2a" stroke-width="2"><path d="M12 5v14M5 12h14"/></svg>
      Agregar nueva dirección
    </button>
  </div>
</div>`; }

function addrCard(icon, label, line1, line2, primary) {
  return `<div class="addr-card">
    <div class="addr-card-ic">${icon}</div>
    <div class="addr-card-info">
      <div class="addr-card-label">${label} ${primary ? '<span class="badge badge-green">Principal</span>' : ''}</div>
      <div class="addr-card-line">${line1}</div>
      <div class="addr-card-sub">${line2}</div>
    </div>
    <div class="addr-card-actions">
      <button class="addr-act" onclick="goTo(36)"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#7a6f65" stroke-width="1.8"><path d="M12 20h9"/><path d="M16.5 3.5a2.1 2.1 0 0 1 3 3L7 19l-4 1 1-4z"/></svg></button>
      <button class="addr-act"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#ff5c5c" stroke-width="1.8"><path d="M3 6h18M8 6V4h8v2M6 6l1 14h10l1-14"/></svg></button>
    </div>
  </div>`;
}

function renderAgregarDireccion() { return `
<div class="app-screen scr-addaddr">
  <div class="map-area short">${mapSVG()}
    ${statusBar()}
    <button class="float-btn left" onclick="goTo(35)">
      <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#1a1208" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 5-7 7 7 7"/></svg>
    </button>
  </div>
  <div class="scroll-area">
    <div class="addr-form">
      <div class="addr-title">Nueva dirección</div>
      ${field('Nombre de la dirección', '', 'text', 'Ej: Casa, Trabajo…')}
      ${field('Calle / Avenida', '', 'text', 'Ej: Av. Larco')}
      <div class="field-row">
        ${field('Número', '', 'text', '345')}
        ${field('Dpto / piso', '', 'text', 'Dpto 304')}
      </div>
      ${field('Distrito', '', 'text', 'Miraflores')}
      ${field('Referencia', '', 'text', 'Frente al parque')}
      <div class="addr-tags">
        <div class="chip active">🏠 Casa</div><div class="chip">🏢 Trabajo</div><div class="chip">📍 Otro</div>
      </div>
    </div>
  </div>
  <div class="bar-foot"><button class="btn-primary" onclick="goTo(35)">Guardar dirección</button></div>
</div>`; }

function renderAyuda() { return `
<div class="app-screen scr-help">
  ${statusBar()}
  ${appHeader('Ayuda y soporte', { back: 33 })}
  <div class="scroll-area">
    <div class="help-hero">
      <div class="help-hero-title">¿En qué te ayudamos?</div>
      <div class="search-bar inpage" style="margin-top:10px;">
        <svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#7a6f65" stroke-width="2"><circle cx="11" cy="11" r="7"/><path d="m20 20-3.5-3.5"/></svg>
        <input placeholder="Busca tu pregunta…">
      </div>
    </div>
    <div class="help-cats">
      ${helpCat('📦', 'Pedidos', 'Estado, cambios, problemas')}
      ${helpCat('💳', 'Pagos', 'Cobros, reembolsos, métodos')}
      ${helpCat('🍽', 'Reservas', 'Crear, modificar, cancelar')}
      ${helpCat('👤', 'Cuenta', 'Datos, contraseña, privacidad')}
    </div>
    <div class="faq-block">
      <div class="faq-title">Preguntas frecuentes</div>
      ${faq('¿Cómo cancelo un pedido en curso?')}
      ${faq('¿Cuánto demora un reembolso?')}
      ${faq('¿Puedo cambiar mi dirección después de pedir?')}
    </div>
    <div class="help-contact">
      <button class="btn-primary" onclick="goTo(38)">💬 Chat en vivo</button>
      <button class="btn-secondary">📞 Llamar a soporte</button>
    </div>
  </div>
</div>`; }

function helpCat(icon, title, desc) {
  return `<div class="help-cat" onclick="goTo(38)">
    <div class="help-cat-ic">${icon}</div>
    <div class="help-cat-title">${title}</div>
    <div class="help-cat-desc">${desc}</div>
  </div>`;
}
function faq(q) {
  return `<div class="faq-item"><span>${q}</span><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#bcae9e" stroke-width="2"><path d="m9 6 6 6-6 6"/></svg></div>`;
}

function renderChat() { return `
<div class="app-screen scr-chat">
  ${statusBar()}
  <div class="chat-header">
    <button class="back-btn" onclick="goTo(37)"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="#1a1208" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 5-7 7 7 7"/></svg></button>
    <div class="chat-agent">
      <div class="chat-agent-av">${photo(IMG.sofia)}<span class="online-dot"></span></div>
      <div><div class="chat-agent-name">Soporte · Sofía</div><div class="chat-agent-status">En línea</div></div>
    </div>
  </div>
  <div class="chat-body">
    <div class="chat-day">Hoy</div>
    ${bubble('in', 'Hola María 👋 Soy Sofía del equipo de soporte. ¿En qué te puedo ayudar?', '2:14 PM')}
    ${bubble('out', 'Hola, mi pedido RA-7291 aún no llega y dice "en camino" hace rato', '2:15 PM')}
    ${bubble('in', 'Déjame revisarlo… Tu repartidor Carlos está a 3 cuadras, llega en ~6 min. 🛵', '2:15 PM')}
    ${bubble('out', '¡Perfecto, gracias!', '2:16 PM')}
    ${bubble('in', 'Por la demora te dejo un cupón de S/ 10 para tu próximo pedido: <strong>DISCULPA10</strong> 🎁', '2:16 PM')}
  </div>
  <div class="chat-input">
    <button class="chat-attach"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="#7a6f65" stroke-width="1.8"><path d="M12 5v14M5 12h14"/></svg></button>
    <input placeholder="Escribe un mensaje…">
    <button class="chat-send"><svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="#fff" stroke-width="1.9" stroke-linecap="round" stroke-linejoin="round"><path d="M22 2 11 13M22 2l-7 20-4-9-9-4z"/></svg></button>
  </div>
</div>`; }

function bubble(dir, text, time) {
  return `<div class="bubble-row ${dir}"><div class="bubble ${dir}">${text}<span class="bubble-time">${time}</span></div></div>`;
}

function renderSinConexion() { return `
<div class="app-screen scr-offline">
  ${statusBar()}
  <div class="state-wrap">
    <div class="state-illu offline">
      <svg viewBox="0 0 120 120" width="140" height="140" fill="none">
        <circle cx="60" cy="60" r="56" fill="#fff3e8"/>
        <path d="M30 58a42 42 0 0 1 60 0" stroke="#d8cfc2" stroke-width="5" stroke-linecap="round"/>
        <path d="M42 70a26 26 0 0 1 36 0" stroke="#d8cfc2" stroke-width="5" stroke-linecap="round"/>
        <circle cx="60" cy="82" r="5" fill="#b85c2a"/>
        <path d="M22 22 98 98" stroke="#b85c2a" stroke-width="5" stroke-linecap="round"/>
      </svg>
    </div>
    <div class="state-title">Sin conexión</div>
    <div class="state-text">Parece que perdiste la señal. Revisa tu internet y vuelve a intentarlo — tus antojos andinos te esperan. 🏔</div>
    <button class="btn-primary state-btn" onclick="goTo(7)">Reintentar</button>
  </div>
</div>`; }

function renderVacio() { return `
<div class="app-screen scr-empty">
  ${statusBar()}
  ${appHeader('Mis pedidos', { back: false })}
  <div class="state-wrap">
    <div class="state-illu">
      <svg viewBox="0 0 120 120" width="150" height="150" fill="none">
        <circle cx="60" cy="60" r="56" fill="#eef3ea"/>
        <path d="M38 50h44l-4 34a4 4 0 0 1-4 3.6H46a4 4 0 0 1-4-3.6z" fill="#fff" stroke="#d8cfc2" stroke-width="3"/>
        <path d="M48 50v-6a12 12 0 0 1 24 0v6" stroke="#b85c2a" stroke-width="3" fill="none"/>
        <path d="M52 64v10M60 64v10M68 64v10" stroke="#e0d6c8" stroke-width="3" stroke-linecap="round"/>
        <path d="M84 30l3 3M90 24l2 2M86 18l1 5" stroke="#f0c060" stroke-width="2.5" stroke-linecap="round"/>
      </svg>
    </div>
    <div class="state-title">Aún no tienes pedidos</div>
    <div class="state-text">Cuando hagas tu primer pedido aparecerá aquí. ¿Empezamos con un buen lomo saltado? 🍳</div>
    <button class="btn-primary state-btn" onclick="goTo(7)">Explorar restaurantes</button>
  </div>
  ${bottomNav('orders')}
</div>`; }

/* ---- profile menu icons ---- */
function pinIc() { return `<svg viewBox="0 0 24 24" width="21" height="21" fill="none" stroke="#b85c2a" stroke-width="1.7"><path d="M12 21s7-6.3 7-11a7 7 0 1 0-14 0c0 4.7 7 11 7 11z"/><circle cx="12" cy="10" r="2.5"/></svg>`; }
function cardIc() { return `<svg viewBox="0 0 24 24" width="21" height="21" fill="none" stroke="#b85c2a" stroke-width="1.7"><rect x="3" y="5" width="18" height="14" rx="2.5"/><path d="M3 10h18"/></svg>`; }
function heartIc() { return `<svg viewBox="0 0 24 24" width="21" height="21" fill="none" stroke="#b85c2a" stroke-width="1.7"><path d="M12 20s-7-4.5-9.2-9C1.3 8 2.6 4.5 6 4.5c2 0 3.2 1.2 4 2.3.8-1.1 2-2.3 4-2.3 3.4 0 4.7 3.5 3.2 6.5C19 15.5 12 20 12 20z"/></svg>`; }
function tagMini() { return `<svg viewBox="0 0 24 24" width="21" height="21" fill="none" stroke="#b85c2a" stroke-width="1.7"><path d="M3 12 12 3h7v7l-9 9z"/><circle cx="15.5" cy="8.5" r="1.3" fill="#b85c2a"/></svg>`; }
function bellIc() { return `<svg viewBox="0 0 24 24" width="21" height="21" fill="none" stroke="#b85c2a" stroke-width="1.7"><path d="M18 8a6 6 0 1 0-12 0c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.7 21a2 2 0 0 1-3.4 0"/></svg>`; }
function helpIc() { return `<svg viewBox="0 0 24 24" width="21" height="21" fill="none" stroke="#b85c2a" stroke-width="1.7"><circle cx="12" cy="12" r="9"/><path d="M9.5 9.5a2.5 2.5 0 0 1 4.5 1.5c0 1.5-2 2-2 3"/><circle cx="12" cy="17" r="0.6" fill="#b85c2a"/></svg>`; }
function lockIc() { return `<svg viewBox="0 0 24 24" width="21" height="21" fill="none" stroke="#b85c2a" stroke-width="1.7"><rect x="4" y="10" width="16" height="11" rx="2.5"/><path d="M8 10V7a4 4 0 0 1 8 0v3"/></svg>`; }
function outIc() { return `<svg viewBox="0 0 24 24" width="21" height="21" fill="none" stroke="#ff5c5c" stroke-width="1.7"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><path d="m16 17 5-5-5-5M21 12H9"/></svg>`; }
