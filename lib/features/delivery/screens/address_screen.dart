import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
              context.go('/cart');
            }
          },
        ),
        title: const Text('¿Dónde entregamos?'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 220,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFc8e6c9), Color(0xFFa5d6a7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  const Center(child: Text('🗺️', style: TextStyle(fontSize: 48))),
                  const Center(child: Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text('📍', style: TextStyle(fontSize: 32)),
                  )),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.black.withAlpha(40), blurRadius: 8, offset: const Offset(0, 2)),
                        ],
                      ),
                      child: const Center(child: Text('🎯', style: TextStyle(fontSize: 18))),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildInputPair('Calle / Avenida', 'Av. Larco 345, Miraflores'),
                  const SizedBox(height: 12),
                  _buildInputPair('Número de departamento / piso', 'Ej: Dpto 304, Piso 3', isHint: true),
                  const SizedBox(height: 12),
                  _buildInputPair('Referencias', 'Ej: Frente al parque, edificio rojo', isHint: true),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildTypeChip('🏠 Casa', true),
                      _buildTypeChip('🏢 Oficina', false),
                      _buildTypeChip('📍 Otro', false),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.push('/summary'),
                    child: const Text('Confirmar dirección'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputPair(String label, String value, {bool isHint = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.gray)),
        const SizedBox(height: 4),
        TextField(
          controller: isHint ? null : TextEditingController(text: value),
          decoration: InputDecoration(
            hintText: isHint ? value : null,
          ),
        ),
      ],
    );
  }

  Widget _buildTypeChip(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isActive ? AppTheme.primary : AppTheme.border, width: 1.5),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : AppTheme.text,
        ),
      ),
    );
  }
}
