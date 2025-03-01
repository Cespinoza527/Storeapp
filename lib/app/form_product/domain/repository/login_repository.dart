import 'package:appstore/app/login/domain/entity/login_entity.dart';

abstract class LoginRepository {
  bool login(LoginEntity loginEntity);
}
