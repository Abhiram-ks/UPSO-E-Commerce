import 'package:ecommerce_upso/data/model/product_model.dart';
import 'package:ecommerce_upso/presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return ListTile(
      leading: Image.asset(product.image, width: 50, fit: BoxFit.cover,),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () => cart.updateQuantity(product.id, product.quantity - 1),
          ),
          Text(product.quantity.toString()),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => cart.updateQuantity(product.id, product.quantity + 1),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => cart.removeItem(product.id),
          ),
        ],
      ),
    );
  }
}