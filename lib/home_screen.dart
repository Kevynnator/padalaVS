import 'package:flutter/material.dart';
import 'claim_screen.dart'; // Import the ClaimScreen
import 'profile_screen.dart'; // Import the ProfileScreen

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: [
            // CircleAvatar(
            //   backgroundImage: AssetImage(
            //       'assets/profile_picture.png'), // Replace with the actual profile picture asset
            // ),

            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ma\'ayong Adlaw!',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  username,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/homebg.png',
                fit: BoxFit.cover), // Replace with the actual background asset
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildGridButton(context, 'Padala', Icons.local_shipping),
                  _buildGridButton(context, 'Claim', Icons.check_box),
                  _buildGridButton(context, 'Status', Icons.location_on),
                  _buildGridButton(context, 'Profile', Icons.person),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String label, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        if (label == 'Claim') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ClaimScreen(),
            ),
          );
        } else if (label == 'Profile') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        } else {
          // Add navigation or functionality for other buttons here
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.black),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
