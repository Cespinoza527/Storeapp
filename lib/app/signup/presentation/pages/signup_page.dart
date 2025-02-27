import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,body: SignupLogin());
  }
}

class SignupLogin extends StatelessWidget {
  const SignupLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25.0),
          padding: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SignUpRegistro(),
        ),
      ),
    );
  }
}

class SignUpRegistro extends StatefulWidget {
  const SignUpRegistro({super.key});

  @override
  State<SignUpRegistro> createState() => _SignUpRegistroState();
}

class _SignUpRegistroState extends State<SignUpRegistro> {
  String urlImagen = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(radius: 70.0, backgroundImage: NetworkImage(urlImagen)),
        SizedBox(height: 40.0),
        TextField(
          decoration: InputDecoration(
            labelText: "Usuario:",
            icon: Icon(Icons.person_rounded),
            hintText: "Escriba su usuario",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 30.0),
        TextField(
          decoration: InputDecoration(
            labelText: "Email:",
            icon: Icon(Icons.email_outlined),
            hintText: "Escriba su email",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 30.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Contraseña:",
            icon: Icon(Icons.lock),
            hintText: "Escriba su contraseña",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(height: 30.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Confirmar Contraseña:",
            icon: Icon(Icons.lock),
            hintText: "Escriba su contraseña",
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(height: 30.0),
        TextField(
          decoration: InputDecoration(
            labelText: "Imagen:",
            icon: Icon(Icons.image),
            hintText: "Ingrese la URL de imagen",
            hintStyle: TextStyle(color: Colors.grey),
          ),
          onChanged:
              (value) => setState(() {
                urlImagen = value;
              }),
        ),
        SizedBox(height: 30.0),
        FilledButton(
          onPressed: () => {},
          style: FilledButton.styleFrom(backgroundColor: Colors.blue[900]),
          child: SizedBox(
            width: double.infinity,
            child: Text("Registrarse", textAlign: TextAlign.center),
          ),
        ),
        SizedBox(height: 30.0,),
        GestureDetector(
          child: Text(
            "Ya tengo una Cuenta",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
            ),
          ),
          onTap: () => GoRouter.of(context).pushNamed("login"),
        ),
      ],
    );
  }
}
