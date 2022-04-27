import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_student_using_dot_net_api/dio_helper.dart';
import 'package:test_student_using_dot_net_api/student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Student> list_of_student = [];
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3)).then((value) {
      _loadData();
    });
    super.initState();
  }

  Future<void> _loadData() async {
    DioHelper.dio!.get("students").then((value) {
      value.data.forEach((element) {
        list_of_student.add((Student.fromJson(element)));
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [...list_of_student.map((e) => Text(e.name.toString()))],
      ),
    );
  }
}
