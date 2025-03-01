import 'package:appstore/app/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appstore/app/login/presentation/pages/login_page.dart';
import 'package:appstore/app/signup/presentation/pages/signup_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/login', builder: (_, _) => LoginPage(), name: "login"),
        GoRoute(
          path: '/sign-up',
          builder: (_, _) => SignupPage(),
          name: "sign-up",
        ),
        GoRoute(
          path: '/',
          builder: (_, _) => HomePage(),
          name: "home",
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router);
  }
}

class TestStateful extends StatefulWidget {
  const TestStateful({super.key});

  @override
  State<TestStateful> createState() => TestStatefulState();
}

class TestStatefulState extends State<TestStateful> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
