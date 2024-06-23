import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:macchiato/viewmodels/login_viewmodel.dart';
import 'package:macchiato/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: LoginForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
