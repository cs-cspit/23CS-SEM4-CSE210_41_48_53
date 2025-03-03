import 'package:flutter/material.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/student_profile.dart';
import 'package:flutter_application_1/faculty_profile.dart';
import 'package:flutter_application_1/register.dart';
import 'package:flutter_application_1/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Edu Venture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        'home': (context) => const HomeScreen(),
        'student_profile': (context) => const StudentProfile(),
        'faculty_profile': (context) => const FacultyProfile(),
        'register': (context) => const MyRegister(),
        'login': (context) => const MyLogin(),
      },
    );
  }
}