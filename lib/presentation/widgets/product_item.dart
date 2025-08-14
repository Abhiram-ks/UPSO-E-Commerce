import 'package:ecommerce_upso/data/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(product.image, height: 100),
          Text(product.name, style: const TextStyle(fontSize: 16)),
          Text('\$${product.price.toStringAsFixed(2)}'),
          ElevatedButton(
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false).addItem(product);
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}