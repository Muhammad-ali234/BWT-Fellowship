import 'package:flutter/material.dart';
import 'package:shared_preference_for_login/Page/splash_screen.dart';
import 'package:shared_preference_for_login/Types/admin_screen.dart';
import 'package:shared_preference_for_login/Page/sign_up_screen.dart';
import 'package:shared_preference_for_login/Types/student_screen.dart';
import 'package:shared_preference_for_login/Types/teacher_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const SplashScreen(),
        'signup': (context) => const SignUpScreen(),
        '/teacherscreen': (context) => const TeacherScreen(),
        '/studentscreen': (context) => const StudentScreen(),
        '/adminscreen': (context) => const AdminScreen(),
      },
    );
  }
}
