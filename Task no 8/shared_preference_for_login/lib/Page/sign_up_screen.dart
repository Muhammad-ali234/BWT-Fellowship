import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preference_for_login/Types/admin_screen.dart';
import 'package:shared_preference_for_login/Types/teacher_screen.dart';
import 'package:shared_preference_for_login/Types/student_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? dropdownvalue; // this variable store the value of dropdown button...

  // List of items in our dropdown menu
  var items = [
    'Admin',
    'Teacher',
    'Student',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Name';
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: passController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: ageController,
                decoration: const InputDecoration(
                  labelText: 'Age',
                ),
              ),
              const SizedBox(
                height: 30,
              ),

              // use of drop Down Button for taking input from users.
              // that select their role for login into the specific screen.
              DropdownButton(
                hint: const Text(
                    'Please Select Your Role                       '),
                dropdownColor: Colors.teal,
                borderRadius: BorderRadius.circular(15),
                elevation: 0,
                focusColor: Colors.amber,
                autofocus: true,
                iconEnabledColor: Colors.teal,
                underline:
                    const Text('____________________________________________'),
                // Initial Value
                value: dropdownvalue,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('name', nameController.text.toString());
                    sp.setString('email', emailController.text.toString());
                    sp.setString('password', passController.text.toString());
                    sp.setString('age', ageController.text.toString());
                    sp.setBool('isLogin', true);
                    sp.setString('userType', dropdownvalue.toString());

                    // for knowing the user that already login or not.
                    // And navigate to their mention screen.

                    bool isLogin = sp.getBool('isLogin') ?? false;
                    String userType = sp.getString('userType') ?? '';

                    if (_formKey.currentState!.validate()) {
                      if (isLogin) {
                        if (userType == 'Student'.trim()) {
                          Timer(const Duration(milliseconds: 10), () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentScreen()));
                          });
                        } else if (userType == 'Teacher'.trim()) {
                          Timer(const Duration(milliseconds: 10), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TeacherScreen(),
                              ),
                            );
                          });
                        } else if (userType == 'Admin'.trim()) {
                          Timer(const Duration(milliseconds: 10), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AdminScreen(),
                              ),
                            );
                          });
                        }
                      } else {
                        Timer(
                          const Duration(seconds: 100),
                          () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                        );
                      }
                    }
                    // ignore: use_build_context_synchronously
                  },
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
