# 🏔 Rincón Andino
> **Tu sabor, a un toque.**  
> Aplicación móvil premium diseñada para conectar a los usuarios con la riqueza culinaria y cultural de la gastronomía andina, ofreciendo una experiencia inmersiva tanto en delivery como en reservas de restaurantes locales.

---

## 🎨 Diseño de la Interfaz

El diseño visual de **Rincón Andino** está inspirado en la calidez de los paisajes, texturas y elementos naturales de la región andina, fusionados con patrones de diseño modernos propios de aplicaciones de delivery de última generación.

```
🎨 PALETA DE COLORES DE LA APLICACIÓN
├─ Terracota (Principal) ─── [ #B85C2A ] ─── Representa la arcilla y los tejados andinos.
├─ Verde Andino (Secundario) [ #2C4A3E ] ─── Evoca la naturaleza y la vegetación de la sierra.
├─ Dorado Maíz (Acento) ──── [ #F0C060 ] ─── Inspirado en las cosechas y la luz solar.
├─ Fondo Crema (Suave) ───── [ #FAF8F5 ] ─── Proporciona un contraste cálido, evitando el blanco plano.
└─ Café Profundo (Textos) ── [ #1A1208 ] ─── Para una lectura descansada y de alta jerarquía.
```

### Principios Visuales Clave:
*   **Contraste y Atmosfera (Tema Inmersivo):** Se utiliza un fondo claro suave (`#FAF8F5`) para la navegación del día a día, combinado con transiciones y superposiciones oscuras elegantes (`#2C1A0A` a `#0D0602`) en pantallas de gran impacto como el *Splash Screen* y el *Onboarding*.
*   **Tipografía de Autor:** Se implementa una combinación tipográfica premium:
    *   **Fraunces (Serif):** Utilizada en títulos y cabeceras para aportar una identidad artesanal, orgánica y distinguida.
    *   **DM Sans (Sans-serif):** Utilizada en el cuerpo de texto por su legibilidad excepcional en pantallas pequeñas.
*   **Diseño Limpio y Redondeado:** Uso constante de bordes redondeados (`12dp` - `14dp`) en tarjetas y botones, sombras de baja opacidad adaptadas al color del elemento principal y un espaciado amplio que favorece el descanso visual.

---

## 📱 Estructura de Pantallas

La aplicación está organizada en módulos lógicos que garantizan un flujo de usuario intuitivo y eficiente:

| Módulo | Pantalla | Descripción Visual y Funcional |
| :--- | :--- | :--- |
| **Acceso y Bienvenida** | **Splash Screen** | Animación fluida con gradientes oscuros andinos, destello dorado y escalado del logotipo en rebote. |
| | **Onboarding** | Carrusel inmersivo de pantalla completa con imágenes de paisajes locales, indicadores de progreso y transiciones suaves. |
| | **Registro e Inicio** | Formulario limpio con inputs interactivos, recuperación de contraseñas y flujo de validación SMS interactivo. |
| **Descubrimiento** | **Home Principal** | Dashboard con categorías gastronómicas dinámicas, carrusel de ofertas destacadas y un listado detallado de locales. |
| | **Búsqueda** | Entrada rápida con filtros, tags inteligentes de categorías y visualización de términos recientes. |
| | **Mapa de Restaurantes** | Localización interactiva en tiempo real sobre mapa con pines personalizados de restaurantes y distancia estimada. |
| **Transacciones** | **Carrito y Pedidos** | Detalle interactivo de platillos seleccionados, controles rápidos para sumar/restar porciones y desglose de costos claro. |
| | **Seguimiento** | Línea de tiempo visual y animada que muestra en tiempo real el estado del pedido: *Preparación*, *En camino* y *Entregado*. |
| **Reservas** | **Módulo Reservas** | Sistema para apartar mesas en restaurantes físicos, seleccionando fecha, hora, comensales y generando un código QR dinámico. |
| **Configuración** | **Perfil y Soporte** | Gestión de datos del usuario, administración de direcciones frecuentes y chat de soporte en vivo integrado. |

