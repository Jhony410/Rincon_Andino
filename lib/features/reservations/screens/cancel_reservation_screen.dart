import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class CancelReservationScreen extends StatefulWidget {
  final String reservationId;

  const CancelReservationScreen({
    super.key,
    required this.reservationId,
  });

  @override
  State<CancelReservationScreen> createState() => _CancelReservationScreenState();
}

class _CancelReservationScreenState extends State<CancelReservationScreen> {
  int _selectedReasonIndex = 0;

  final List<String> _reasons = const [
    'Cambio de planes',
    'Reservé en otro lugar',
    'Demasiadas personas / pocas',
    'Otro motivo',
  ];

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
              context.go('/resv-detail/${widget.reservationId}');
            }
          },
        ),
        title: const Text('Cancelar reserva'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Warning section
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: const Color(0xFFfff3e0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.warning_amber_rounded,
                            size: 32,
                            color: Color(0xFFd4600a),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '¿Seguro que quieres cancelar?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Fraunces',
                          color: AppTheme.text,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Tu reserva en Rincón Andino para el viernes 16 mayo, 8:00 PM se cancelará. Esta acción no se puede deshacer.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.gray,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Reason section
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MOTIVO DE CANCELACIÓN',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _reasons.length,
                        itemBuilder: (context, index) {
                          final reason = _reasons[index];
                          final isSelected = _selectedReasonIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedReasonIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFFfff8f5) : Colors.white,
                                border: Border.all(
                                  color: isSelected ? AppTheme.primary : AppTheme.border,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected ? AppTheme.primary : AppTheme.border,
                                        width: 2,
                                      ),
                                    ),
                                    child: isSelected
                                        ? Center(
                                            child: Container(
                                              width: 10,
                                              height: 10,
                                              decoration: const BoxDecoration(
                                                color: AppTheme.primary,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    reason,
                                    style: const TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                      color: AppTheme.text,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Policy box
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.light,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '📋 Política',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.text,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Estás cancelando con más de 2 horas de anticipación, por lo que no se aplicará ningún cargo.',
                        style: TextStyle(
                          fontSize: 11.5,
                          color: AppTheme.gray,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Action buttons fixed at bottom
          Container(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + MediaQuery.of(context).padding.bottom),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppTheme.border)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/resv-detail/${widget.reservationId}');
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppTheme.light,
                      foregroundColor: AppTheme.text,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text('No cancelar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to history or list
                      context.go('/resv-history');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFff5c5c),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Confirmar cancelación'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
