import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../providers/data_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchProvider);
    final results = ref.watch(searchResultsProvider);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: AppTheme.border)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: AppTheme.background,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: AppTheme.gray, size: 18),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  onChanged: (val) => ref.read(searchProvider.notifier).updateSearch(val),
                                  decoration: InputDecoration(
                                    hintText: 'Lomo saltado...',
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    fillColor: AppTheme.background,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          ref.read(searchProvider.notifier).updateSearch('');
                          context.go('/home');
                        },
                        child: Text('Cancelar', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip('🍽 Todo', true),
                        _buildFilterChip('🛵 Delivery', false),
                        _buildFilterChip('🍷 Bebidas', false),
                        _buildFilterChip('⭐ Mejor calif.', false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (query.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text('${results.length} resultados para "$query"', style: TextStyle(color: AppTheme.gray, fontSize: 12)),
                    ),
                  ...results.map((product) => _buildResultItem(context, product)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isActive) {
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

  Widget _buildResultItem(BuildContext context, dynamic product) {
    return GestureDetector(
      onTap: () => context.go('/product/${product.id}'),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppTheme.border)),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppTheme.light,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(child: Text(product.emoji, style: const TextStyle(fontSize: 30))),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.text)),
                  Text('${product.category} · 25 min', style: TextStyle(fontSize: 11, color: AppTheme.gray)),
                  Text('⭐ 4.8 · S/ 3.50 envío', style: TextStyle(fontSize: 11, color: AppTheme.gray, height: 1.5)),
                ],
              ),
            ),
            Text('S/ ${product.price.toStringAsFixed(0)}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.primary)),
          ],
        ),
      ),
    );
  }
}
