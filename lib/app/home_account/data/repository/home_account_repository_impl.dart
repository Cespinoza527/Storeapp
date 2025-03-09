
import 'package:appstore/app/core/data/remote/service/user_service.dart';
import 'package:appstore/app/core/domain/entity/user_entity.dart';

import 'package:appstore/app/home_account/domain/repository/home_account_repository.dart';

class HomeAccountRepositoryImpl implements HomeAccountRepository {
  final UserService userService;

  HomeAccountRepositoryImpl({required this.userService});

  @override
  Future<List<UserEntity>> getUsers() async {
    final List<UserEntity> users = [];

    try {
      final response = await userService.getAll();
      for (var element in response) {
        users.add(element.toEntity());
      }
    } catch (e) {
      throw (Exception(e));
    }

    return users;
  }
}
