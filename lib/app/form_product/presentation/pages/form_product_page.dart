import 'dart:async';

import 'package:appstore/app/di/dependency_injection.dart';
import 'package:appstore/app/login/presentation/bloc/login_bloc.dart';
import 'package:appstore/app/login/presentation/bloc/login_event.dart';
import 'package:appstore/app/login/presentation/bloc/login_state.dart';
import 'package:appstore/app/login/presentation/pages/login_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FormProductPage extends StatelessWidget {
  const FormProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: DependencyInjection.serviceLocator.get<LoginBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Aregar Producto"),
        ),
        body: Column(
          children: [
            BodyLoginWidget(),
          ],
        ),
      ),
    );
  }
}

class FooterLoginWidget extends StatelessWidget {
  const FooterLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: Column(
        children: [
          Divider(),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("¿No tienes cuenta? "),
              SizedBox(width: 5.0),
              GestureDetector(
                child: Text(
                  "Registrate",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                  ),
                ),
                onTap: () => GoRouter.of(context).pushNamed("sign-up"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BodyLoginWidget extends StatefulWidget {
  const BodyLoginWidget({super.key});

  @override
  State<BodyLoginWidget> createState() => _BodyLoginWidgetState();
}

class _BodyLoginWidgetState extends State<BodyLoginWidget> with LoginMixin {
  bool _showPassword = false;
  Timer? _autoShowTimer;
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state) {
          case InitialState() || DataUpdateState():
            break;
          case LoginSuccessState():
            GoRouter.of(context).pushReplacementNamed("home");
            break;
          case LoginErrorState():
          showDialog(context: context, builder: (BuildContext context)=>
            AlertDialog(
              title: const Text('Error'),
              content:  Text(state.message),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
            break;
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final bool isValidForm =
              validateEmail(state.model.email) == null &&
              validatePassword(state.model.password) == null;

          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 24.0, left: 24.0, top: 40.0),
              child: Form(
                key: keyForm,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged:
                          (value) => setState(() {
                            bloc.add(EmailChangedEvent(email: value));
                          }),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validateEmail,
                      decoration: InputDecoration(
                        labelText: "Email:",
                        icon: Icon(Icons.person_rounded),
                        hintText: "Escriba su email",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      onChanged:
                          (value) => setState(() {
                            bloc.add(PasswordChangedEvent(password: value));
                          }),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: validatePassword,
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        labelText: "Contraseña:",
                        icon: Icon(Icons.lock),
                        hintText: "Escriba su contraseña",
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: InkWell(
                          onTap: () {
                            _autoShowTimer?.cancel();

                            if (!_showPassword) {
                              _autoShowTimer = Timer(
                                Duration(seconds: 3),
                                () => setState(() {
                                  _showPassword = false;
                                }),
                              );
                            }

                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0),
                    FilledButton(
                      onPressed:
                          isValidForm ? () => {bloc.add(SubmitEvent())} : null,
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Iniciar Sesión",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HeaderLoginWidget extends StatelessWidget {
  const HeaderLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            width: double.infinity,
            height: 180.0,
            fit: BoxFit.fitWidth,
            'https://static.vecteezy.com/system/resources/thumbnails/005/879/539/small_2x/cloud-computing-modern-flat-concept-for-web-banner-design-man-enters-password-and-login-to-access-cloud-storage-for-uploading-and-processing-files-illustration-with-isolated-people-scene-free-vector.jpg',
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Inicio de Sesión',
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
