import 'package:ecommerce_upso/core/hive_box.dart';
import 'package:ecommerce_upso/data/model/product_model.dart';
import 'package:ecommerce_upso/presentation/provider/cart_provider.dart';
import 'package:ecommerce_upso/presentation/screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>(HiveBoxes.cartBox);
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ProductListScreen(),
      )
    );
  }
}