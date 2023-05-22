import 'package:codixel/app/users/bindings/user_binding.dart';
import 'package:codixel/app/users/screen/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialBinding: UserBinding(),
      home:  UserScreen(),
    );
  }
}