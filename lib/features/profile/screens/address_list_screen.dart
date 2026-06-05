import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  final List<Map<String, dynamic>> _addresses = [
    {
      'id': 'a1',
      'icon': '🏠',
      'label': 'Casa',
      'line1': 'Av. Larco 345, Dpto 304',
      'line2': 'Miraflores, Lima',
      'isPrimary': true,
    },
    {
      'id': 'a2',
      'icon': '🏢',
      'label': 'Trabajo',
      'line1': 'Av. Javier Prado 1520, Piso 8',
      'line2': 'San Isidro, Lima',
      'isPrimary': false,
    },
    {
      'id': 'a3',
      'icon': '📍',
      'label': 'Casa de mamá',
      'line1': 'Jr. Las Begonias 210',
      'line2': 'Surco, Lima',
      'isPrimary': false,
    },
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
              context.go('/profile');
            }
          },
        ),
        title: const Text('Mis direcciones'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...List.generate(_addresses.length, (index) {
            final addr = _addresses[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.border),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    addr['icon'],
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              addr['label'],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.text,
                              ),
                            ),
                            if (addr['isPrimary']) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppTheme.successBg,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'Principal',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.success,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          addr['line1'],
                          style: const TextStyle(fontSize: 12.5, color: AppTheme.text),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          addr['line2'],
                          style: const TextStyle(fontSize: 11.5, color: AppTheme.gray),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Edit address
                          context.push('/add-address');
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: AppTheme.light,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: const Icon(Icons.edit, size: 16, color: AppTheme.gray),
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _addresses.removeAt(index);
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFFffe8e8),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: const Icon(Icons.delete_outline, size: 16, color: AppTheme.error),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 12),
          // Add address button
          OutlinedButton.icon(
            onPressed: () => context.push('/add-address'),
            icon: const Icon(Icons.add, color: AppTheme.primary),
            label: const Text('Agregar nueva dirección'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: AppTheme.primary, width: 1.5, style: BorderStyle.solid),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              backgroundColor: const Color(0xFFfff8f5),
              foregroundColor: AppTheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
