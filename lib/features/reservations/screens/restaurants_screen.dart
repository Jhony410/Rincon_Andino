import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../providers/data_provider.dart';

class RestaurantsScreen extends ConsumerWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(mockRestaurantsProvider).where((r) => r.isReservable).toList();

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
        title: const Text('Reservar Mesa'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFfff8f5), Color(0xFFfff3e8)]),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFf0d5c0)),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('¡Gana puntos con cada reserva!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(height: 4),
                      Text('Reserva mesa y obtén hasta 100 puntos en Rincón Andino Rewards.', style: TextStyle(fontSize: 12, color: AppTheme.gray)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const Text('🎁', style: TextStyle(fontSize: 32)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Restaurantes disponibles', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Fraunces')),
          const SizedBox(height: 16),
          ...restaurants.map((rest) => _buildRestaurantCard(context, rest)),
        ],
      ),
    );
  }

  Widget _buildRestaurantCard(BuildContext context, dynamic rest) {
    return GestureDetector(
      onTap: () => context.push('/restaurant/${rest.id}'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.border),
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                gradient: LinearGradient(
                  colors: [Color(rest.coverGradient.color1), Color(rest.coverGradient.color2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(child: Text(rest.emoji, style: const TextStyle(fontSize: 50))),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(rest.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Fraunces')),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(' ${rest.rating}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(rest.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, color: AppTheme.gray)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildChip('📍 ${rest.distance}'),
                      const SizedBox(width: 8),
                      _buildChip('🗓️ Reservas hoy'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.text, fontWeight: FontWeight.w600)),
    );
  }
}
