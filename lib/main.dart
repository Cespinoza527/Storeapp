import 'package:appstore/app/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:appstore/app/main_app.dart';

void main() {
  DependencyInjection.setup();
  runApp(const MainApp());
}
