import 'product.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final double rating;
  final int reviewCount;
  final String deliveryTime;
  final double deliveryFee;
  final String distance;
  final String emoji;
  final ColorGradient coverGradient;
  final List<Product> menu;
  final bool isReservable;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
    required this.emoji,
    required this.coverGradient,
    required this.menu,
    this.isReservable = false,
  });
}

class ColorGradient {
  final int color1;
  final int color2;
  const ColorGradient(this.color1, this.color2);
}
