import 'package:appstore/app/signup/domain/use_case/add_user_use_case.dart';
import 'package:appstore/app/signup/domain/use_case/get_user_use_case.dart';
import 'package:appstore/app/signup/presentation/bloc/signup_event.dart';
import 'package:appstore/app/signup/presentation/bloc/signup_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AddUserUseCase addUserUseCase;
  //final GetUserUseCase getUserUseCase;


  SignupBloc({
    required this.addUserUseCase,
    //required this.getUserUseCase,
  }) : super(InitialState()) {
    on<UserNameChangedEvent>(_userNameChangedEvent);
    on<UserEmailChangedEvent>(_userEmailChangedEvent);
    on<UserPasswordChangedEvent>(_userPasswordChangedEvent);
    on<UserUrlImageChangedEvent>(_userUrlImageChangedEvent);
    on<UserSubmitEvent>(_userSubmitEvent);
    //on<GetUserEvent>(_getUserEvent);
  }

  void _userNameChangedEvent(
    UserNameChangedEvent event,
    Emitter<SignupState> emit,
  ) {
    final newState = DataUpdateState(
      model: state.model.copyWith(user: event.user),
    );

    emit(newState);
  }

  void _userEmailChangedEvent(
    UserEmailChangedEvent event,
    Emitter<SignupState> emit,
  ) {
    final newState = DataUpdateState(
      model: state.model.copyWith(email: event.email),
    );
    emit(newState);
  }

  void _userPasswordChangedEvent(
    UserPasswordChangedEvent event,
    Emitter<SignupState> emit,
  ) {
    final newState = DataUpdateState(
      model: state.model.copyWith(password: event.password),
    );
    emit(newState);
  }

  void _userUrlImageChangedEvent(
    UserUrlImageChangedEvent event,
    Emitter<SignupState> emit,
  ) {
    final newState = DataUpdateState(
      model: state.model.copyWith(image: event.image),
    );
    emit(newState);
  }

  void _userSubmitEvent(
    UserSubmitEvent event,
    Emitter<SignupState> emit,
  ) async {
    late final SignupState newState;
    try {
      final bool result;
      if (state.model.id == "") {
        result = await addUserUseCase.invoke(state.model);
      } else {
        result = false;
      }

      if (result) {
        newState = SubmitSuccessState(model: state.model);
      } else {
        throw (Exception());
      }
    } catch (e) {
      newState = SubmitErrorState(
        model: state.model,
        message:
            state.model.id == ""
                ? "Error al Registrarse"
                : "Error Actualizar",
      );
    }

    emit(newState);
  }

  /*void _getUserEvent(
    GetUserUseCase event,
    Emitter<SignupState> emit,
  ) async {
    final result = await getUserUseCase.invoke(event.id);
    final newState = DataUpdateState(model: result);
    emit(newState);
  }*/
}
