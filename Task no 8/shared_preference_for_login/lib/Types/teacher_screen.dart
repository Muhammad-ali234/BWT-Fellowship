import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preference_for_login/components/button.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  String name = '';
  String email = '';
  String password = '';
  String age = '';
  String usertype = '';

  @override
  void initState() {
    loadTeacherData();
    super.initState();
  }

  void loadTeacherData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      name = sp.getString('name') ?? '';
      email = sp.getString('email') ?? '';
      password = sp.getString('password') ?? '';
      age = sp.getString('age') ?? '';
      usertype = sp.getString('userType') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Teacher Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name :\n'),
                    Text('Email :\n'),
                    Text('Password :\n'),
                    Text('Age :\n'),
                    Text('userType :\n'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('$name\n'),
                    Text('${email.toString()}\n'),
                    Text('${password.toString()}\n'),
                    Text('${age.toString()}\n'),
                    Text('${usertype.toString().toUpperCase()}\n'),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const ButtonWidget(),
          ],
        ),
      ),
    );
  }
}
