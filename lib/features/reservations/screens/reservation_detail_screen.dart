import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class ReservationDetailScreen extends StatelessWidget {
  final String resvId;
  const ReservationDetailScreen({super.key, required this.resvId});

  @override
  Widget build(BuildContext context) {
    final resvDetails = {
      '9901': {
        'name': 'Rincón Andino',
        'image': 'assets/Locales/RINCON ANDINO.jpg',
        'address': 'Av. Larco 1234, Miraflores',
        'date': 'Hoy, 15 May',
        'time': '20:00 hrs',
        'people': '2',
        'status': 'Confirmada',
        'statusColor': AppTheme.success,
        'statusBg': AppTheme.successBg,
      },
      '8820': {
        'name': 'La Bahía Miraflores',
        'image': 'assets/Locales/LA BAHIA MIRAFLORES.jpg',
        'address': 'Av. Larco 567, Miraflores',
        'date': '10 May',
        'time': '19:30 hrs',
        'people': '4',
        'status': 'Completada',
        'statusColor': AppTheme.gray,
        'statusBg': AppTheme.light,
      },
      '7714': {
        'name': 'La Parrilla del Chef',
        'image': 'assets/Locales/LA PARRILLA DEL CHEF.jpg',
        'address': 'Av. Larco 890, Miraflores',
        'date': '28 Abr',
        'time': '21:00 hrs',
        'people': '2',
        'status': 'Cancelada',
        'statusColor': AppTheme.error,
        'statusBg': AppTheme.errorBg,
      },
    };

    final details = resvDetails[resvId] ?? resvDetails['9901']!;

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
                      color: details['statusBg'] as Color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      details['status'] as String,
                      style: TextStyle(color: details['statusColor'] as Color, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 16),
                  (details['image'] as String).startsWith('assets/')
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            details['image'] as String,
                            fit: BoxFit.cover,
                            width: 64,
                            height: 64,
                          ),
                        )
                      : Text(details['image'] as String, style: const TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(details['name'] as String, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Fraunces')),
                  const SizedBox(height: 4),
                  Text(details['address'] as String, style: const TextStyle(fontSize: 13, color: AppTheme.gray)),
                  const Divider(height: 48, color: AppTheme.border),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildInfoColumn('📅', 'Fecha', details['date'] as String),
                      _buildInfoColumn('⏰', 'Hora', details['time'] as String),
                      _buildInfoColumn('👥', 'Personas', details['people'] as String),
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
