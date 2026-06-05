import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Mock list of notifications to handle marking as read
  final List<Map<String, dynamic>> _notifications = [
    {
      'id': 'n1',
      'type': 'order',
      'title': 'Tu pedido va en camino',
      'body': 'Carlos está llegando con tu pedido de Rincón Andino',
      'time': 'Hace 5 min',
      'isToday': true,
      'isUnread': true,
      'route': '/tracking',
    },
    {
      'id': 'n2',
      'type': 'promo',
      'title': '¡20% en tu próximo pedido!',
      'body': 'Usa el cupón RICODIA20 antes de medianoche',
      'time': 'Hace 1 h',
      'isToday': true,
      'isUnread': true,
      'route': '/coupons',
    },
    {
      'id': 'n3',
      'type': 'resv',
      'title': 'Reserva confirmada',
      'body': 'Tu mesa en La Bahía Miraflores para el sáb 10 may · 7:30 PM',
      'time': 'Ayer',
      'isToday': false,
      'isUnread': false,
      'route': '/resv-detail/r4',
    },
    {
      'id': 'n4',
      'type': 'rate',
      'title': '¿Cómo estuvo tu pedido?',
      'body': 'Califica tu experiencia con Taquería del Valle',
      'time': 'Ayer',
      'isToday': false,
      'isUnread': false,
      'route': '/rating',
    },
    {
      'id': 'n5',
      'type': 'new',
      'title': 'Nuevo restaurante cerca',
      'body': 'La Parrilla del Chef ya hace delivery a tu zona',
      'time': 'Ayer',
      'isToday': false,
      'isUnread': false,
      'route': '/shop/r5',
    },
  ];

  void _markAllAsRead() {
    setState(() {
      for (var item in _notifications) {
        item['isUnread'] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final todayNotifs = _notifications.where((n) => n['isToday']).toList();
    final yesterdayNotifs = _notifications.where((n) => !n['isToday']).toList();

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
        title: const Text('Notificaciones'),
        actions: [
          TextButton(
            onPressed: _markAllAsRead,
            child: const Text(
              'Marcar leídas',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        children: [
          if (todayNotifs.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 6),
              child: Text(
                'HOY',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.gray,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            ...todayNotifs.map((n) => _buildNotificationItem(context, n)),
          ],
          if (yesterdayNotifs.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 6),
              child: Text(
                'AYER',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.gray,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            ...yesterdayNotifs.map((n) => _buildNotificationItem(context, n)),
          ],
        ],
      ),
    );
  }

  Widget _buildNotificationItem(BuildContext context, Map<String, dynamic> n) {
    IconData icon;
    Color iconColor;
    Color bgColor;

    switch (n['type']) {
      case 'order':
        icon = Icons.motorcycle;
        iconColor = AppTheme.primary;
        bgColor = const Color(0xFFfff3e8);
        break;
      case 'promo':
        icon = Icons.local_offer_outlined;
        iconColor = const Color(0xFFd4600a);
        bgColor = const Color(0xFFfdf0e0);
        break;
      case 'resv':
        icon = Icons.table_restaurant_outlined;
        iconColor = AppTheme.secondary;
        bgColor = const Color(0xFFeaf2ee);
        break;
      case 'rate':
        icon = Icons.star_border_rounded;
        iconColor = Colors.amber;
        bgColor = const Color(0xFFfef6e0);
        break;
      case 'new':
      default:
        icon = Icons.map_outlined;
        iconColor = const Color(0xFF2b5fc0);
        bgColor = const Color(0xFFe9f1fb);
        break;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          n['isUnread'] = false;
        });
        context.push(n['route']);
      },
      child: Container(
        decoration: BoxDecoration(
          color: n['isUnread'] ? const Color(0xFFfffaf5) : Colors.white,
          border: const Border(
            bottom: BorderSide(color: AppTheme.border, width: 0.5),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon wrapper
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 12),
            // Text contents
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          n['title'],
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.text,
                            height: 1.3,
                          ),
                        ),
                      ),
                      if (n['isUnread'])
                        Container(
                          margin: const EdgeInsets.only(left: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFfff3e0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Nuevo',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.warning,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    n['body'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.gray,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    n['time'],
                    style: const TextStyle(
                      fontSize: 10.5,
                      color: AppTheme.gray,
                    ),
                  ),
                ],
              ),
            ),
            if (n['isUnread']) ...[
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(top: 6),
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
