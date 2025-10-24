import 'package:flutter/material.dart';
import 'package:shopsy/core/models/product.dart';
import 'package:shopsy/src/product/presentation/views/product_detail_screen.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (_, __, ___) => ProductDetailScreen(product: product),
          ),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 4))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(product.image, height: 140, width: double.infinity, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "₹${product.price.toStringAsFixed(0)}",
                  style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
