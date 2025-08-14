import 'package:hive/hive.dart';
import '../../core/hive_box.dart';
import '../model/product_model.dart';

class CartRepository {
  final Box<ProductModel> cartBox = Hive.box<ProductModel>(HiveBoxes.cartBox);

  List<ProductModel> getCartItems() => cartBox.values.toList();


  void addToCart(ProductModel product) {
    if (cartBox.containsKey(product.id)) {
      var existing = cartBox.get(product.id)!;
      existing.quantity++;
      existing.save();
    } else {
      cartBox.put(product.id, product);
    }
  }

  void removeFromCart(String id) => cartBox.delete(id);

  void updateQuantity(String id, int quantity) {
    var product = cartBox.get(id);
    if (product != null) {
      product.quantity = quantity;
      product.save();
    }
  }
  void clearCart() => cartBox.clear();

}