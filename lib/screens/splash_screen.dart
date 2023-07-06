import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multirole_app/screens/student_view.dart';
import 'package:multirole_app/screens/join_login.dart';
import 'package:multirole_app/screens/teacher_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    bool isLogin = sp.getBool('isLogin') ?? false;

    String userType = sp.getString('userType') ?? '';

    if (isLogin) {
      if (userType == 'Student') {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StudentView()),
          );
        });
      } else {
        // if teacher
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TeacherView()),
          );
        });
      }
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Join()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/3.jpg',
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
