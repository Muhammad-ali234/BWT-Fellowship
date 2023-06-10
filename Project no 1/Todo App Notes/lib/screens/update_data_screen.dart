import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UpdateDataScreen extends StatefulWidget {
  const UpdateDataScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldValidationExampleState createState() =>
      _TextFieldValidationExampleState();
}

class _TextFieldValidationExampleState extends State<UpdateDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  // final TextEditingController _textFieldController3 = TextEditingController();
  final TextEditingController _textFieldController4 = TextEditingController();
  // final TextEditingController _textFieldController5 = TextEditingController();

  String? _validateTextField1(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a value';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid integer';
    }
    return null;
  }

  String? _validateTextField2(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a value';
    }
    return null;
  }

  late int id;
  //age;
  late String title, description;
  // email;
  var myMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Update Data Screen'),
        backgroundColor: Colors.deepPurple[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _textFieldController2,
                  decoration: const InputDecoration(
                    labelText: 'Enter Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: _validateTextField2,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _textFieldController4,
                  decoration: const InputDecoration(
                    labelText: 'Enter Description',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateTextField2,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.deepPurple[200],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        // all fields are valid

                        title = _textFieldController2.text;

                        description = _textFieldController4.text;

                        myMap = {
                          'title': title,
                          'description': description,
                        };
                        Navigator.pop(context, myMap);
                      }
                    });
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('id', id));
  }
}
