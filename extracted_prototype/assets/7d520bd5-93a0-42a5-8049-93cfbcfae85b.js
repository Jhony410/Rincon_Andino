/* ===========================================================
   Rincón Andino — App controller: registry, sidebar, nav
   =========================================================== */

const FLOWS = {
  acceso:    { label: 'Flujo de Acceso',   color: '#c8813a' },
  descubrir: { label: 'Home · Descubrir',  color: '#4a9eff' },
  delivery:  { label: 'Flujo Delivery',    color: '#3ecf8e' },
  reserva:   { label: 'Reserva de Mesa',   color: '#e8a455' },
  cuenta:    { label: 'Cuenta',            color: '#b06ad4' },
  estados:   { label: 'Estados & Vacíos',  color: '#ff5c5c' },
};

const SCREENS = [
  null, // 1-indexed
  { flow: 'acceso',    name: 'Splash Screen',          desc: 'Primera impresión de marca con logo andino y carga.',                 render: renderSplash },
  { flow: 'acceso',    name: 'Onboarding',             desc: '3 slides: delivery rápido, reserva fácil y gastronomía andina.',      render: renderOnboarding },
  { flow: 'acceso',    name: 'Registro',               desc: 'Alta de cuenta con datos + acceso social Google/Facebook.',           render: renderRegistro },
  { flow: 'acceso',    name: 'Inicio de Sesión',       desc: 'Login con correo/teléfono y recuperación de contraseña.',             render: renderLogin },
  { flow: 'acceso',    name: 'Verificación SMS',       desc: 'Ingreso del código OTP de 6 dígitos enviado por SMS.',                render: renderSMS },
  { flow: 'acceso',    name: 'Recuperar Contraseña',   desc: 'Solicitud de enlace por correo + pantalla de éxito.',                 render: renderRecuperar },

  { flow: 'descubrir', name: 'Home Principal',         desc: 'Saludo, búsqueda, accesos a delivery/reserva, promos y cercanos.',    render: renderHome },
  { flow: 'descubrir', name: 'Búsqueda',               desc: 'Resultados con filtros y fotos reales de cada plato.',                render: renderBuscar },
  { flow: 'descubrir', name: 'Mapa de Restaurantes',   desc: 'Mapa con pins de restaurantes y filtros flotantes.',                  render: renderMapa },
  { flow: 'descubrir', name: 'Notificaciones',         desc: 'Feed con estado de pedido, promos y nuevos restaurantes.',            render: renderNotificaciones },
  { flow: 'descubrir', name: 'Cupones y Promociones',  desc: 'Cupones disponibles y guardados con código y vencimiento.',           render: renderCupones },

  { flow: 'delivery',  name: 'Detalle Comercio',       desc: 'Hero, calificación, menú categorizado y carrito flotante.',          render: renderComercio },
  { flow: 'delivery',  name: 'Categorías del Menú',    desc: 'Grid de categorías del menú con fotos reales.',                       render: renderCategorias },
  { flow: 'delivery',  name: 'Detalle Producto',       desc: 'Foto grande, opciones de tamaño/extras y contador.',                  render: renderProducto },
  { flow: 'delivery',  name: 'Carrito',                desc: 'Items, cantidades editables, cupón y desglose de precios.',           render: renderCarrito },
  { flow: 'delivery',  name: 'Dirección de Entrega',   desc: 'Mapa y formulario con referencias y etiquetas.',                      render: renderDireccion },
  { flow: 'delivery',  name: 'Resumen del Pedido',     desc: 'Vista final antes de confirmar con todos los detalles.',              render: renderResumen },
  { flow: 'delivery',  name: 'Método de Pago',         desc: 'Efectivo, Yape, Plin o tarjeta con cards visuales.',                  render: renderPago },
  { flow: 'delivery',  name: 'Confirmación de Pedido', desc: 'Éxito con check, código y tiempo estimado.',                          render: renderConfirmacion },
  { flow: 'delivery',  name: 'Seguimiento del Pedido', desc: 'Progreso por pasos, mapa y datos del repartidor.',                    render: renderSeguimiento },
  { flow: 'delivery',  name: 'Calificación',           desc: 'Estrellas para comercio y repartidor + chips rápidos.',               render: renderCalificacion },
  { flow: 'delivery',  name: 'Historial de Pedidos',   desc: 'Lista de pedidos con foto, estado y filtros.',                        render: renderHistorial },
  { flow: 'delivery',  name: 'Detalle Pedido Pasado',  desc: 'Pedido del historial con “Volver a pedir”.',                          render: renderPedidoPasado },
  { flow: 'delivery',  name: 'Favoritos',              desc: 'Restaurantes y platos guardados, en tabs.',                           render: renderFavoritos },

  { flow: 'reserva',   name: 'Lista Restaurantes',     desc: 'Cards con disponibilidad “Mesas disponibles hoy”.',                   render: renderReservaLista },
  { flow: 'reserva',   name: 'Detalle Restaurante',    desc: 'Hero, galería, reseñas con avatares y mapa.',                         render: renderReservaDetalle },
  { flow: 'reserva',   name: 'Formulario de Reserva',  desc: 'Wizard: fecha, hora, personas y datos.',                              render: renderReservaForm },
  { flow: 'reserva',   name: 'Confirmación de Reserva',desc: 'Éxito con código alfanumérico y opción de calendario.',               render: renderReservaConfirm },
  { flow: 'reserva',   name: 'Reserva Activa + QR',    desc: 'QR para presentar, detalles y política de cancelación.',              render: renderReservaActiva },
  { flow: 'reserva',   name: 'Historial de Reservas',  desc: 'Reservas con estado: confirmada, pendiente, cancelada.',              render: renderHistorialReservas },
  { flow: 'reserva',   name: 'Modificar Reserva',      desc: 'Formulario pre-poblado para editar fecha/hora/personas.',             render: renderModificar },
  { flow: 'reserva',   name: 'Cancelar Reserva',       desc: 'Confirmación con motivo y aviso de política.',                        render: renderCancelar },

  { flow: 'cuenta',    name: 'Perfil del Usuario',     desc: 'Avatar, estadísticas y menú de cuenta.',                              render: renderPerfil },
  { flow: 'cuenta',    name: 'Editar Perfil',          desc: 'Cambia nombre, teléfono, correo y foto.',                             render: renderEditarPerfil },
  { flow: 'cuenta',    name: 'Mis Direcciones',        desc: 'Direcciones guardadas con editar/eliminar/agregar.',                  render: renderDirecciones },
  { flow: 'cuenta',    name: 'Agregar Dirección',      desc: 'Formulario completo con mapa y etiqueta.',                            render: renderAgregarDireccion },
  { flow: 'cuenta',    name: 'Ayuda y Soporte',        desc: 'Categorías de ayuda, FAQ y contacto.',                                render: renderAyuda },
  { flow: 'cuenta',    name: 'Chat con Soporte',       desc: 'Chat tipo mensajería con burbujas y envío.',                          render: renderChat },

  { flow: 'estados',   name: 'Sin Conexión / Error',   desc: 'Ilustración amable, mensaje y botón reintentar.',                     render: renderSinConexion },
  { flow: 'estados',   name: 'Estado Vacío',           desc: 'Sin pedidos: ilustración, mensaje motivador y CTA.',                  render: renderVacio },
];

