import 'package:appstore/app/core/data/remote/service/product_service.dart';
import 'package:appstore/app/home/data/repository/home_repository_impl.dart';
import 'package:appstore/app/home/domain/repository/home_repository.dart';
import 'package:appstore/app/home/domain/use_case/delete_products_use_case.dart';
import 'package:appstore/app/home/domain/use_case/get_products_use_case.dart';
import 'package:appstore/app/home/presentation/bloc/home_bloc.dart';
import 'package:appstore/app/login/data/repository/login_repository_impl.dart';
import 'package:appstore/app/login/domain/repository/login_repository.dart';
import 'package:appstore/app/login/domain/use_case/login_use_case.dart';
import 'package:appstore/app/login/presentation/bloc/login_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final class DependencyInjection {
  DependencyInjection._();

  static final serviceLocator = GetIt.instance;

  static setup() {
    serviceLocator.registerSingleton<Dio>(Dio());
    serviceLocator.registerFactory<ProductService>(
      () => ProductService(dio: serviceLocator.get()),
    );

    serviceLocator.registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(),
    );
    serviceLocator.registerFactory<LoginUseCase>(
      () => LoginUseCase(loginRepository: serviceLocator.get()),
    );
    serviceLocator.registerFactory<LoginBloc>(
      () => LoginBloc(loginUseCase: serviceLocator.get()),
    );

    serviceLocator.registerFactory<HomeRepository>(() => HomeRepositoryImpl(productService: serviceLocator.get()));
    serviceLocator.registerFactory<GetProductsUseCase>(
      () => GetProductsUseCase(homeRepository: serviceLocator.get()),
    );
    serviceLocator.registerFactory<DeleteProductsUseCase>(
      () => DeleteProductsUseCase(homeRepository: serviceLocator.get()),
    );
    serviceLocator.registerFactory<HomeBloc>(
      () => HomeBloc(
        getProductsUseCase: serviceLocator.get(),
        deleteProductsUseCase: serviceLocator.get(),
      ),
    );
  }
}
