import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class ReservationDetailScreen extends StatelessWidget {
  final String resvId;
  const ReservationDetailScreen({super.key, required this.resvId});

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
        title: Text('Reserva #$resvId'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.border),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.successBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Confirmada', style: TextStyle(color: AppTheme.success, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  const SizedBox(height: 16),
                  const Text('🏔️', style: TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  const Text('Rincón Andino', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Fraunces')),
                  const SizedBox(height: 4),
                  const Text('Av. Larco 1234, Miraflores', style: TextStyle(fontSize: 13, color: AppTheme.gray)),
                  const Divider(height: 48, color: AppTheme.border),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoColumn('📅', 'Fecha', 'Hoy, 15 May'),
                      _buildInfoColumn('⏰', 'Hora', '20:00 hrs'),
                      _buildInfoColumn('👥', 'Personas', '2'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(color: AppTheme.light, borderRadius: BorderRadius.circular(12)),
                    child: const Center(child: Icon(Icons.qr_code_2, color: AppTheme.primary, size: 28)),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Muestra este código', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.text)),
                        Text('Al llegar al restaurante', style: TextStyle(fontSize: 12, color: AppTheme.gray)),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppTheme.gray),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.push('/resv-modify/$resvId'),
                    style: OutlinedButton.styleFrom(foregroundColor: AppTheme.text),
                    child: const Text('Modificar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.push('/resv-cancel/$resvId'),
                    style: OutlinedButton.styleFrom(foregroundColor: AppTheme.error, side: const BorderSide(color: AppTheme.error)),
                    child: const Text('Cancelar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String emoji, String label, String value) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: AppTheme.gray)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.text)),
      ],
    );
  }
}