---

## 🧱 Componentes Visuales

Cada interfaz está compuesta por elementos gráficos reutilizables que aseguran consistencia visual y de comportamiento:

*   **Cards de Restaurantes:** Tarjetas informativas con imágenes de alta calidad con carga asíncrona, badges de calificación en dorado y tiempos estimados de entrega.
*   **Botones Personalizados (`AppTheme.primary`):** Botones con esquinas redondeadas a `14dp`, tipografía en semi-bold y elevación sutil con sombra difuminada que se adapta al presionar.
*   **Navegación Inferior Persistente:** Menú inferior minimalista que destaca la pantalla activa mediante iconos rellenos en terracota y una línea de borde superior delgada.
*   **Inputs Modernos:** Campos de texto con fondo blanco sólido y bordes definidos que cambian dinámicamente a terracota al recibir el foco del usuario.
*   **Animaciones y Transiciones (`flutter_animate`):** Efectos visuales no intrusivos que aportan dinamismo a la interfaz, tales como:
    *   *Fade-ins* y *slide-ups* para la aparición de elementos de listas.
    *   *Scales* y *bounces* reactivos al completar acciones (como añadir al carrito o confirmar una reserva).
*   **Estados Interactivos:** Vistas diseñadas detalladamente para estados de error de conexión (con botones de reintento) o listas vacías (*empty states*) con ilustraciones coherentes.

---

## 👤 Experiencia de Usuario (UX/UI)

El diseño de **Rincón Andino** prioriza la facilidad de uso y la comodidad física del usuario:
1.  **Navegación al alcance del pulgar:** Los botones principales de acción y la barra de navegación se encuentran en la zona de interacción natural inferior de los dispositivos móviles.
2.  **Fluidez y Contexto:** El sistema de rutas conserva la jerarquía de navegación, permitiendo al usuario volver fácilmente a la pantalla anterior sin perder datos de su sesión o selección.
3.  **Diseño Responsivo:** Adaptación precisa del layout para teléfonos de distintas resoluciones, escalando correctamente imágenes, textos e inputs.
4.  **Jerarquía de Información:** La combinación de colores y la distinción de tipografías guían de inmediato la mirada del usuario hacia la información crítica (precio, estados de pedido, alertas de error).

---

## 🛠 Tecnologías Utilizadas

La aplicación está construida utilizando el ecosistema de desarrollo de vanguardia de **Flutter**:

*   **Flutter SDK & Dart:** Motor multiplataforma para el renderizado de la UI a 60fps constantes.
*   **Riverpod (`flutter_riverpod`):** Gestión de estado reactivo global, ideal para flujos de carritos de compras y filtros de búsqueda.
*   **GoRouter (`go_router`):** Enrutador declarativo robusto para manejar la navegación entre pantallas y el estado de la barra de navegación inferior.
*   **Google Fonts (`google_fonts`):** Carga e integración óptima de las fuentes tipográficas personalizadas (`Fraunces` y `DM Sans`).
*   **Flutter Animate (`flutter_animate`):** Declaración sencilla y de alto rendimiento de animaciones en la UI.
*   **QR Flutter (`qr_flutter`):** Renderizado de códigos de barras QR de alta fidelidad para el módulo de reservas.
*   **Intl (`intl`):** Formateo localizado de fechas, horas y transacciones monetarias.

---

## 📸 Capturas del Proyecto

*(Sección preparada para agregar imágenes y GIFs interactivos de la aplicación)*

| Splash & Onboarding | Home & Búsqueda | Carrito & Checkout |
|:---:|:---:|:---:|
| 📸 *Splash & Slides de Bienvenida* | 📸 *Dashboard Principal* | 📸 *Detalle de Compra* |
| | | |
| **Mapa & Restaurantes** | **Módulo Reservas** | **Seguimiento (Tracking)** |
| 📸 *Ubicaciones Cercanas* | 📸 *Reserva Física con QR* | 📸 *Línea de Tiempo del Pedido* |

