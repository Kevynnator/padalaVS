import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();

    Future<void> _registerUser() async {
      String username = usernameController.text;
      String password = passwordController.text;
      String phoneNumber = phoneNumberController.text;

      if (username.isNotEmpty &&
          password.isNotEmpty &&
          phoneNumber.isNotEmpty) {
        var url = Uri.parse('http://kevynn.helioho.st/path/to/create_user.php');
        var response = await http.post(url, body: {
          'username': username,
          'password': password,
          'phone_number': phoneNumber,
        });

        var data = json.decode(response.body);
        if (data['status'] == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'])),
          );

          // Navigate to HomeScreen with the username
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(username: username),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(data['message'])),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all fields.')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 210, 10),
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/loginbg.png', fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to',
                    style: TextStyle(
                      fontFamily: 'LeagueSpartan',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(85, 64, 4, 100),
                    ),
                  ),
                  const Text(
                    'CERES PADALA',
                    style: TextStyle(
                      fontFamily: 'LeagueSpartan',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
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
                  const SizedBox(height: 20),
                  TextField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Spacer(), // Add a Spacer to push the buttons to the bottom
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.orange,
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Add your upload profile picture logic here
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Upload your Profile Picture',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _registerUser,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
