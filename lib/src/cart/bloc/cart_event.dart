import 'package:equatable/equatable.dart';
import '../../../core/models/product.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddProduct extends CartEvent {
  final Product product;
  final int quantity;
  AddProduct(this.product, {this.quantity = 1});
  @override
  List<Object?> get props => [product, quantity];
}

class RemoveProduct extends CartEvent {
  final Product product;
  final int quantity;
  RemoveProduct(this.product, {this.quantity = 1});
  @override
  List<Object?> get props => [product, quantity];
}

class RemoveProductCompletely extends CartEvent {
  final Product product;
  RemoveProductCompletely(this.product);
  @override
  List<Object?> get props => [product];
}

class ClearCart extends CartEvent {}
