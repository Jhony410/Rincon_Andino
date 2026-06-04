import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Seguimiento'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFe3f2fd), Color(0xFFbbdefb)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  const Center(child: Text('🗺️', style: TextStyle(fontSize: 60))),
                  const Center(child: Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Text('🛵', style: TextStyle(fontSize: 40)),
                  )),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withAlpha(20), blurRadius: 10, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: const Row(
                        children: [
                          Text('⏱️', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          Text('12 min', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Estado del pedido', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Fraunces')),
                  const SizedBox(height: 24),
                  _buildTrackingStep('Confirmado', '12:30 PM', true, isLast: false),
                  _buildTrackingStep('Preparando', '12:35 PM', true, isLast: false),
                  _buildTrackingStep('En camino', 'El repartidor recogió tu pedido', true, isLast: false, isCurrent: true),
                  _buildTrackingStep('Entregado', 'Llegada estimada 1:00 PM', false, isLast: true),
                  const SizedBox(height: 32),
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
                          decoration: BoxDecoration(color: AppTheme.light, shape: BoxShape.circle),
                          child: const Center(child: Text('👨🏽‍🚀', style: TextStyle(fontSize: 24))),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Carlos R.', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.text)),
                              Text('Honda Navi · A1B-234', style: TextStyle(fontSize: 12, color: AppTheme.gray)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(color: AppTheme.primary.withAlpha(20), shape: BoxShape.circle),
                              child: Icon(Icons.chat_bubble_outline, color: AppTheme.primary, size: 18),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(color: AppTheme.primary.withAlpha(20), shape: BoxShape.circle),
                              child: Icon(Icons.phone, color: AppTheme.primary, size: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => context.go('/rating'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.light,
                        foregroundColor: AppTheme.text,
                        elevation: 0,
                      ),
                      child: const Text('Simular entrega (Demo)'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingStep(String title, String subtitle, bool isCompleted, {required bool isLast, bool isCurrent = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isCompleted ? AppTheme.primary : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: isCompleted ? AppTheme.primary : AppTheme.border, width: 2),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : (isCurrent ? Center(child: Container(width: 10, height: 10, decoration: BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle))) : null),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isCompleted ? AppTheme.primary : AppTheme.border,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isCompleted || isCurrent ? FontWeight.bold : FontWeight.normal,
                  color: isCompleted || isCurrent ? AppTheme.text : AppTheme.gray,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: isCurrent ? AppTheme.primary : AppTheme.gray,
                  fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
