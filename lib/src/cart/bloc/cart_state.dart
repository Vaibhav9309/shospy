import 'package:equatable/equatable.dart';

import '../../../core/models/product.dart';

class CartItem extends Equatable {
  final Product product;
  final int quantity;
  const CartItem({required this.product, required this.quantity});
  CartItem copyWith({int? quantity}) => CartItem(product: product, quantity: quantity ?? this.quantity);

  @override
  List<Object?> get props => [product, quantity];
}

class CartState extends Equatable {
  final List<CartItem> items;
  const CartState({this.items = const []});

  double get total =>
      items.fold(0.0, (sum, item) => sum + item.product.price * item.quantity);

  int get totalItems => items.fold(0, (sum, it) => sum + it.quantity);

  CartState copyWith({List<CartItem>? items}) => CartState(items: items ?? this.items);

  @override
  List<Object?> get props => [items];
}
