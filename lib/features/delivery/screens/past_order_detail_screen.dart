import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class PastOrderDetailScreen extends StatelessWidget {
  final String orderId;

  const PastOrderDetailScreen({
    super.key,
    required this.orderId,
  });

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
              context.go('/orders');
            }
          },
        ),
        title: const Text('Detalle del Pedido'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Order header card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Rincón Andino',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Fraunces',
                              color: AppTheme.text,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppTheme.successBg,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Entregado',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.success,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        '15 May 2026 · 2:30 PM',
                        style: TextStyle(fontSize: 12, color: AppTheme.gray),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Código: #RA-49826',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppTheme.gray,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                
                // Item list header
                const Text(
                  'RESUMEN DE ARTÍCULOS',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.gray,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 10),

                // Items container
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: Column(
                    children: [
                      _buildOrderItem('1 x', 'Lomo Saltado Andino', 'Opción clásica, término medio', 'S/ 34.00'),
                      const Divider(height: 1, color: AppTheme.border),
                      _buildOrderItem('2 x', 'Empanadas de Carne', 'Gourmet, fritas en grasa de res', 'S/ 16.00'),
                      const Divider(height: 1, color: AppTheme.border),
                      _buildOrderItem('1 x', 'Chicha Morada Familiar', 'Preparación natural de maíz morado', 'S/ 12.00'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Deliver address details
                const Text(
                  'INFORMACIÓN DE ENTREGA',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.gray,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dirección',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.gray),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Av. Larco 345, Dpto 402, Miraflores',
                        style: TextStyle(fontSize: 13.5, color: AppTheme.text),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Método de Pago',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.gray),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '💳 Tarjeta Visa terminado en **42',
                        style: TextStyle(fontSize: 13.5, color: AppTheme.text),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Checkout breakdown
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal', style: TextStyle(fontSize: 13, color: AppTheme.gray)),
                          Text('S/ 62.00', style: TextStyle(fontSize: 13, color: AppTheme.text, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Envío', style: TextStyle(fontSize: 13, color: AppTheme.gray)),
                          Text('S/ 3.50', style: TextStyle(fontSize: 13, color: AppTheme.text, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Descuento (RICODIA20)', style: TextStyle(fontSize: 13, color: Color(0xFF1a8a52))),
                          Text('-S/ 12.40', style: TextStyle(fontSize: 13, color: Color(0xFF1a8a52), fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(height: 1, color: AppTheme.border),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total pagado',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.text),
                          ),
                          Text(
                            'S/ 53.10',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Reorder Button fixed at bottom
          Container(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + MediaQuery.of(context).padding.bottom),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppTheme.border)),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Direct shortcut to cart or restaurant detail
                  context.push('/shop/r1');
                },
                child: const Text('Volver a pedir'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String qty, String name, String subtitle, String price) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            qty,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.text,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 11.5, color: AppTheme.gray),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            price,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.bold,
              color: AppTheme.text,
            ),
          ),
        ],
      ),
    );
  }
}
