import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class ReservationHistoryScreen extends StatelessWidget {
  const ReservationHistoryScreen({super.key});

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
        title: const Text('Mis Reservas'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Próximas reservas', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Fraunces')),
          const SizedBox(height: 12),
          _buildResvItem(context, 'assets/Locales/RINCON ANDINO.jpg', 'Rincón Andino', 'Hoy, 20:00 hrs · 2 personas', 'Confirmada', AppTheme.success, AppTheme.successBg, '9901'),
          const SizedBox(height: 24),
          const Text('Historial', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Fraunces')),
          const SizedBox(height: 12),
          _buildResvItem(context, 'assets/Locales/LA BAHIA MIRAFLORES.jpg', 'La Bahía Miraflores', '10 may, 19:30 hrs · 4 personas', 'Completada', AppTheme.gray, AppTheme.light, '8820'),
          _buildResvItem(context, 'assets/Locales/LA PARRILLA DEL CHEF.jpg', 'La Parrilla del Chef', '28 abr, 21:00 hrs · 2 personas', 'Cancelada', AppTheme.error, AppTheme.errorBg, '7714'),
        ],
      ),
    );
  }

  Widget _buildResvItem(BuildContext context, String imagePathOrEmoji, String name, String details, String status, Color statusColor, Color statusBg, String id) {
    return GestureDetector(
      onTap: () => context.push('/resv-detail/$id'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.border),
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
              child: imagePathOrEmoji.startsWith('assets/')
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePathOrEmoji,
                        fit: BoxFit.cover,
                        width: 56,
                        height: 56,
                      ),
                    )
                  : Center(child: Text(imagePathOrEmoji, style: const TextStyle(fontSize: 26))),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.text)),
                  const SizedBox(height: 4),
                  Text(details, style: TextStyle(fontSize: 12, color: AppTheme.gray)),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(status, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: statusColor)),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppTheme.gray),
          ],
        ),
      ),
    );
  }
}
