/* ===========================================================
   FLUJO DE ACCESO — 1 Splash · 2 Onboarding · 3 Registro
   4 Login · 5 SMS · 6 Recuperar contraseña
   =========================================================== */

function renderSplash() { return `
<div class="app-screen scr-splash">
  ${statusBar(true)}
  <div class="splash-bg">${photo(IMG.andes, 'opacity:.28;')}</div>
  <div class="splash-inner">
    <div class="splash-logo">
      <svg viewBox="0 0 48 48" width="52" height="52" fill="none"><path d="M4 40 L16 16 L24 30 L31 12 L44 40 Z" fill="#f0c060"/><path d="M16 16 L24 30 L20 40 H4 Z" fill="#fff" opacity=".9"/><path d="M31 12 L44 40 H30 L25 26 Z" fill="#fff" opacity=".7"/></svg>
    </div>
    <div>
      <div class="splash-name">Rincón<br>Andino</div>
      <div class="splash-sub">Tu sabor, a un toque</div>
    </div>
    <div class="splash-dots">
      <div class="dot-l a"></div><div class="dot-l"></div><div class="dot-l"></div>
    </div>
  </div>
</div>`; }

function renderOnboarding() {
  const slides = [
    { img: IMG.moto || IMG.lomo, photo: IMG.restWarm, k: '🛵', t: 'Delivery rápido', d: 'Tus platos andinos favoritos en la puerta de tu casa, calientes y a tiempo.' },
    { photo: IMG.restFine, t: 'Reserva fácil', d: 'Aparta tu mesa en los mejores restaurantes con un par de toques.' },
    { photo: IMG.cuy, t: 'Gastronomía andina', d: 'Descubre los sabores auténticos de la sierra, del cuy al rocoto relleno.' },
  ];
  // active slide = 2nd (index 1) for a representative state
  const active = 1;
  const s = slides[active];
  return `
<div class="app-screen scr-onb">
  ${statusBar(false)}
  <div class="onb-skip" onclick="goTo(3)">Saltar</div>
  <div class="onb-photo">${photo(s.photo)}</div>
  <div class="onb-body">
    <div class="onb-title">${s.t}</div>
    <div class="onb-desc">${s.d}</div>
    <div class="onb-dots">
      ${slides.map((_, i) => `<span class="onb-dot${i === active ? ' on' : ''}"></span>`).join('')}
    </div>
    <button class="btn-primary" onclick="goTo(3)">Continuar</button>
  </div>
</div>`;
}

function renderRegistro() { return `
<div class="app-screen scr-reg">
  <div class="reg-header">
    ${statusBar(true)}
    <h1>Crear cuenta</h1>
    <p>Únete a la familia Rincón Andino</p>
  </div>
  <div class="scroll-area">
    <div class="reg-body">
      ${field('Nombre completo', 'María García')}
      ${field('Teléfono', '+51 987 654 321')}
      ${field('Correo electrónico', 'maria.garcia@email.com')}
      ${field('Contraseña', '••••••••', 'password')}
      <button class="btn-primary" style="margin-top:6px;" onclick="goTo(5)">Crear cuenta</button>
      <div class="or-divider"><span>o regístrate con</span></div>
      <div class="social-row">
        <button class="social-btn">${gIcon()} Google</button>
        <button class="social-btn">${fIcon()} Facebook</button>
      </div>
      <div class="reg-foot">¿Ya tienes cuenta? <span onclick="goTo(4)">Inicia sesión</span></div>
    </div>
  </div>
</div>`; }

function renderLogin() { return `
<div class="app-screen scr-login">
  <div class="login-hero">
    ${statusBar(true)}
    <div class="login-logo">
      <svg viewBox="0 0 48 48" width="40" height="40" fill="none"><path d="M4 40 L16 16 L24 30 L31 12 L44 40 Z" fill="#f0c060"/><path d="M16 16 L24 30 L20 40 H4 Z" fill="#fff" opacity=".9"/></svg>
    </div>
    <h1>Bienvenido de vuelta</h1>
    <p>Ingresa para seguir disfrutando</p>
  </div>
  <div class="login-body">
    ${field('Correo o teléfono', 'maria.garcia@email.com')}
    ${field('Contraseña', '••••••••', 'password')}
    <div class="forgot-link" onclick="goTo(6)">¿Olvidaste tu contraseña?</div>
    <button class="btn-primary" onclick="goTo(5)">Iniciar sesión</button>
    <div class="or-divider"><span>o continúa con</span></div>
    <div class="social-row">
      <button class="social-btn">${gIcon()} Google</button>
      <button class="social-btn">${fIcon()} Facebook</button>
    </div>
    <div class="reg-foot">¿No tienes cuenta? <span onclick="goTo(3)">Regístrate</span></div>
  </div>
</div>`; }

