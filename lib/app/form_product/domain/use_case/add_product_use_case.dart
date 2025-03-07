//import 'package:appstore/app/login/data/repository/login_repository_impl.dart';

import 'package:appstore/app/core/domain/entity/product_entity.dart';

import 'package:appstore/app/form_product/domain/repository/form_product_repository.dart';
import 'package:appstore/app/form_product/presentation/model/product_form_model.dart';

class AddProductUseCase {
  final FormProductRepository formProductRepository;

  AddProductUseCase({required this.formProductRepository});

  Future<bool> invoke(ProductFormModel productFormModel) {
    try {
      final ProductEntity data = productFormModel.toEntity();

      return formProductRepository.addProduct(data);
    } catch (e) {
      throw (Exception());
    }
  }
}
