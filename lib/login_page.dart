// screens/login_page.dart
import 'package:flutter/material.dart';
import 'user_database.dart';
import 'user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      String userId = _idController.text;
      User? user = await UserDatabase.instance.getUser(userId);

      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home', arguments: user);
      } else {
        // If user doesn't exist, create a new user
        User newUser = User(id: userId, username: 'New User', email: '');
        await UserDatabase.instance.insertUser(newUser);
        Navigator.pushReplacementNamed(context, '/home', arguments: newUser);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Language Learning App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'Enter User ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your User ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text('Login or Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
