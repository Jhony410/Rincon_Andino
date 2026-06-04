import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Screens imports will go here
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/sms_verify_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/home/screens/search_screen.dart';
import '../../features/delivery/screens/orders_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/delivery/screens/shop_detail_screen.dart';
import '../../features/delivery/screens/product_detail_screen.dart';
import '../../features/delivery/screens/cart_screen.dart';
import '../../features/delivery/screens/address_screen.dart';
import '../../features/delivery/screens/summary_screen.dart';
import '../../features/delivery/screens/payment_screen.dart';
import '../../features/delivery/screens/confirmation_screen.dart';
import '../../features/delivery/screens/tracking_screen.dart';
import '../../features/delivery/screens/rating_screen.dart';
import '../../features/reservations/screens/restaurants_screen.dart';
import '../../features/reservations/screens/restaurant_detail_screen.dart';
import '../../features/reservations/screens/reservation_form_screen.dart';
import '../../features/reservations/screens/reservation_confirmation_screen.dart';
import '../../features/reservations/screens/reservation_detail_screen.dart';
import '../../features/reservations/screens/reservation_history_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/sms-verify',
      builder: (context, state) => const SmsVerifyScreen(),
    ),
    // ShellRoute para el Bottom Navigation Bar
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/orders',
          builder: (context, state) => const OrdersScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
    // Delivery Flow
    GoRoute(
      path: '/shop/:id',
      builder: (context, state) => const PlaceholderScreen(title: 'Detalle Comercio'),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => const PlaceholderScreen(title: 'Detalle Producto'),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const PlaceholderScreen(title: 'Carrito'),
    ),
    GoRoute(
      path: '/address',
      builder: (context, state) => const PlaceholderScreen(title: 'Dirección'),
    ),
    GoRoute(
      path: '/summary',
      builder: (context, state) => const PlaceholderScreen(title: 'Resumen'),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PlaceholderScreen(title: 'Método Pago'),
    ),
    GoRoute(
      path: '/confirmation',
      builder: (context, state) => const PlaceholderScreen(title: 'Confirmación'),
    ),
    GoRoute(
      path: '/tracking',
      builder: (context, state) => const PlaceholderScreen(title: 'Seguimiento'),
    ),
    GoRoute(
      path: '/rating',
      builder: (context, state) => const PlaceholderScreen(title: 'Calificación'),
    ),
    // Reservation Flow
    GoRoute(
      path: '/restaurants',
      builder: (context, state) => const RestaurantsScreen(),
    ),
    GoRoute(
      path: '/restaurant/:id',
      builder: (context, state) => RestaurantDetailScreen(restaurantId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/resv-form',
      builder: (context, state) => const ReservationFormScreen(),
    ),
    GoRoute(
      path: '/resv-confirm',
      builder: (context, state) => const ReservationConfirmationScreen(),
    ),
    GoRoute(
      path: '/resv-detail/:id',
      builder: (context, state) => ReservationDetailScreen(resvId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/resv-history',
      builder: (context, state) => const ReservationHistoryScreen(),
    ),
    // Delivery Flow Routes
    GoRoute(
      path: '/shop/:id',
      builder: (context, state) => ShopDetailScreen(shopId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => ProductDetailScreen(productId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/address',
      builder: (context, state) => const AddressScreen(),
    ),
    GoRoute(
      path: '/summary',
      builder: (context, state) => const SummaryScreen(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: '/confirmation',
      builder: (context, state) => const ConfirmationScreen(),
    ),
    GoRoute(
      path: '/tracking',
      builder: (context, state) => const TrackingScreen(),
    ),
    GoRoute(
      path: '/rating',
      builder: (context, state) => const RatingScreen(),
    ),
  ],
);

// Scaffold Temporal con Bottom NavBar
class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/search')) return 1;
    if (location.startsWith('/orders')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/search');
        break;
      case 2:
        GoRouter.of(context).go('/orders');
        break;
      case 3:
        GoRouter.of(context).go('/profile');
        break;
    }
  }
}

// Widget Temporal
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pantalla: $title', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (title == 'Splash Screen') {
                  context.go('/register');
                } else if (title == 'Registro') {
                  context.go('/login');
                } else if (title == 'Inicio de Sesión') {
                  context.go('/sms-verify');
                } else if (title == 'Verificación SMS') {
                  context.go('/home');
                } else if (context.canPop()) {
                  context.pop();
                } else {
                  context.go('/home');
                }
              },
              child: const Text('Siguiente / Volver'),
            )
          ],
        ),
      ),
    );
  }
}
