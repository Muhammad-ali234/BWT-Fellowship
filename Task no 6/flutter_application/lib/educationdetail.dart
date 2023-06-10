import 'package:flutter/material.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'My education details go here!',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Bachelor of Science in Computer Science'),
            subtitle: const Text('University of California, Los Angeles'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // navigate to the detail screen
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Bachelor of Science in Computer Science'),
            subtitle: const Text('University of California, Los Angeles'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // navigate to the detail screen
            },
          ),
        ],
      ),
    );
  }
}
