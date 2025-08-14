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
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            product.image,
            height: 100,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Text(product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text('RS ${product.price.toStringAsFixed(2)}'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, 
              foregroundColor: Colors.white,
              padding: EdgeInsets.zero,
              minimumSize: const Size(80, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
              elevation: 0, 
            ),
            onPressed: () {
              Provider.of<CartProvider>(
                context,
                listen: false,
              ).addItem(product);
            },
            child: const Text(
              'Add to Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
