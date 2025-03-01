import 'package:appstore/app/core/domain/entity/product_entity.dart';
import 'package:appstore/app/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  bool deleteProduct(String id) {
    return false;
  }

  @override
  List<ProductEntity> getProducts() {
    return [];
  }
}
