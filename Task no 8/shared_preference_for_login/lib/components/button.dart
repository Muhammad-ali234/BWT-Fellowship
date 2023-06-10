import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preference_for_login/Page/sign_up_screen.dart';
// ignore_for_file: use_build_context_synchronously


class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        SharedPreferences sp = await SharedPreferences.getInstance();

        sp.clear(); // for deleting data from local storage.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpScreen(),
          ),
        );
      },
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: const Center(
          child: Text(
            'Logout',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}
