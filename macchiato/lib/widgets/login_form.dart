import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:macchiato/viewmodels/login_viewmodel.dart';
import 'package:macchiato/widgets/custom_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<LoginViewModel>(
      builder: (context, model, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/login/logo.png',
              height: screenHeight * 0.3,
              width: screenWidth * 0.3,
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              onChanged: (value) => model.email = value,
            ),
            SizedBox(height: screenHeight * 0.05),
            TextField(
              decoration: const InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              onChanged: (value) => model.password = value,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Signin",
              onPressed: () => model.signIn(context),
            ),
          ],
        );
      },
    );
  }
}
