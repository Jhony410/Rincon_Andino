import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _favoriteRestaurants = [
    {
      'id': 'r1',
      'name': 'Rincón Andino',
      'category': 'Cocina Andina',
      'rating': 4.8,
      'image': 'assets/Locales/RINCON ANDINO.jpg',
    },
    {
      'id': 'r4',
      'name': 'La Bahía Miraflores',
      'category': 'Mariscos',
      'rating': 4.9,
      'image': 'assets/Locales/LA BAHIA MIRAFLORES.jpg',
    },
    {
      'id': 'r5',
      'name': 'La Parrilla del Chef',
      'category': 'Parrilla',
      'rating': 4.6,
      'image': 'assets/Locales/LA PARRILLA DEL CHEF.jpg',
    },
    {
      'id': 'r3',
      'name': 'Sakura Nikkei',
      'category': 'Nikkei',
      'rating': 4.9,
      'image': 'assets/Locales/SAKURA SUSHI.jpg',
    },
  ];

  final List<Map<String, dynamic>> _favoritePlates = [
    {
      'id': 'p1',
      'name': 'Lomo Saltado Andino',
      'restaurant': 'Rincón Andino',
      'price': 34.00,
      'rating': 4.8,
      'image': 'assets/images/lomo.jpg',
    },
    {
      'id': 'p2',
      'name': 'Cuy al Horno',
      'restaurant': 'Rincón Andino',
      'price': 48.00,
      'rating': 4.9,
      'image': 'assets/images/cuy.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/profile');
            }
          },
        ),
        title: const Text('Favoritos'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.primary,
          labelColor: AppTheme.primary,
          unselectedLabelColor: AppTheme.gray,
          tabs: const [
            Tab(text: 'Restaurantes'),
            Tab(text: 'Platos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildRestaurantsGrid(),
          _buildPlatesGrid(),
        ],
      ),
    );
  }

  Widget _buildRestaurantsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemCount: _favoriteRestaurants.length,
      itemBuilder: (context, index) {
        final rest = _favoriteRestaurants[index];
        return GestureDetector(
          onTap: () => context.push('/shop/${rest['id']}'),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.border, width: 0.8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          rest['image'],
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => Container(
                            color: AppTheme.light,
                            child: const Icon(Icons.restaurant, color: AppTheme.primary),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white24,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.favorite, color: AppTheme.primary, size: 18),
                            onPressed: () {
                              setState(() {
                                _favoriteRestaurants.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rest['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.text,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 12),
                          Text(
                            ' ${rest['rating']} ',
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '· ${rest['category']}',
                            style: const TextStyle(fontSize: 11, color: AppTheme.gray),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlatesGrid() {
    if (_favoritePlates.isEmpty) {
      return const Center(
        child: Text('Aún no tienes platos favoritos'),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemCount: _favoritePlates.length,
      itemBuilder: (context, index) {
        final plate = _favoritePlates[index];
        return GestureDetector(
          onTap: () => context.push('/product/${plate['id']}'),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppTheme.border, width: 0.8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          plate['image'],
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => Container(
                            color: AppTheme.light,
                            child: const Icon(Icons.fastfood, color: AppTheme.primary),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.white24,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.favorite, color: AppTheme.primary, size: 18),
                            onPressed: () {
                              setState(() {
                                _favoritePlates.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plate['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.text,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 12),
                              Text(
                                ' ${plate['rating']} ',
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '· S/ ${plate['price'].toStringAsFixed(2)}',
                                style: const TextStyle(fontSize: 11, color: AppTheme.gray),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
