import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF2c1a0a), Color(0xFF1a0d04)],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppTheme.primary, Color(0xFF7a2e0a)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary.withAlpha(100),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Center(child: Text('👤', style: TextStyle(fontSize: 36))),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'María García',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                    ),
                    const SizedBox(height: 4),
                    const Text('maria@email.com · +51 987 654 321', style: TextStyle(color: Colors.white60, fontSize: 12)),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStat('18', 'Pedidos'),
                        Container(width: 1, height: 24, color: Colors.white24, margin: const EdgeInsets.symmetric(horizontal: 16)),
                        _buildStat('5', 'Reservas'),
                        Container(width: 1, height: 24, color: Colors.white24, margin: const EdgeInsets.symmetric(horizontal: 16)),
                        _buildStat('240', 'Puntos'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildMenuItem('📍', 'Mis direcciones'),
                  _buildMenuItem('💳', 'Métodos de pago'),
                  _buildMenuItem('🔔', 'Notificaciones'),
                  _buildMenuItem('⭐', 'Mis reseñas'),
                  _buildMenuItem('🎁', 'Referidos y descuentos'),
                  _buildMenuItem('🔒', 'Privacidad y seguridad'),
                  _buildMenuItem('❓', 'Ayuda y soporte'),
                  _buildMenuItem('🚪', 'Cerrar sesión', isDanger: true, onTap: () => context.go('/login')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.white60)),
      ],
    );
  }

  Widget _buildMenuItem(String emoji, String label, {bool isDanger = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppTheme.border)),
        ),
        child: Row(
          children: [
            SizedBox(width: 28, child: Text(emoji, style: const TextStyle(fontSize: 22), textAlign: TextAlign.center)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: isDanger ? AppTheme.error : AppTheme.text),
              ),
            ),
            if (!isDanger) Icon(Icons.chevron_right, color: AppTheme.gray, size: 20),
          ],
        ),
      ),
    );
  }
}
