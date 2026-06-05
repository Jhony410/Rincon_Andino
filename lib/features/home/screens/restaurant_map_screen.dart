import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class RestaurantMapScreen extends StatefulWidget {
  const RestaurantMapScreen({super.key});

  @override
  State<RestaurantMapScreen> createState() => _RestaurantMapScreenState();
}

class _RestaurantMapScreenState extends State<RestaurantMapScreen> {
  int _selectedPin = 0; // 0 for Rincón Andino, 1 for La Bahía, etc.

  final List<Map<String, dynamic>> _restaurants = [
    {
      'id': 'r1',
      'name': 'Rincón Andino',
      'category': 'Cocina Andina',
      'rating': 4.8,
      'distance': '1.2 km',
      'openStatus': 'Abierto · Cierra 11 PM',
      'image': 'assets/Locales/RINCON ANDINO.jpg',
      'top': 0.38,
      'left': 0.44,
    },
    {
      'id': 'r4',
      'name': 'La Bahía Miraflores',
      'category': 'Mariscos',
      'rating': 4.9,
      'distance': '3.0 km',
      'openStatus': 'Abierto · Cierra 10 PM',
      'image': 'assets/Locales/LA BAHIA MIRAFLORES.jpg',
      'top': 0.55,
      'left': 0.24,
    },
    {
      'id': 'r5',
      'name': 'La Parrilla del Chef',
      'category': 'Parrillas',
      'rating': 4.6,
      'distance': '5.0 km',
      'openStatus': 'Abierto · Cierra 11:30 PM',
      'image': 'assets/Locales/LA PARRILLA DEL CHEF.jpg',
      'top': 0.32,
      'left': 0.70,
    },
    {
      'id': 'r3',
      'name': 'Sakura Sushi',
      'category': 'Japonesa',
      'rating': 4.9,
      'distance': '4.0 km',
      'openStatus': 'Abierto · Cierra 11 PM',
      'image': 'assets/Locales/SAKURA SUSHI.jpg',
      'top': 0.64,
      'left': 0.66,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final activeRest = _restaurants[_selectedPin];

    return Scaffold(
      body: Stack(
        children: [
          // Simulated Map Background
          _buildMapView(),
          
          // Top Search Bar
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            left: 16,
            right: 16,
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
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppTheme.text),
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/home');
                      }
                    },
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.search, color: AppTheme.gray, size: 18),
                  const SizedBox(width: 10),
                  const Text(
                    'Restaurantes cerca de Miraflores',
                    style: TextStyle(color: AppTheme.gray, fontSize: 13.5),
                  ),
                ],
              ),
            ),
          ),

          // Map Pins
          ...List.generate(_restaurants.length, (index) {
            final rest = _restaurants[index];
            final isSelected = _selectedPin == index;
            return Positioned(
              top: MediaQuery.of(context).size.height * rest['top'],
              left: MediaQuery.of(context).size.width * rest['left'],
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPin = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected ? AppTheme.primary : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
                        ],
                      ),
                      child: Text(
                        rest['name'],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : AppTheme.text,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isSelected ? AppTheme.primary : AppTheme.secondary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(60),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(Icons.location_on, size: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),

          // Filter Chips (Floating above sheet)
          Positioned(
            bottom: 165,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildFilterChip('Todos', true),
                  _buildFilterChip('Andina', false),
                  _buildFilterChip('Mariscos', false),
                  _buildFilterChip('Abierto ahora', false),
                ],
              ),
            ),
          ),

          // Bottom Slide-up Details Sheet
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(20),
                    blurRadius: 22,
                    offset: const Offset(0, -6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 38,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppTheme.border,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          activeRest['image'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => Container(
                            width: 70,
                            height: 70,
                            color: AppTheme.light,
                            child: const Icon(Icons.restaurant, color: AppTheme.primary),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activeRest['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.text,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 14),
                                Text(
                                  ' ${activeRest['rating']} ',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '· ${activeRest['category']} · ${activeRest['distance']}',
                                  style: const TextStyle(fontSize: 12, color: AppTheme.gray),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              activeRest['openStatus'],
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF1a8a52),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to shop detail (for delivery flow)
                          context.push('/shop/${activeRest['id']}');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Ver', style: TextStyle(fontSize: 13)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isActive ? AppTheme.primary : AppTheme.border),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : AppTheme.text,
        ),
      ),
    );
  }

  Widget _buildMapView() {
    return Container(
      color: const Color(0xFFe9ede7),
      child: CustomPaint(
        painter: MapPainter(),
        size: Size.infinite,
      ),
    );
  }
}

class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = const Color(0xFFd3dccb)
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke;

    final roadBorderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final blockPaint = Paint()
      ..color = const Color(0xFFdde4d6)
      ..style = PaintingStyle.fill;

    // Draw some stylized road paths
    final path = Path()
      ..moveTo(0, size.height * 0.2)
      ..lineTo(size.width, size.height * 0.2)
      ..moveTo(0, size.height * 0.5)
      ..lineTo(size.width, size.height * 0.5)
      ..moveTo(0, size.height * 0.75)
      ..lineTo(size.width, size.height * 0.75)
      ..moveTo(size.width * 0.2, 0)
      ..lineTo(size.width * 0.2, size.height)
      ..moveTo(size.width * 0.55, 0)
      ..lineTo(size.width * 0.55, size.height)
      ..moveTo(size.width * 0.85, 0)
      ..lineTo(size.width * 0.85, size.height);

    // Draw blocks
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.05, size.height * 0.25, size.width * 0.1, size.height * 0.2), const Radius.circular(6)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.25, size.height * 0.25, size.width * 0.25, size.height * 0.2), const Radius.circular(6)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.6, size.height * 0.05, size.width * 0.2, size.height * 0.12), const Radius.circular(6)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.6, size.height * 0.55, size.width * 0.2, size.height * 0.15), const Radius.circular(6)), blockPaint);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(size.width * 0.25, size.height * 0.55, size.width * 0.25, size.height * 0.15), const Radius.circular(6)), blockPaint);

    // Draw main roads
    canvas.drawPath(path, roadPaint);
    canvas.drawPath(path, roadBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
