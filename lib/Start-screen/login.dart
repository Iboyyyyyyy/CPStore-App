import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Large blue organic shapes from image
          Positioned(top: -100, left: -50, child: _buildBlob(350, const Color(0xFF0055FF))),
          Positioned(top: -50, right: -100, child: _buildBlob(300, Colors.blue.withOpacity(0.1))),
          Positioned(top: 300, right: -60, child: _buildBlob(200, const Color(0xFF0055FF))),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 5),
                const Text('Login', style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold)),
                const Row(
                  children: [
                    Text('Good to see you back! ', style: TextStyle(fontSize: 18, color: Colors.black54)),
                    Icon(Icons.favorite, size: 18),
                  ],
                ),
                const SizedBox(height: 40),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(20)),
                  child: const TextField(decoration: InputDecoration(hintText: 'Email', border: InputBorder.none)),
                ),
                const SizedBox(height: 50),

                _buildButton("Next", () {}),
                const SizedBox(height: 10),
                Center(child: TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel", style: TextStyle(color: Colors.grey)))),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlob(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0055FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
        ),
        child: Text(text, style: const TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}