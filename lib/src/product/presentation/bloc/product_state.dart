import 'package:equatable/equatable.dart';

import '../../../../core/models/product.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}
class ProductLoadInProgress extends ProductState {}
class ProductLoadSuccess extends ProductState {
  final List<Product> products;
  ProductLoadSuccess(this.products);
  @override
  List<Object?> get props => [products];
}
class ProductLoadFailure extends ProductState {
  final String error;
  ProductLoadFailure(this.error);
  @override
  List<Object?> get props => [error];
}
