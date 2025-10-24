import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsy/src/cart/bloc/cart_bloc.dart';
import 'package:shopsy/src/product/presentation/bloc/product_bloc.dart';
import 'package:shopsy/src/product/presentation/bloc/product_event.dart';
import 'package:shopsy/src/product/presentation/views/product_list_screen.dart';
import 'core/repositories/product_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final productRepository = ProductRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductBloc(repository: productRepository)..add(LoadProducts())),
        BlocProvider(create: (_) => CartBloc()),
      ],
      child: MaterialApp(
        title: 'Shopsy Prototype',
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const ProductListScreen(),
      ),
    );
  }
}
