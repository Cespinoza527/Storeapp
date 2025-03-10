import 'package:appstore/app/core/data/remote/service/product_service.dart';
import 'package:appstore/app/core/data/remote/service/user_service.dart';
import 'package:appstore/app/core/data/repository/session_repository_impl.dart';
import 'package:appstore/app/core/domain/repository/session_repository.dart';
import 'package:appstore/app/core/domain/use_case/logout_use_case.dart';
import 'package:appstore/app/form_product/data/repository/form_product_repository_impl.dart';
import 'package:appstore/app/form_product/domain/repository/form_product_repository.dart';
import 'package:appstore/app/form_product/domain/use_case/add_product_use_case.dart';
import 'package:appstore/app/form_product/domain/use_case/get_product_use_case.dart';
import 'package:appstore/app/form_product/domain/use_case/update_product_use_case.dart';
import 'package:appstore/app/form_product/presentation/bloc/form_product_bloc.dart';
import 'package:appstore/app/home/data/repository/home_repository_impl.dart';
import 'package:appstore/app/home/domain/repository/home_repository.dart';
import 'package:appstore/app/home/domain/use_case/delete_products_use_case.dart';
import 'package:appstore/app/home/domain/use_case/get_products_use_case.dart';
import 'package:appstore/app/home/presentation/bloc/home_bloc.dart';
import 'package:appstore/app/home_account/data/repository/home_account_repository_impl.dart';
import 'package:appstore/app/home_account/domain/repository/home_account_repository.dart';
import 'package:appstore/app/home_account/domain/use_case/get_users_use_case.dart';
import 'package:appstore/app/home_account/presentation/bloc/home_account_bloc.dart';
import 'package:appstore/app/login/data/repository/login_repository_impl.dart';
import 'package:appstore/app/login/domain/repository/login_repository.dart';
import 'package:appstore/app/login/domain/use_case/login_use_case.dart';
import 'package:appstore/app/login/presentation/bloc/login_bloc.dart';
import 'package:appstore/app/signup/data/repository/signup_repository_impl.dart';
import 'package:appstore/app/signup/domain/repository/signup_repository.dart';
import 'package:appstore/app/signup/domain/use_case/add_user_use_case.dart';
import 'package:appstore/app/signup/presentation/bloc/signup_bloc.dart';
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

        serviceLocator.registerFactory<UserService>(
      () => UserService(dio: serviceLocator.get()),
    );

        serviceLocator.registerFactory<SessionRepository>(
      () => SessionRepositoryImpl(),
    );
    serviceLocator.registerFactory<LogoutUseCase>(
      () => LogoutUseCase(sessionRepository: serviceLocator.get()),
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

    serviceLocator.registerFactory<FormProductRepository>(
      () => FormProductRepositoryImpl(productService: serviceLocator.get()),
    );
    serviceLocator.registerFactory<AddProductUseCase>(
      () => AddProductUseCase(formProductRepository: serviceLocator.get()),
    );


    serviceLocator.registerFactory<GetProductUseCase>(
      () => GetProductUseCase(formProductRepository: serviceLocator.get()),
    );
    serviceLocator.registerFactory<UpdateProductUseCase>(
      () => UpdateProductUseCase(formProductRepository: serviceLocator.get()),
    );
    serviceLocator.registerFactory<FormProductBloc>(
      () => FormProductBloc(
        addProductUseCase: serviceLocator.get(),
        getProductUseCase: serviceLocator.get(),
        updateProductUseCase: serviceLocator.get(),
      ),
    );


 serviceLocator.registerFactory<SignupRepository>(
      () => SignupRepositoryImpl(userService: serviceLocator.get()),
    );


    serviceLocator.registerFactory<AddUserUseCase>(
      () => AddUserUseCase(signupRepository: serviceLocator.get()),
    );


    serviceLocator.registerFactory<SignupBloc>(
      () => SignupBloc(
        addUserUseCase: serviceLocator.get(),
        //getUserUseCase: serviceLocator.get(),
      ),
    );

    serviceLocator.registerFactory<HomeAccountRepository>(
      () => HomeAccountRepositoryImpl(userService: serviceLocator.get()),
    );
    serviceLocator.registerFactory<GetUsersUseCase>(
      () => GetUsersUseCase(homeAccountRepository: serviceLocator.get()),
    );
    serviceLocator.registerFactory<HomeAccountBloc>(
      () => HomeAccountBloc(
        getUsersUseCase: serviceLocator.get(),
        logoutUseCase: serviceLocator.get(),
      ),
    );


        serviceLocator.registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(productService: serviceLocator.get()),
    );
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
        logoutUseCase: serviceLocator.get(),
      ),
    );

  }
}
