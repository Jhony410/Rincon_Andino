import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../models/restaurant.dart';

final mockProductsProvider = Provider<List<Product>>((ref) {
  return const [
    Product(
      id: 'p1',
      name: 'Lomo Saltado Andino',
      description: 'Carne de res, papas fritas, tomate, cebolla y ají amarillo',
      price: 34.00,
      emoji: '🥩',
      category: 'Platos principales',
    ),
    Product(
      id: 'p2',
      name: 'Cuy al Horno',
      description: 'Cuy entero horneado con hierbas andinas, papas doradas',
      price: 48.00,
      emoji: '🍖',
      category: 'Platos principales',
    ),
    Product(
      id: 'p3',
      name: 'Seco de Cordero',
      description: 'Guiso de cordero con cilantro, frijoles y yuca frita',
      price: 38.00,
      emoji: '🍛',
      category: 'Platos principales',
    ),
  ];
});

final mockRestaurantsProvider = Provider<List<Restaurant>>((ref) {
  final products = ref.read(mockProductsProvider);
  return [
    Restaurant(
      id: 'r1',
      name: 'Rincón Andino',
      description: 'Restaurante tradicional andino con más de 20 años ofreciendo los sabores auténticos de la sierra peruana.',
      rating: 4.8,
      reviewCount: 342,
      deliveryTime: '25-35 min',
      deliveryFee: 3.50,
      distance: '1.2 km',
      emoji: '🏔',
      coverGradient: const ColorGradient(0xFF2c4a3e, 0xFF1a3028),
      menu: products,
      isReservable: true,
    ),
    Restaurant(
      id: 'r2',
      name: 'Taquería del Valle',
      description: 'Auténticos tacos y comida mexicana.',
      rating: 4.5,
      reviewCount: 120,
      deliveryTime: '20-30 min',
      deliveryFee: 0.0,
      distance: '2.5 km',
      emoji: '🌮',
      coverGradient: const ColorGradient(0xFFe8a455, 0xFFc8813a),
      menu: [],
    ),
    Restaurant(
      id: 'r3',
      name: 'Sakura Sushi',
      description: 'Sushi fresco y platillos japoneses.',
      rating: 4.9,
      reviewCount: 450,
      deliveryTime: '30-45 min',
      deliveryFee: 5.00,
      distance: '4.0 km',
      emoji: '🍣',
      coverGradient: const ColorGradient(0xFFff5c5c, 0xFFc0392b),
      menu: [],
    ),
    Restaurant(
      id: 'r4',
      name: 'La Bahía Miraflores',
      description: 'Mariscos frescos y comida marina.',
      rating: 4.9,
      reviewCount: 518,
      deliveryTime: '30-40 min',
      deliveryFee: 4.00,
      distance: '3.0 km',
      emoji: '🌊',
      coverGradient: const ColorGradient(0xFF1a3028, 0xFF2c4a3e),
      menu: [],
      isReservable: true,
    ),
    Restaurant(
      id: 'r5',
      name: 'La Parrilla del Chef',
      description: 'Cortes de carne premium.',
      rating: 4.6,
      reviewCount: 204,
      deliveryTime: '40-50 min',
      deliveryFee: 6.00,
      distance: '5.0 km',
      emoji: '🥩',
      coverGradient: const ColorGradient(0xFF3d1a2c, 0xFF5c2840),
      menu: [],
      isReservable: true,
    ),
  ];
});

class SearchNotifier extends Notifier<String> {
  @override
  String build() => '';

  void updateSearch(String value) {
    state = value;
  }
}

final searchProvider = NotifierProvider<SearchNotifier, String>(() {
  return SearchNotifier();
});

final searchResultsProvider = Provider<List<Product>>((ref) {
  final query = ref.watch(searchProvider).toLowerCase();
  final products = ref.watch(mockProductsProvider);
  if (query.isEmpty) return products;
  return products.where((p) => p.name.toLowerCase().contains(query)).toList();
});
