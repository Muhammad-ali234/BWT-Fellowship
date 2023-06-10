import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const style1 = TextStyle(
        fontSize: 20, color: Color(0xff6C63FF), fontWeight: FontWeight.bold);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Task no 4',
            style: style1,
          ),
          backgroundColor: const Color.fromARGB(255, 226, 223, 223),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                height: 350,
                width: 380,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 50,
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        CircleAvatar(
                          radius: 120,
                          backgroundImage: AssetImage('assets/profile.png'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Muhammad Ali",
                          style: style1,
                        ),
                        Divider(
                          height: 5,
                          thickness: 3,
                          color: Colors.blue,
                        ),
                        Text(
                          "Flutter Developer",
                          style: style1,
                        ),
                        Text(
                          "Student of Software Engineering",
                          style: style1,
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              width: 350,
              height: 150,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50))),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Bytewise Task no 4',
                  style: style1,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 50,
              child: Container(
                width: 350,
                height: 150,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(50))),
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Bytewise Task no 4',
                    style: style1,
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 226, 223, 223),
      ),
    );
  }
}
