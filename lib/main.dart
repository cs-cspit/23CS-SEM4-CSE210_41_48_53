import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'splash.dart';
import 'student_profile.dart';
import 'faculty_profile.dart';
import 'register.dart';
import 'login.dart';
import 'faculty_home.dart';
import 'student_home.dart';
import 'firebase_options.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    
    if (kIsWeb) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.web,
      );
    } else {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    
    runApp(const MyApp());
  } catch (e) {
    debugPrint('Error initializing Firebase: $e');
    runApp(const InitErrorWidget());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Edu Venture',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
      routes: {
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'student_home': (context) => const StudentHome(),
        'faculty_home': (context) => const FacultyHome(),
        'student_profile': (context) => const StudentProfile(),
        'faculty_profile': (context) => const FacultyProfile(),
      },
    );
  }
}
class InitErrorWidget extends StatelessWidget {
  const InitErrorWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Error Occurred"),
        ),
      ),
    );
  }
}
