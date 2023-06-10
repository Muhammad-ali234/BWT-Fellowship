import 'package:flutter/material.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'My skills go here!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('C++'),
              subtitle: const Text('Fundamental, OOP, and DataStructure'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // navigate to the detail screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Python'),
              subtitle: const Text('Fundamental, OOP, and DataStructure'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // navigate to the detail screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
