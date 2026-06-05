import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../home/screens/restaurant_map_screen.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _labelController = TextEditingController();
  final _streetController = TextEditingController();
  final _numberController = TextEditingController();
  final _dptoController = TextEditingController();
  final _districtController = TextEditingController();
  final _referenceController = TextEditingController();
  int _tagIndex = 0; // 0: Casa, 1: Trabajo, 2: Otro

  @override
  void dispose() {
    _labelController.dispose();
    _streetController.dispose();
    _numberController.dispose();
    _dptoController.dispose();
    _districtController.dispose();
    _referenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Map preview header
          Stack(
            children: [
              SizedBox(
                height: 180,
                width: double.infinity,
                child: ClipRect(
                  child: CustomPaint(
                    painter: MapPainter(),
                  ),
                ),
              ),
              // Status bar spacing and back button
              Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withAlpha(220),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppTheme.text),
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/profile/addresses');
                      }
                    },
                  ),
                ),
              ),
              // Pin overlay center
              const Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Center(
                  child: Icon(
                    Icons.location_on,
                    size: 38,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ],
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Nueva dirección',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Fraunces',
                    color: AppTheme.text,
                  ),
                ),
                const SizedBox(height: 16),

                _buildFieldLabel('Nombre de la dirección'),
                const SizedBox(height: 6),
                TextField(
                  controller: _labelController,
                  decoration: const InputDecoration(hintText: 'Ej: Casa, Trabajo, Casa de Mamá…'),
                ),
                const SizedBox(height: 16),

                _buildFieldLabel('Calle / Avenida'),
                const SizedBox(height: 6),
                TextField(
                  controller: _streetController,
                  decoration: const InputDecoration(hintText: 'Ej: Av. Larco'),
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFieldLabel('Número'),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _numberController,
                            decoration: const InputDecoration(hintText: '345'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFieldLabel('Dpto / piso'),
                          const SizedBox(height: 6),
                          TextField(
                            controller: _dptoController,
                            decoration: const InputDecoration(hintText: 'Dpto 304'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildFieldLabel('Distrito'),
                const SizedBox(height: 6),
                TextField(
                  controller: _districtController,
                  decoration: const InputDecoration(hintText: 'Miraflores'),
                ),
                const SizedBox(height: 16),

                _buildFieldLabel('Referencia'),
                const SizedBox(height: 6),
                TextField(
                  controller: _referenceController,
                  decoration: const InputDecoration(hintText: 'Frente al parque, portón de fierro'),
                ),
                const SizedBox(height: 16),

                _buildFieldLabel('Etiqueta'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildTagChip('🏠 Casa', 0),
                    const SizedBox(width: 8),
                    _buildTagChip('🏢 Trabajo', 1),
                    const SizedBox(width: 8),
                    _buildTagChip('📍 Otro', 2),
                  ],
                ),
              ],
            ),
          ),
          
          // Save Button Bar
          Container(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + MediaQuery.of(context).padding.bottom),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppTheme.border)),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Pop back
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/profile/addresses');
                  }
                },
                child: const Text('Guardar dirección'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppTheme.gray,
      ),
    );
  }

  Widget _buildTagChip(String label, int index) {
    final isSelected = _tagIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _tagIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.white,
          border: Border.all(color: isSelected ? AppTheme.primary : AppTheme.border, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppTheme.text,
          ),
        ),
      ),
    );
  }
}