function renderSMS() { return `
<div class="app-screen scr-sms">
  ${statusBar()}
  ${appHeader('', { back: 4 })}
  <div class="sms-wrap">
    <div class="sms-icon">
      <svg viewBox="0 0 24 24" width="34" height="34" fill="none" stroke="#b85c2a" stroke-width="1.6"><rect x="3" y="5" width="18" height="14" rx="3"/><path d="m3 7 9 6 9-6"/></svg>
    </div>
    <h1>Verifica tu número</h1>
    <p>Ingresa el código de 6 dígitos que enviamos al<br><strong>+51 ••• ••• 321</strong></p>
    <div class="otp-grid">
      ${['4','9','2','','',''].map((d, i) => `<div class="otp-box${d ? ' filled' : ''}${i === 3 ? ' cursor' : ''}">${d}</div>`).join('')}
    </div>
    <div class="resend-link">¿No recibiste el código? <span>Reenviar (00:45)</span></div>
    <button class="btn-primary" onclick="goTo(7)">Verificar código</button>
    <div class="sms-terms">Al verificar, aceptas nuestros <span>Términos de Servicio</span></div>
  </div>
</div>`; }

function renderRecuperar() { return `
<div class="app-screen scr-recover">
  ${statusBar()}
  ${appHeader('Recuperar contraseña', { back: 4 })}
  <div class="recover-wrap">
    <div class="recover-illu">
      <svg viewBox="0 0 24 24" width="30" height="30" fill="none" stroke="#b85c2a" stroke-width="1.5"><rect x="4" y="10" width="16" height="11" rx="2.5"/><path d="M8 10V7a4 4 0 0 1 8 0v3"/><circle cx="12" cy="15.5" r="1.6"/></svg>
    </div>
    <h1>¿Olvidaste tu contraseña?</h1>
    <p>No te preocupes. Ingresa tu correo y te enviaremos un enlace para restablecerla.</p>
    ${field('Correo electrónico', 'maria.garcia@email.com')}
    <button class="btn-primary" onclick="document.getElementById('recoverSent').style.display='flex'">Enviar enlace</button>
    <button class="btn-secondary" onclick="goTo(4)">Volver a inicio de sesión</button>
  </div>
  <div class="recover-sent" id="recoverSent">
    <div class="success-circle">
      <svg viewBox="0 0 24 24" width="46" height="46" fill="none" stroke="#fff" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round"><path d="m4 13 5 5L20 6"/></svg>
    </div>
    <div class="confirm-title">¡Correo enviado!</div>
    <div class="confirm-sub">Revisa <strong>maria.garcia@email.com</strong> y sigue las instrucciones para crear una nueva contraseña.</div>
    <button class="btn-primary" onclick="goTo(4)">Entendido</button>
  </div>
</div>`; }

/* ---- shared field + social helpers ---- */
function field(label, value, type = 'text', ph = '') {
  return `<div class="field">
    <div class="input-label">${label}</div>
    <input class="input-field" type="${type}" value="${value}" placeholder="${ph}">
  </div>`;
}
function gIcon() {
  return `<svg viewBox="0 0 24 24" width="17" height="17"><path fill="#4285F4" d="M22.5 12.2c0-.7-.1-1.4-.2-2H12v3.9h5.9a5 5 0 0 1-2.2 3.3v2.7h3.6c2.1-2 3.2-4.9 3.2-7.9z"/><path fill="#34A853" d="M12 23c2.9 0 5.4-1 7.2-2.6l-3.6-2.7c-1 .7-2.3 1.1-3.6 1.1-2.8 0-5.1-1.9-6-4.4H2.3v2.8A11 11 0 0 0 12 23z"/><path fill="#FBBC05" d="M6 14.4a6.6 6.6 0 0 1 0-4.2V7.4H2.3a11 11 0 0 0 0 9.8z"/><path fill="#EA4335" d="M12 5.4c1.6 0 3 .5 4.1 1.6l3.1-3.1A11 11 0 0 0 2.3 7.4L6 10.2C6.9 7.7 9.2 5.4 12 5.4z"/></svg>`;
}
function fIcon() {
  return `<svg viewBox="0 0 24 24" width="17" height="17" fill="#1877F2"><path d="M24 12a12 12 0 1 0-13.9 11.9v-8.4H7v-3.5h3.1V9.4c0-3 1.8-4.7 4.5-4.7 1.3 0 2.7.2 2.7.2v3h-1.5c-1.5 0-2 .9-2 1.9v2.2h3.4l-.5 3.5h-2.9v8.4A12 12 0 0 0 24 12z"/></svg>`;
}
