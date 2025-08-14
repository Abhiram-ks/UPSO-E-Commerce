import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)

class ProductModel extends HiveObject{
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String image;

  @HiveField(4)
  int quantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}


