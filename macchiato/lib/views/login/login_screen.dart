import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/login/logo.png',
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.3,
                ),
                const SizedBox(height: 12),
                const TextField(
                  decoration: InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                  controller: null,
                ),
                SizedBox(height: screenHeight * 0.05),
                const TextField(
                  decoration: InputDecoration(
                      label: Text("Password"),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                  controller: null,
                  obscureText: true,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
