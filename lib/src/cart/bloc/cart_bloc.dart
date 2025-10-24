import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddProduct>(_onAdd);
    on<RemoveProduct>(_onRemove);
    on<RemoveProductCompletely>(_onRemoveCompletely);
    on<ClearCart>((_, emit) => emit(const CartState(items: [])));
  }

  void _onAdd(AddProduct event, Emitter<CartState> emit) {
    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere((i) => i.product.id == event.product.id);
    if (index >= 0) {
      final existing = items[index];
      items[index] = existing.copyWith(quantity: existing.quantity + event.quantity);
    } else {
      items.add(CartItem(product: event.product, quantity: event.quantity));
    }
    emit(state.copyWith(items: items));
  }

  void _onRemove(RemoveProduct event, Emitter<CartState> emit) {
    final items = List<CartItem>.from(state.items);
    final index = items.indexWhere((i) => i.product.id == event.product.id);
    if (index >= 0) {
      final existing = items[index];
      final newQty = existing.quantity - event.quantity;
      if (newQty > 0) {
        items[index] = existing.copyWith(quantity: newQty);
      } else {
        items.removeAt(index);
      }
      emit(state.copyWith(items: items));
    }
  }

  void _onRemoveCompletely(RemoveProductCompletely event, Emitter<CartState> emit) {
    final items = state.items.where((i) => i.product.id != event.product.id).toList();
    emit(state.copyWith(items: items));
  }
}
