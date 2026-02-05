import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background abstract shapes
          Positioned(
            top: -50,
            right: -60,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                color: Color(0xFF0055FF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 140),
                const Text(
                  'Create\nAccount',
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, height: 1.1),
                ),
                const SizedBox(height: 40),

                // Circular Photo Uploader
                Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2, style: BorderStyle.solid),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt_outlined, color: Colors.blueAccent, size: 35),
                  ),
                ),
                const SizedBox(height: 40),

                _buildInput("Email"),
                const SizedBox(height: 15),
                _buildInput("Password", isPassword: true),
                const SizedBox(height: 15),

                // Phone Number Input
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    children: [
                      Text("🇬🇧", style: TextStyle(fontSize: 20)),
                      Icon(Icons.keyboard_arrow_down, size: 16),
                      SizedBox(width: 10),
                      Text("|", style: TextStyle(color: Colors.grey, fontSize: 20)),
                      SizedBox(width: 10),
                      Expanded(child: TextField(decoration: InputDecoration(hintText: 'Your number', border: InputBorder.none))),
                    ],
                  ),
                ),
                const SizedBox(height: 60),

                _buildPrimaryButton("Done", () {}),
                Center(child: TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel", style: TextStyle(color: Colors.grey)))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInput(String hint, {bool isPassword = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(20)),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          suffixIcon: isPassword ? const Icon(Icons.visibility_off_outlined, size: 18) : null,
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(String text, VoidCallback onPressed) {
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