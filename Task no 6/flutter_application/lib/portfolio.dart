import 'package:flutter/material.dart';
import './skillscreen.dart';
import './educationdetail.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'My Portfolio',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text('Education'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EducationPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Skills'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SkillsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: const [
            Image(image: AssetImage('assets/profile.png')),
            Text(
              'Welcome to my portfolio',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
