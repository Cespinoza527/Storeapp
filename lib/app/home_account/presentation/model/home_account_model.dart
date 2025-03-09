
import 'package:appstore/app/home_account/presentation/model/account_model.dart';

class HomeAccountModel {
  final List<AccountModel> users;

  HomeAccountModel({required this.users});

  HomeAccountModel copyWith({List<AccountModel>? users}) {
    return HomeAccountModel(users: users ?? this.users);
  }
}
