import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc({required this.repository}) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoadInProgress());
      try {
        final products = await repository.loadProducts();
        emit(ProductLoadSuccess(products));
      } catch (e) {
        emit(ProductLoadFailure(e.toString()));
      }
    });
  }
}
