import 'dart:io';

import 'package:flutter/material.dart';
import 'package:isar_mobx_login_test/dev/ui/dio_test_screen.dart';
// import 'package:isar_mobx_login_test/pages/user_model.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DioTest(),
    );
  }
}
