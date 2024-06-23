import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Yatayda maksimum genişlik
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(25.0), // Buton kenar yuvarlaklığı
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    );
  }
}
