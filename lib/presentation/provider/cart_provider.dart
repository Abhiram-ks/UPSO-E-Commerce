import 'package:ecommerce_upso/data/model/product_model.dart';
import 'package:flutter/material.dart';
import '../../data/repositories/cart_repository.dart';

class CartProvider extends ChangeNotifier {
  final CartRepository _cartRepository = CartRepository();

  List<ProductModel> get items => _cartRepository.getCartItems();

  double get totalPrice => items.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addItem(ProductModel product) {
    _cartRepository.addToCart(product);
    notifyListeners();
  }

  void removeItem(String id) {
    _cartRepository.removeFromCart(id);
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    if (quantity > 0) {
      _cartRepository.updateQuantity(id, quantity);
    } else {
      removeItem(id);
    }
    notifyListeners();
  }
}
