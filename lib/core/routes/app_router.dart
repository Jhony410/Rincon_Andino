import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

// Auth flow screen imports
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/auth/screens/register_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/sms_verify_screen.dart';
import '../../features/auth/screens/recover_password_screen.dart';

// Home/Discover flow imports
import '../../features/home/screens/home_screen.dart';
import '../../features/home/screens/search_screen.dart';
import '../../features/home/screens/restaurant_map_screen.dart';
import '../../features/home/screens/notifications_screen.dart';
import '../../features/home/screens/coupons_screen.dart';
import '../../features/home/screens/connection_error_screen.dart';
import '../../features/home/screens/empty_state_screen.dart';

// Delivery flow imports
import '../../features/delivery/screens/shop_detail_screen.dart';
import '../../features/delivery/screens/menu_categories_screen.dart';
import '../../features/delivery/screens/product_detail_screen.dart';
import '../../features/delivery/screens/cart_screen.dart';
import '../../features/delivery/screens/address_screen.dart';
import '../../features/delivery/screens/summary_screen.dart';
import '../../features/delivery/screens/payment_screen.dart';
import '../../features/delivery/screens/confirmation_screen.dart';
import '../../features/delivery/screens/tracking_screen.dart';
import '../../features/delivery/screens/rating_screen.dart';
import '../../features/delivery/screens/orders_screen.dart';
import '../../features/delivery/screens/past_order_detail_screen.dart';
import '../../features/delivery/screens/favorites_screen.dart';

// Reservations flow imports
import '../../features/reservations/screens/restaurants_screen.dart';
import '../../features/reservations/screens/restaurant_detail_screen.dart';
import '../../features/reservations/screens/reservation_form_screen.dart';
import '../../features/reservations/screens/reservation_confirmation_screen.dart';
import '../../features/reservations/screens/reservation_detail_screen.dart';
import '../../features/reservations/screens/reservation_history_screen.dart';
import '../../features/reservations/screens/modify_reservation_screen.dart';
import '../../features/reservations/screens/cancel_reservation_screen.dart';

// Profile flow imports
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/edit_profile_screen.dart';
import '../../features/profile/screens/address_list_screen.dart';
import '../../features/profile/screens/add_address_screen.dart';
import '../../features/profile/screens/help_support_screen.dart';
import '../../features/profile/screens/chat_support_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // --- Auth Flow ---
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
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
    GoRoute(
      path: '/recover-password',
      builder: (context, state) => const RecoverPasswordScreen(),
    ),

    // --- Main Shell Route for Bottom Nav ---
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/cart',
              builder: (context, state) => const CartScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/orders',
              builder: (context, state) => const OrdersScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),

    // --- Discover & Map Flow ---
    GoRoute(
      path: '/map',
      builder: (context, state) => const RestaurantMapScreen(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsScreen(),
    ),
    GoRoute(
      path: '/coupons',
      builder: (context, state) => const CouponsScreen(),
    ),

    // --- Delivery Flow (Details & Checkout) ---
    GoRoute(
      path: '/shop/:id',
      builder: (context, state) => ShopDetailScreen(shopId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => const MenuCategoriesScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) => ProductDetailScreen(productId: state.pathParameters['id']!),
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
    GoRoute(
      path: '/past-order/:id',
      builder: (context, state) => PastOrderDetailScreen(orderId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),

    // --- Reservations Flow ---
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
    GoRoute(
      path: '/resv-modify/:id',
      builder: (context, state) => ModifyReservationScreen(reservationId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/resv-cancel/:id',
      builder: (context, state) => CancelReservationScreen(reservationId: state.pathParameters['id']!),
    ),

    // --- Profile & Custom Account Settings Flow ---
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/profile/addresses',
      builder: (context, state) => const AddressListScreen(),
    ),
    GoRoute(
      path: '/add-address',
      builder: (context, state) => const AddAddressScreen(),
    ),
    GoRoute(
      path: '/profile/help',
      builder: (context, state) => const HelpSupportScreen(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const ChatSupportScreen(),
    ),

    // --- Technical States / Empty Screens ---
    GoRoute(
      path: '/error',
      builder: (context, state) => const ConnectionErrorScreen(),
    ),
    GoRoute(
      path: '/empty',
      builder: (context, state) => const EmptyStateScreen(),
    ),
  ],
);

// Custom BottomNavigationBar matching Rincón Andino styling
class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final currentIndex = widget.navigationShell.currentIndex;
        if (currentIndex != 0) {
          // If not on the Home tab, switch to the Home tab
          widget.navigationShell.goBranch(0);
        } else {
          // If on the Home tab, require double press to exit
          final now = DateTime.now();
          if (_lastPressedAt == null ||
              now.difference(_lastPressedAt!) > const Duration(seconds: 2)) {
            _lastPressedAt = now;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  'Presiona atrás otra vez para salir',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                backgroundColor: AppTheme.text,
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          } else {
            // Exit the app gracefully
            await SystemNavigator.pop();
          }
        }
      },
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: AppTheme.border, width: 0.8),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppTheme.primary,
            unselectedItemColor: AppTheme.gray,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                activeIcon: Icon(Icons.search),
                label: 'Buscar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart),
                label: 'Carrito',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined),
                activeIcon: Icon(Icons.receipt_long),
                label: 'Pedidos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
            currentIndex: widget.navigationShell.currentIndex,
            onTap: (int idx) => _onItemTapped(idx, context),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}
