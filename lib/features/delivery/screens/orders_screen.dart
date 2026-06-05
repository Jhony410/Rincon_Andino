import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Mis Pedidos'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _buildFilterChip('Todos', true),
                _buildFilterChip('En curso', false),
                _buildFilterChip('Entregados', false),
                _buildFilterChip('Cancelados', false),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildOrderItem(context, '🏔', 'Rincón Andino', 'Hoy, 7:45 PM · 3 productos', 'S/ 88.30', 'Entregado', AppTheme.success, AppTheme.successBg, () => context.push('/past-order/r1')),
          _buildOrderItem(context, '🌮', 'Taquería del Valle', 'Ayer, 12:30 PM · 2 productos', 'S/ 42.00', 'Entregado', AppTheme.success, AppTheme.successBg, () => context.push('/past-order/r2')),
          _buildOrderItem(context, '🍣', 'Sakura Sushi', '14 may · 5 productos', 'S/ 135.00', 'Entregado', AppTheme.success, AppTheme.successBg, () => context.push('/past-order/r3')),
          _buildOrderItem(context, '🍕', 'Pizza House', '10 may · 1 producto', 'S/ 38.00', 'Cancelado', AppTheme.error, AppTheme.errorBg, () => context.push('/past-order/r4')),
        ],
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

  Widget _buildOrderItem(BuildContext context, String emoji, String name, String date, String price, String status, Color statusColor, Color statusBg, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: AppTheme.border)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppTheme.light,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text(emoji, style: const TextStyle(fontSize: 26))),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.text)),
                  const SizedBox(height: 2),
                  Text(date, style: TextStyle(fontSize: 11, color: AppTheme.gray)),
                  const SizedBox(height: 4),
                  Text(price, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: statusBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(status, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: statusColor)),
            ),
          ],
        ),
      ),
    );
  }
}
