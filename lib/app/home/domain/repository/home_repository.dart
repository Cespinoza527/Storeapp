import 'package:appstore/app/core/domain/entity/product_entity.dart';

abstract class HomeRepository {
  List<ProductEntity> getProducts();
  bool deleteProduct(String id);
}