const TOTAL = SCREENS.length - 1;
let current = 1;

/* ---- Build sidebar grouped by flow ---- */
function buildSidebar() {
  const sb = document.getElementById('sidebar');
  let html = '';
  let lastFlow = null;
  for (let i = 1; i <= TOTAL; i++) {
    const s = SCREENS[i];
    if (s.flow !== lastFlow) {
      html += `<div class="section-label">${FLOWS[s.flow].label}</div>`;
      lastFlow = s.flow;
    }
    html += `<button class="screen-btn" data-screen="${i}">
      <span class="num">${String(i).padStart(2, '0')}</span>
      <span class="name">${s.name}</span>
      <span class="dot" style="background:${FLOWS[s.flow].color}"></span>
    </button>`;
  }
  sb.innerHTML = html;
  sb.querySelectorAll('.screen-btn').forEach(btn =>
    btn.addEventListener('click', () => goTo(parseInt(btn.dataset.screen))));
}

/* ---- Navigate ---- */
function navigate(dir) {
  const next = current + dir;
  if (next >= 1 && next <= TOTAL) goTo(next);
}

function goTo(n) {
  if (n < 1 || n > TOTAL) return;
  current = n;
  const s = SCREENS[n];
  const flow = FLOWS[s.flow];

  const screen = document.getElementById('phoneScreen');
  screen.innerHTML = s.render();
  screen.scrollTop = 0;

  document.querySelectorAll('.screen-btn').forEach(b =>
    b.classList.toggle('active', parseInt(b.dataset.screen) === n));

  document.getElementById('pScreen').textContent = String(n).padStart(2, '0');
  document.getElementById('pFlow').textContent = flow.label;
  document.getElementById('pFlowDot').style.background = flow.color;
  document.getElementById('screenDesc').textContent = s.desc;
  document.getElementById('screenIndicator').textContent = `Pantalla ${n} / ${TOTAL}`;
  document.getElementById('phoneLabel').textContent = `${String(n).padStart(2, '0')} · ${s.name}`;

  const activeBtn = document.querySelector(`.screen-btn[data-screen="${n}"]`);
  if (activeBtn) {
    const sb = document.getElementById('sidebar');
    const top = activeBtn.offsetTop, bottom = top + activeBtn.offsetHeight;
    if (top < sb.scrollTop || bottom > sb.scrollTop + sb.clientHeight)
      sb.scrollTo({ top: top - sb.clientHeight / 2, behavior: 'smooth' });
  }

  document.getElementById('prevBtn').classList.toggle('disabled', n === 1);
  document.getElementById('nextBtn').classList.toggle('disabled', n === TOTAL);
}

/* ---- Init ---- */
buildSidebar();
goTo(1);

document.addEventListener('keydown', e => {
  if (e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA') return;
  if (e.key === 'ArrowRight' || e.key === 'ArrowDown') { e.preventDefault(); navigate(1); }
  if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') { e.preventDefault(); navigate(-1); }
});
