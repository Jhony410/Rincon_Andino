import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../providers/data_provider.dart';

class RestaurantDetailScreen extends ConsumerWidget {
  final String restaurantId;
  const RestaurantDetailScreen({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(mockRestaurantsProvider);
    final restaurant = restaurants.firstWhere((r) => r.id == restaurantId, orElse: () => restaurants.first);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/restaurants');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(restaurant.coverGradient.color1), Color(restaurant.coverGradient.color2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(restaurant.emoji, style: const TextStyle(fontSize: 80)),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurant.name, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 24)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          Text(' ${restaurant.rating} (${restaurant.reviewCount} reseñas) · Comida andina', style: const TextStyle(fontSize: 13, color: AppTheme.text, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(restaurant.description, style: const TextStyle(fontSize: 14, color: AppTheme.gray, height: 1.5)),
                      const SizedBox(height: 24),
                      const Text('Ubicación y horarios', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.text)),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on, color: AppTheme.primary, size: 20),
                          const SizedBox(width: 8),
                          Expanded(child: Text('Av. Larco 1234, Miraflores\nA ${restaurant.distance} de ti', style: const TextStyle(fontSize: 13, color: AppTheme.text))),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.access_time, color: AppTheme.primary, size: 20),
                          const SizedBox(width: 8),
                          const Expanded(child: Text('Lunes a Domingo\n12:00 PM - 10:00 PM', style: TextStyle(fontSize: 13, color: AppTheme.text))),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppTheme.border)),
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.push('/resv-form'),
            child: const Text('Reservar Mesa'),
          ),
        ),
      ),
    );
  }
}
