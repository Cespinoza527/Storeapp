import 'package:appstore/app/core/domain/entity/product_entity.dart';

class ProductDataModel {
  final String id;
  late final String name;
  late final int price;
  late final String imageUrl;

  ProductDataModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  ProductDataModel.fromJson(String this.id, Map<String, dynamic> json) {
    name = json["name"];
    price = json["price"];
    imageUrl = json["image"];
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id ,
      name: name,
      image: imageUrl,
      price: price,
    );
  }
}
