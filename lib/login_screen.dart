import 'package:flutter/material.dart';
import 'registration_screen.dart'; // Import the registration screen
import 'home_screen.dart'; // Import the home screen
import 'db_helper.dart'; // Import the database helper

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void _loginUser() async {
      String username = usernameController.text;
      String password = passwordController.text;

      if (username.isEmpty || password.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Please fill in both username and password.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        bool isValidUser =
            await DatabaseHelper().verifyUser(username, password);
        if (isValidUser) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(username: username),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: const Text('Incorrect username or password.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/loginbg.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Maayong Adlaw!',
                  style: TextStyle(
                    fontFamily: 'LeagueSpartan',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(85, 64, 4, 100),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Add your forgot password logic here
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                      255,
                      252,
                      217,
                      20,
                    ), // Background color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
                    ),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Sign-in'),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Don't Have Account yet?",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Background color
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
                    ),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: const Text('Sign-Up'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
