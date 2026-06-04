import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../providers/data_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(mockRestaurantsProvider);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          _buildHeader(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildDeliverySection(),
                  const SizedBox(height: 16),
                  _buildReservationsSection(context),
                  const SizedBox(height: 16),
                  _buildPromoBanner(),
                  const SizedBox(height: 16),
                  _buildNearbySection(context, restaurants),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF2c1a0a), Color(0xFF3d2212)],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(20, 54, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Buenos días 👋', style: TextStyle(color: Colors.white60, fontSize: 12)),
              const SizedBox(height: 4),
              Text(
                'María García',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 22,
                    ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text('📍 Miraflores, Lima ', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  Icon(Icons.arrow_drop_down, color: Colors.white60, size: 16),
                ],
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () => context.go('/search'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(25),
                        blurRadius: 16,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: AppTheme.gray, size: 18),
                      const SizedBox(width: 10),
                      Text('Busca restaurantes, productos...', style: TextStyle(color: AppTheme.gray, fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliverySection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('🛵 Delivery', style: TextStyle(fontFamily: 'Fraunces', fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.text)),
                  Text('Pedidos a domicilio', style: TextStyle(fontSize: 12, color: AppTheme.gray)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryItem('🍽️', 'Comida', const Color(0xFFfff3e0)),
              _buildCategoryItem('💊', 'Farmacia', const Color(0xFFe8f5e9)),
              _buildCategoryItem('🛒', 'Súper', const Color(0xFFe3f2fd)),
              _buildCategoryItem('🍷', 'Licorería', const Color(0xFFfce4ec)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String emoji, String label, Color bgColor) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(child: Text(emoji, style: const TextStyle(fontSize: 26))),
        ),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.text)),
      ],
    );
  }

  Widget _buildReservationsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFfff8f5), Color(0xFFfff3e8)]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFf0d5c0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('🍽 Reservar Mesa', style: TextStyle(fontFamily: 'Fraunces', fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.text)),
                  Text('Reserva en restaurantes', style: TextStyle(fontSize: 12, color: AppTheme.gray)),
                ],
              ),
              GestureDetector(
                onTap: () => context.go('/restaurants'),
                child: Text('Ver todos', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildResvCard('🏔', 'Rincón Andino', '8:00 PM'),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildResvCard('🌊', 'La Bahía', '7:30 PM'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResvCard(String emoji, String name, String time) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 4),
          Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          Text('Próximo: $time', style: TextStyle(fontSize: 10, color: AppTheme.gray)),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('🔥 Promociones', style: TextStyle(fontFamily: 'Fraunces', fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.text)),
            Text('Ver más', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary)),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [AppTheme.primary, AppTheme.primary2]),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('20% de descuento', style: TextStyle(fontFamily: 'Fraunces', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    const Text('En tu primer pedido del día', style: TextStyle(fontSize: 11, color: Colors.white70)),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white30),
                      ),
                      child: const Text('RICODIA20', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const Text('🍖', style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNearbySection(BuildContext context, List<dynamic> restaurants) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('📍 Cerca de ti', style: TextStyle(fontFamily: 'Fraunces', fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.text)),
            Text('Ver todos', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary)),
          ],
        ),
        const SizedBox(height: 12),
        ...restaurants.map((rest) {
          return GestureDetector(
            onTap: () => context.go('/shop/${rest.id}'),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppTheme.border)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppTheme.light,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(child: Text(rest.emoji, style: const TextStyle(fontSize: 28))),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(rest.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.text)),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 14),
                            Text(' ${rest.rating} ', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.text)),
                            Text('· ${rest.deliveryTime} · S/ ${rest.deliveryFee.toStringAsFixed(2)}', style: TextStyle(fontSize: 11, color: AppTheme.gray)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppTheme.successBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('Abierto', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.success)),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
