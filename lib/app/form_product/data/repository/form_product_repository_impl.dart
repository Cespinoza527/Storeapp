//import 'dart:math';

import 'package:appstore/app/core/data/remote/service/product_service.dart';
import 'package:appstore/app/core/domain/entity/product_entity.dart';
import 'package:appstore/app/form_product/domain/repository/form_product_repository.dart';


class FormProductRepositoryImpl implements FormProductRepository {
  final ProductService productService;

  FormProductRepositoryImpl({required this.productService});
  @override
  Future<bool> addProduct(ProductEntity productEntity) {
    try {
      return productService.add(productEntity.toProductDataModel());
    } catch (e) {
      throw (Exception());
    }
  }

  @override
  Future<ProductEntity> getProduct(String id) async {
    try {
      final response = await productService.get(id);
      return response.toEntity();
    } catch (e) {
      throw (Exception());
    }
  }
  
  @override
  Future<bool> updateProduct(ProductEntity data) {
    try {
      return productService.update(data.toProductDataModel());
    } catch (e) {
      throw (Exception());
    }
  }
}
