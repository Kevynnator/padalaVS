import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the login screen

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(85, 64, 4, 100),
          ),
        ),
      ),
      home: Builder(
        builder:
            (context) => Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/openingbg.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Ceres \nPadala',
                            style: TextStyle(
                              fontFamily: 'LeagueSpartan',
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(85, 64, 4, 100),
                              height:
                                  0.9, // Adjust the height property to change vertical spacing
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Ceres Padala is a convenient delivery service in Negros Occidental, using the Ceres bus network to transport packages between cities.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 19,
                              color: Color.fromRGBO(85, 64, 4, 100),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ), // Add some space between the text and the button
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  252,
                                  217,
                                  20,
                                ), // Background color
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 30,
                                ),
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              child: const Text("Let's Go"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
