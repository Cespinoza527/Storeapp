import 'package:appstore/app/core/domain/entity/user_entity.dart';

abstract class HomeAccountRepository {
  Future <List<UserEntity>> getUsers();
}
