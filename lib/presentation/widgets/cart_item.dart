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

    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                _quantityButton(
                  icon: Icons.remove,
                  onPressed: () => cart.updateQuantity(product.id, product.quantity - 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product.quantity.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                _quantityButton(
                  icon: Icons.add,
                  onPressed: () => cart.updateQuantity(product.id, product.quantity + 1),
                ),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => cart.removeItem(product.id),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _quantityButton({required IconData icon, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(4),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
