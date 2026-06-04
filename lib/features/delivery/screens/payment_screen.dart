import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'card_8832';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Método de Pago'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total a pagar:', style: TextStyle(fontSize: 14, color: AppTheme.gray)),
                      Text('S/ 88.30', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Billeteras digitales', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                ),
                const SizedBox(height: 8),
                _buildPaymentMethod(
                  id: 'yape',
                  emoji: '📱',
                  title: 'Yape',
                  subtitle: 'Se abrirá la app',
                ),
                _buildPaymentMethod(
                  id: 'plin',
                  emoji: '📱',
                  title: 'Plin',
                  subtitle: 'Se abrirá la app',
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Tarjetas guardadas', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                ),
                const SizedBox(height: 8),
                _buildPaymentMethod(
                  id: 'card_8832',
                  emoji: '💳',
                  title: 'Visa terminada en 8832',
                  subtitle: 'Vence 12/26',
                ),
                _buildPaymentMethod(
                  id: 'card_4411',
                  emoji: '💳',
                  title: 'Mastercard terminada en 4411',
                  subtitle: 'Vence 08/25',
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppTheme.border, style: BorderStyle.solid),
                      ),
                      child: Row(
                        children: [
                          const Text('➕', style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 12),
                          const Text('Agregar nueva tarjeta', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.primary)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Otros', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                ),
                const SizedBox(height: 8),
                _buildPaymentMethod(
                  id: 'cash',
                  emoji: '💵',
                  title: 'Efectivo',
                  subtitle: 'Pago al recibir',
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () => context.go('/confirmation'),
            child: const Text('Realizar pedido (S/ 88.30)'),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethod({required String id, required String emoji, required String title, required String subtitle}) {
    final isSelected = _selectedMethod == id;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = id),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppTheme.primary : AppTheme.border, width: isSelected ? 2 : 1),
        ),
        child: Row(
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
                  Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.text)),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: AppTheme.gray)),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: isSelected ? AppTheme.primary : AppTheme.gray, width: isSelected ? 6 : 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
