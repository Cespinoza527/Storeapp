import 'package:appstore/app/login/data/repository/login_repository_impl.dart';
import 'package:appstore/app/login/domain/entity/login_entity.dart';
import 'package:appstore/app/login/domain/repository/login_repository.dart';
import 'package:appstore/app/login/presentation/model/login_form_model.dart';

class LoginUseCase {
  late final LoginRepository _loginRepository;

  LoginUseCase() {
    _loginRepository = LoginRepositoryImpl();
  }

  bool invoke(LoginForModel loginForModel) {
    final LoginEntity data = loginForModel.toEntity();

    return _loginRepository.login(data);
  }
}
