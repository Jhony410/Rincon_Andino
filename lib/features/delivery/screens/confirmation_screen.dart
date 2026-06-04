import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Text('🎉', style: TextStyle(fontSize: 60)),
                ),
              ).animate().scale(duration: 600.ms, curve: Curves.elasticOut),
              const SizedBox(height: 32),
              Text(
                '¡Pedido confirmado!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.text,
                    ),
              ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2, end: 0),
              const SizedBox(height: 12),
              const Text(
                'Tu pedido en Rincón Andino está siendo preparado. Te avisaremos cuando el repartidor esté en camino.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.gray, fontSize: 14, height: 1.5),
              ).animate().fadeIn(delay: 500.ms),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.light,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Número de orden:', style: TextStyle(color: AppTheme.gray, fontSize: 13)),
                        Text('#RA-883210', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      ],
                    ),
                    const Divider(height: 24, color: AppTheme.border),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Tiempo estimado:', style: TextStyle(color: AppTheme.gray, fontSize: 13)),
                        Text('25 - 35 min', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.primary)),
                      ],
                    ),
                  ],
                ),
              ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.2, end: 0),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/tracking'),
                  child: const Text('Seguir mi pedido'),
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
    );
  }
}
