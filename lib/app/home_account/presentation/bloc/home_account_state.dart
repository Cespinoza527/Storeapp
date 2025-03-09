import 'package:appstore/app/home_account/presentation/model/home_account_model.dart';


sealed class HomeAccountState {
  HomeAccountState({required this.model});

  final HomeAccountModel model;
}

final class UserEmptyState extends HomeAccountState {
  UserEmptyState() : super(model: HomeAccountModel(users: []));
}

final class UserLoadingState extends HomeAccountState {
  final String message;
  UserLoadingState({this.message = "Cargando Usuarios..."})
    : super(model: HomeAccountModel(users : []));
}

final class UserLoadDataState extends HomeAccountState {
  UserLoadDataState({required super.model});
}

final class UserHomeErrorState extends HomeAccountState {
  UserHomeErrorState({required super.model, required this.message});
  final String message;
}


final class UserLogoutState extends HomeAccountState {
  UserLogoutState() : super(model: HomeAccountModel(users: []));
}

