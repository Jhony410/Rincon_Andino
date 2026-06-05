import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class ModifyReservationScreen extends StatefulWidget {
  final String reservationId;

  const ModifyReservationScreen({
    super.key,
    required this.reservationId,
  });

  @override
  State<ModifyReservationScreen> createState() => _ModifyReservationScreenState();
}

class _ModifyReservationScreenState extends State<ModifyReservationScreen> {
  int _selectedDay = 16;
  String _selectedTime = '8:00 PM';
  int _guests = 4;

  final List<String> _timeSlots = const [
    '7:00 PM',
    '7:30 PM',
    '8:00 PM',
    '8:30 PM',
    '9:00 PM',
    '9:30 PM',
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
        title: const Text('Modificar reserva'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 0),
              children: [
                // Warning Banner
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  color: const Color(0xFFfff3ec),
                  child: Text(
                    'Editando reserva ${widget.reservationId} · Rincón Andino',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.text,
                    ),
                  ),
                ),
                
                // Calendar block
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'FECHA',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Calendar headers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Text('L', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                          Text('M', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                          Text('M', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                          Text('J', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                          Text('V', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                          Text('S', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                          Text('D', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.gray)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Simplified grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                        ),
                        itemCount: 33, // 2 blank spaces + 31 days
                        itemBuilder: (context, index) {
                          if (index < 2) {
                            return const SizedBox.shrink();
                          }
                          final day = index - 1;
                          final isSelected = _selectedDay == day;
                          final isToday = day == 12;
                          final isUnavailable = day < 10;

                          return GestureDetector(
                            onTap: isUnavailable
                                ? null
                                : () {
                                    setState(() {
                                      _selectedDay = day;
                                    });
                                  },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? AppTheme.primary
                                    : Colors.transparent,
                                border: isToday
                                    ? Border.all(color: AppTheme.primary, width: 1.5)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  '$day',
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : isUnavailable
                                            ? Colors.black26
                                            : isToday
                                                ? AppTheme.primary
                                                : AppTheme.text,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Time slots block
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'HORA',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.8,
                          crossAxisSpacing: 9,
                          mainAxisSpacing: 9,
                        ),
                        itemCount: _timeSlots.length,
                        itemBuilder: (context, index) {
                          final slot = _timeSlots[index];
                          final isSelected = _selectedTime == slot;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTime = slot;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? const Color(0xFFfff8f5) : Colors.white,
                                border: Border.all(
                                  color: isSelected ? AppTheme.primary : AppTheme.border,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  slot,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected ? AppTheme.primary : AppTheme.text,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // People guest block
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PERSONAS',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: _guests > 1
                                ? () {
                                    setState(() {
                                      _guests--;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.remove_circle_outline),
                            iconSize: 32,
                            color: AppTheme.text,
                          ),
                          const SizedBox(width: 24),
                          Text(
                            '$_guests',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primary,
                            ),
                          ),
                          const SizedBox(width: 24),
                          IconButton(
                            onPressed: _guests < 8
                                ? () {
                                    setState(() {
                                      _guests++;
                                    });
                                  }
                                : null,
                            icon: const Icon(Icons.add_circle_outline),
                            iconSize: 32,
                            color: AppTheme.text,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Action buttons bottom bar
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
                      foregroundColor: AppTheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text('Descartar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Save and go back
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/resv-detail/${widget.reservationId}');
                      }
                    },
                    child: const Text('Guardar cambios'),
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
