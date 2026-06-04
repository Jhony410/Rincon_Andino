import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF2c1a0a), Colors.white],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Crear cuenta',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Únete a la familia Rincón Andino',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildInputPair('Nombre completo', 'Ej: María García'),
                  const SizedBox(height: 14),
                  _buildInputPair('Teléfono', '+51 999 000 000'),
                  const SizedBox(height: 14),
                  _buildInputPair('Correo electrónico', 'correo@email.com'),
                  const SizedBox(height: 14),
                  _buildInputPair('Contraseña', 'Mínimo 8 caracteres', obscure: true),
                  const SizedBox(height: 14),
                  _buildInputPair('Confirmar contraseña', 'Repite la contraseña', obscure: true),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.go('/login'),
                    child: const Text('Crear cuenta'),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTap: () => context.go('/login'),
                      child: RichText(
                        text: TextSpan(
                          text: '¿Ya tienes cuenta? ',
                          style: TextStyle(color: AppTheme.gray, fontSize: 13),
                          children: [
                            TextSpan(
                              text: 'Inicia sesión',
                              style: TextStyle(
                                color: AppTheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('o continúa con', style: TextStyle(color: AppTheme.gray, fontSize: 12)),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: AppTheme.light,
                            padding: const EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('🇬', style: TextStyle(fontSize: 16)),
                              SizedBox(width: 6),
                              Text('Google'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: AppTheme.light,
                            padding: const EdgeInsets.all(12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('🍎', style: TextStyle(fontSize: 16)),
                              SizedBox(width: 6),
                              Text('Apple'),
                            ],
                          ),
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
    );
  }

  Widget _buildInputPair(String label, String hint, {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.gray,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
