import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class MenuCategoriesScreen extends StatelessWidget {
  const MenuCategoriesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {
      'id': 'cat1',
      'name': 'Platos principales',
      'image': 'assets/images/lomo.jpg',
      'count': 12,
    },
    {
      'id': 'cat2',
      'name': 'Entradas',
      'image': 'assets/images/empanada.jpg',
      'count': 6,
    },
    {
      'id': 'cat3',
      'name': 'Postres',
      'image': 'assets/images/picarones.jpg',
      'count': 8,
    },
    {
      'id': 'cat4',
      'name': 'Bebidas',
      'image': 'assets/images/chicha.jpg',
      'count': 10,
    },
    {
      'id': 'cat5',
      'name': 'Sopas',
      'image': 'assets/images/soup.jpg',
      'count': 5,
    },
    {
      'id': 'cat6',
      'name': 'Ensaladas',
      'image': 'assets/images/salad.jpg',
      'count': 7,
    },
  ];

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
              context.go('/home');
            }
          },
        ),
        title: const Text('Categorías del Menú'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          return GestureDetector(
            onTap: () {
              // Filters the search to show this category, or goes back to search
              context.go('/search');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(12),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image with gradient overlay
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            cat['image'],
                            fit: BoxFit.cover,
                            errorBuilder: (c, e, s) => Container(
                              color: AppTheme.light,
                              child: const Icon(Icons.fastfood, color: AppTheme.primary),
                            ),
                          ),
                        ),
                        // Soft overlay
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withAlpha(130),
                              ],
                            ),
                          ),
                        ),
                        // Label placed inside image bottom
                        Positioned(
                          left: 12,
                          bottom: 8,
                          child: Text(
                            cat['name'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Fraunces',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Count row at bottom
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Text(
                      '${cat['count']} platos',
                      style: const TextStyle(
                        fontSize: 11.5,
                        color: AppTheme.gray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
