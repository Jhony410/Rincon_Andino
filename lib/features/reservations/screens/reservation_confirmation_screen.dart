import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ReservationConfirmationScreen extends StatelessWidget {
  const ReservationConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.go('/home');
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  color: AppTheme.successBg,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text('✅', style: TextStyle(fontSize: 60)),
                ),
              ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
              const SizedBox(height: 32),
              Text(
                '¡Reserva confirmada!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.text,
                    ),
              ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 12),
              const Text(
                'Te esperamos en Rincón Andino. Hemos enviado los detalles a tu correo.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.gray, fontSize: 14, height: 1.5),
              ).animate().fadeIn(delay: 500.ms),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.border),
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Restaurante', 'Rincón Andino'),
                    const SizedBox(height: 16),
                    _buildDetailRow('Fecha', 'Hoy, 15 May'),
                    const SizedBox(height: 16),
                    _buildDetailRow('Hora', '20:00 hrs'),
                    const SizedBox(height: 16),
                    _buildDetailRow('Personas', '2'),
                    const Divider(height: 32, color: AppTheme.border),
                    _buildDetailRow('Código de reserva', '#RES-9901'),
                  ],
                ),
              ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.2, end: 0),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.push('/resv-detail/9901'),
                  child: const Text('Ver detalle de reserva'),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go('/home'),
                child: const Text('Volver al inicio', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppTheme.gray, fontSize: 14)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.text)),
      ],
    );
  }
}
