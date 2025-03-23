import 'package:flutter/material.dart';
import 'navbar.dart'; // Import the custom bottom nav bar

class ClaimScreen extends StatelessWidget {
  const ClaimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Claim'),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/claimbg.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CURRENT PACKAGE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Food & Beverages',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'BUS NO: 7183',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add your generate QR logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 20,
                          ),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('Generate Qr'),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'To claim your package, please click the "Generate QR" button. Present the generated QR code to our personnel when collecting your package at the Ceres terminal.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Add your bus status logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 20,
                          ),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: const Text('Bus Status'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3, // Set the current index to the Claim screen
        onTap: (index) {
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              // Navigate to QR
              break;
            case 1:
              // Navigate to Bus
              break;
            case 2:
              // Navigate to Home
              break;
            case 3:
              // Navigate to Claim
              break;
            case 4:
              // Navigate to Profile
              break;
          }
        },
      ),
    );
  }
}
