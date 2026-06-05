import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../providers/data_provider.dart';

class ShopDetailScreen extends ConsumerWidget {
  final String shopId;
  const ShopDetailScreen({super.key, required this.shopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shops = ref.watch(mockRestaurantsProvider);
    final shop = shops.firstWhere((s) => s.id == shopId, orElse: () => shops.first);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/home');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
                  padding: const EdgeInsets.all(8),
                  child: const Text('❤️', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: shop.imagePath != null
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          shop.imagePath!,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black54, Colors.transparent],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(shop.coverGradient.color1), Color(shop.coverGradient.color2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(shop.emoji, style: const TextStyle(fontSize: 60)),
                      ),
                    ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(shop.name, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 22)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(color: AppTheme.successBg, borderRadius: BorderRadius.circular(20)),
                            child: const Text('Abierto', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.success)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildInfoPill('⭐ ${shop.rating} (${shop.reviewCount} reseñas)'),
                          _buildInfoPill('🕐 ${shop.deliveryTime}'),
                          _buildInfoPill('🛵 S/ ${shop.deliveryFee.toStringAsFixed(2)}'),
                          _buildInfoPill('📍 ${shop.distance}'),
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildMenuChip('🍽 Platos principales', true),
                      _buildMenuChip('🥗 Entradas', false),
                      _buildMenuChip('🍰 Postres', false),
                      _buildMenuChip('🥤 Bebidas', false),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Platos principales', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 15)),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: shop.menu.length,
                  itemBuilder: (context, index) {
                    final product = shop.menu[index];
                    return _buildMenuItem(context, product);
                  },
                ),
                if (shop.menu.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Center(child: Text('Menú no disponible')),
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
        child: ElevatedButton(
          onPressed: () => context.go('/cart'),
          child: const Text('🛒 Ver carrito (2) · S/ 68.00'),
        ),
      ),
    );
  }

  Widget _buildInfoPill(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: const TextStyle(fontSize: 11, color: AppTheme.gray, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildMenuChip(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isActive ? AppTheme.primary : AppTheme.border),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : AppTheme.text,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, dynamic product) {
    return InkWell(
      onTap: () => context.push('/product/${product.id}'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.border))),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppTheme.text)),
                  const SizedBox(height: 2),
                  Text(product.description, style: const TextStyle(fontSize: 11, color: AppTheme.gray)),
                  const SizedBox(height: 4),
                  Text('S/ ${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(color: AppTheme.light, borderRadius: BorderRadius.circular(12)),
                  child: Center(child: Text(product.emoji, style: const TextStyle(fontSize: 28))),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(color: AppTheme.primary, borderRadius: BorderRadius.circular(8)),
                  child: const Center(child: Text('+', style: TextStyle(color: Colors.white, fontSize: 18))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
