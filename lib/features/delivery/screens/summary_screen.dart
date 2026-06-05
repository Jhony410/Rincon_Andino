import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

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
              context.go('/address');
            }
          },
        ),
        title: const Text('Resumen del Pedido'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildSection(
                  context,
                  title: 'Entregar en',
                  emoji: '📍',
                  content: 'Av. Larco 345, Miraflores\nDpto 304, Piso 3',
                  actionText: 'Cambiar',
                  onAction: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/address');
                    }
                  },
                ),
                _buildSection(
                  context,
                  title: 'Tiempo estimado',
                  emoji: '⏱️',
                  content: '25 - 35 minutos',
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Tu pedido', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.text)),
                      const SizedBox(height: 12),
                      _buildOrderItem('2x', 'Lomo Saltado Andino', 'S/ 68.00'),
                      _buildOrderItem('1x', 'Seco de Cordero', 'S/ 38.00'),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      _buildTotalRow('Subtotal', 'S/ 106.00'),
                      _buildTotalRow('Costo de envío', 'S/ 3.50'),
                      _buildTotalRow('Descuento RICODIA20', '−S/ 21.20', isDiscount: true),
                      const Divider(height: 24, color: AppTheme.border),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total a pagar', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.text)),
                          Text('S/ 88.30', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () => context.push('/payment'),
            child: const Text('Continuar al pago →'),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required String title, required String emoji, required String content, String? actionText, VoidCallback? onAction}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: AppTheme.light, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text(emoji, style: const TextStyle(fontSize: 20))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                const SizedBox(height: 4),
                Text(content, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.text, height: 1.4)),
              ],
            ),
          ),
          if (actionText != null)
            GestureDetector(
              onTap: onAction,
              child: Text(actionText, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary)),
            ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(String qty, String name, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(qty, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppTheme.primary)),
          const SizedBox(width: 8),
          Expanded(child: Text(name, style: const TextStyle(fontSize: 13, color: AppTheme.text))),
          Text(price, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.text)),
        ],
      ),
    );
  }

  Widget _buildTotalRow(String label, String value, {bool isDiscount = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 13, color: AppTheme.gray)),
          Text(value, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: isDiscount ? AppTheme.success : AppTheme.text)),
        ],
      ),
    );
  }
}
