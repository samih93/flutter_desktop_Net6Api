import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_student_using_dot_net_api/dio_helper.dart';
import 'package:test_student_using_dot_net_api/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
