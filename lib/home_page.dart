// screens/home_page.dart
import 'package:flutter/material.dart';
import 'user.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, ${user.username}'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                title: Text(user.username),
                subtitle: Text('Points: ${user.points} | Level: ${user.currentLevel}'),
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text('View & Edit Profile'),
              onPressed: () {
                Navigator.pushNamed(context, '/user_details', arguments: user);
              },
            ),
          ],
        ),
      ),
    );
  }
}
