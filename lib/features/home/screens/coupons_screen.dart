import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class CouponsScreen extends StatefulWidget {
  const CouponsScreen({super.key});

  @override
  State<CouponsScreen> createState() => _CouponsScreenState();
}

class _CouponsScreenState extends State<CouponsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _coupons = [
    {
      'code': 'RICODIA20',
      'title': '20% de descuento',
      'desc': 'En tu primer pedido del día. Máx. S/ 25.',
      'exp': 'Vence 30 jun',
      'color': AppTheme.primary,
      'isSaved': true,
      'status': 'available',
    },
    {
      'code': 'ENVIOGRATIS',
      'title': 'Envío gratis',
      'desc': 'En pedidos mayores a S/ 40 en restaurantes seleccionados.',
      'exp': 'Vence 15 jun',
      'color': AppTheme.secondary,
      'isSaved': true,
      'status': 'available',
    },
    {
      'code': 'ANDINO15',
      'title': 'S/ 15 de regalo',
      'desc': 'Por invitar a un amigo a Rincón Andino.',
      'exp': 'Vence 28 jun',
      'color': const Color(0xFFc89a3a),
      'isSaved': false,
      'status': 'available',
    },
    {
      'code': 'FINDE2X1',
      'title': '2x1 en postres',
      'desc': 'Solo sábados y domingos. Aplica en postres seleccionados.',
      'exp': 'Vence 31 jul',
      'color': const Color(0xFFa8472a),
      'isSaved': false,
      'status': 'my_coupons',
    },
    {
      'code': 'BIENVENIDO5',
      'title': 'S/ 5.00 Dto.',
      'desc': 'Cupón de bienvenida para tu primer pedido en la app.',
      'exp': 'Vencido el 01 may',
      'color': Colors.grey,
      'isSaved': false,
      'status': 'expired',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
              context.go('/home');
            }
          },
        ),
        title: const Text('Cupones y promociones'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.primary,
          labelColor: AppTheme.primary,
          unselectedLabelColor: AppTheme.gray,
          tabs: const [
            Tab(text: 'Disponibles'),
            Tab(text: 'Mis cupones'),
            Tab(text: 'Vencidos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCouponList('available'),
          _buildCouponList('my_coupons'),
          _buildCouponList('expired'),
        ],
      ),
    );
  }

  Widget _buildCouponList(String status) {
    final list = _coupons.where((c) => c['status'] == status).toList();

    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.local_offer_outlined, size: 64, color: AppTheme.border),
            const SizedBox(height: 12),
            Text(
              'No hay cupones en esta sección',
              style: TextStyle(color: AppTheme.gray.withAlpha(180), fontSize: 14),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final coupon = list[index];
        return _buildCouponCard(coupon);
      },
    );
  }

  Widget _buildCouponCard(Map<String, dynamic> c) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Left Colored Side
            Container(
              width: 92,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 14),
              decoration: BoxDecoration(
                color: c['color'],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.local_offer_outlined, color: Colors.white, size: 24),
                  const SizedBox(height: 6),
                  Text(
                    c['code'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
            
            // Ticket Dotted Line Simulation
            CustomPaint(
              size: const Size(2, double.infinity),
              painter: DottedLinePainter(),
            ),

            // Right Body Side
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          c['title'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.text,
                            fontFamily: 'Fraunces',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          c['desc'],
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: AppTheme.gray,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 12, color: AppTheme.gray),
                            const SizedBox(width: 4),
                            Text(
                              c['exp'],
                              style: const TextStyle(fontSize: 11, color: AppTheme.gray),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: c['status'] == 'expired'
                              ? null
                              : () {
                                  setState(() {
                                    if (c['status'] == 'available') {
                                      c['status'] = 'my_coupons';
                                      c['isSaved'] = true;
                                    } else {
                                      // If it's already "my coupon", use it
                                      context.go('/home');
                                    }
                                  });
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: c['isSaved'] ? AppTheme.primary : AppTheme.light,
                            foregroundColor: c['isSaved'] ? Colors.white : AppTheme.primary,
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            minimumSize: Size.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            c['status'] == 'expired'
                                ? 'Vencido'
                                : (c['isSaved'] ? 'Usar' : 'Guardar'),
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.border
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double startY = 6;
    double dashHeight = 4;
    double dashSpace = 4;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
