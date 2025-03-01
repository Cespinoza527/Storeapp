import 'package:appstore/app/core/domain/entity/product_entity.dart';
import 'package:appstore/app/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  bool deleteProduct(String id) {
    return false;
  }

  @override
  List<ProductEntity> getProducts() {
    return [ProductEntity(id: "123", name: "Producto Sorpresa", image: "https://cdn3d.iconscout.com/3d/premium/thumb/producto-5806313-4863042.png", price: 123000)];
  }
}
