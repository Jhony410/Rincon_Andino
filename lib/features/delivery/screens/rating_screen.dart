import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/home'),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: AppTheme.light,
                  shape: BoxShape.circle,
                ),
                child: const Center(child: Text('🏔️', style: TextStyle(fontSize: 50))),
              ).animate().scale(duration: 500.ms, curve: Curves.easeOutBack),
              const SizedBox(height: 24),
              Text(
                '¿Cómo estuvo tu pedido de',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppTheme.gray),
              ),
              const SizedBox(height: 4),
              Text(
                'Rincón Andino?',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () => setState(() => _rating = index + 1),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        index < _rating ? Icons.star : Icons.star_border,
                        color: index < _rating ? Colors.amber : AppTheme.gray,
                        size: 40,
                      ),
                    ).animate(target: index < _rating ? 1 : 0).scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2), duration: 200.ms),
                  );
                }),
              ),
              const SizedBox(height: 40),
              if (_rating > 0) ...[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Déjanos un comentario (opcional)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ),
                const SizedBox(height: 12),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'La comida estuvo deliciosa...',
                    filled: true,
                    fillColor: AppTheme.background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ).animate().fadeIn(),
              ],
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _rating > 0 ? () => context.go('/home') : null,
                  child: const Text('Enviar calificación'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
