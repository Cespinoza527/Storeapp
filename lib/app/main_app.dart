import 'package:appstore/app/form_product/presentation/pages/form_product_page.dart';
import 'package:appstore/app/home/presentation/pages/home_page.dart';
import 'package:appstore/app/home_account/presentation/pages/home_account_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:appstore/app/login/presentation/pages/login_page.dart';
import 'package:appstore/app/signup/presentation/pages/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/login',
          builder: (_, _) => LoginPage(),
          name: "login",
          redirect: (context, state) async {
            final prefs = await SharedPreferences.getInstance();
            final bool authenticated = prefs.getBool("login") ?? false;
            if (authenticated) {
              return "/";
            }
            return null;
          },
        ),
        GoRoute(
          path: '/sign-up',
          builder: (_, _) => SignupPage(),
          name: "sign-up",
        ),
        GoRoute(
          path: '/',
          builder: (_, _) => HomePage(),
          name: "home",
          redirect: (context, state) async{
            final prefs = await SharedPreferences.getInstance();
            final bool authenticated = prefs.getBool("login") ?? false;
            if (!authenticated) {
              return "/login";
            }
            return null;
          },
        ),
        GoRoute(
          path: '/form-product',
          builder: (_, _) => FormProductPage(),
          name: "form-product",
        ),
        GoRoute(
          path: '/form-product/:id',
          builder:
              (_, state) => FormProductPage(id: state.pathParameters["id"]),
          name: "form-product-u",
        ),
        GoRoute(
          path: '/home-account',
          builder: (_, _) => HomeAccount(),
          name: "home-account",
        ),
      ],
    );
    return MaterialApp.router(routerConfig: router, debugShowCheckedModeBanner: false,);
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
