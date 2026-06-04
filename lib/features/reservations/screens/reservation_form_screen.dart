import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class ReservationFormScreen extends StatefulWidget {
  const ReservationFormScreen({super.key});

  @override
  State<ReservationFormScreen> createState() => _ReservationFormScreenState();
}

class _ReservationFormScreenState extends State<ReservationFormScreen> {
  String _selectedDate = 'Hoy, 15 May';
  String _selectedTime = '20:00';
  int _guests = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Reservar Mesa'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppTheme.light,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(child: Text('🏔️', style: TextStyle(fontSize: 30))),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rincón Andino', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.text)),
                            Text('Miraflores, Lima', style: TextStyle(fontSize: 12, color: AppTheme.gray)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                _buildSectionTitle('Número de personas'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_guests > 1) setState(() => _guests--);
                        },
                        icon: const Icon(Icons.remove_circle_outline, size: 36, color: AppTheme.primary),
                      ),
                      const SizedBox(width: 24),
                      Text('$_guests', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppTheme.text)),
                      const SizedBox(width: 24),
                      IconButton(
                        onPressed: () {
                          if (_guests < 20) setState(() => _guests++);
                        },
                        icon: const Icon(Icons.add_circle_outline, size: 36, color: AppTheme.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Fecha'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildDateChip('Hoy, 15 May'),
                      _buildDateChip('Jue, 16 May'),
                      _buildDateChip('Vie, 17 May'),
                      _buildDateChip('Sáb, 18 May'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Hora'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildTimeChip('19:00'),
                      _buildTimeChip('19:30'),
                      _buildTimeChip('20:00'),
                      _buildTimeChip('20:30'),
                      _buildTimeChip('21:00'),
                      _buildTimeChip('21:30'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Preferencias u ocasiones especiales'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Ej: Cumpleaños, aniversario, alergias...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppTheme.border),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppTheme.border)),
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.go('/resv-confirm'),
            child: const Text('Confirmar Reserva'),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.text)),
    );
  }

  Widget _buildDateChip(String date) {
    final isSelected = _selectedDate == date;
    return GestureDetector(
      onTap: () => setState(() => _selectedDate = date),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppTheme.primary : AppTheme.border, width: 1.5),
        ),
        child: Text(
          date,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.text,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildTimeChip(String time) {
    final isSelected = _selectedTime == time;
    return GestureDetector(
      onTap: () => setState(() => _selectedTime = time),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? AppTheme.primary : AppTheme.border, width: 1.5),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.text,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
