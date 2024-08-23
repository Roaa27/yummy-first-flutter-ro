import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String email;

  const ProfileScreen({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.orange,
            ),
            const SizedBox(height: 20),
            Text(
              'Name: $name',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to log out and navigate to login screen
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
