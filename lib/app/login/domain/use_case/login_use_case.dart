//import 'package:appstore/app/login/data/repository/login_repository_impl.dart';
import 'package:appstore/app/login/domain/entity/login_entity.dart';
import 'package:appstore/app/login/domain/repository/login_repository.dart';
import 'package:appstore/app/login/presentation/model/login_form_model.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future <bool> invoke(LoginForModel loginForModel) {
    final LoginEntity data = loginForModel.toEntity();

    return loginRepository.login(data);
  }
}
