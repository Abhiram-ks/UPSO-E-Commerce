import 'package:ecommerce_upso/data/model/product_model.dart';
import 'package:ecommerce_upso/presentation/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_item.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      ProductModel(id: '1', name: 'Shoes', price: 59.99, image: 'assets/shoes.png'),
      ProductModel(id: '2', name: 'T-Shirt', price: 19.99, image: 'assets/tshirt.png'),
      ProductModel(id: '3', name: 'Watch', price: 99.99, image: 'assets/watch.png'),
      ProductModel(id: '4', name: 'Bag', price: 39.99, image: 'assets/bag.png'),
      ProductModel(id: '5', name: 'Cap', price: 9.99, image: 'assets/cap.png'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, _) => Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CartScreen()),
                    );
                  },
                ),
                if (cart.items.isNotEmpty)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        cart.items.length.toString(),
                        style: const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (_, i) => ProductItem(product: products[i]),
      ),
    );
  }
}
