import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;
  String get password => _password;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    notifyListeners();
  }

  void signIn(BuildContext context) {
    // Giriş işlemleri burada yapılır
    print('Email: $_email, Password: $_password');

    // Giriş başarılı olduktan sonra ana sayfaya yönlendirme
    Navigator.pushReplacementNamed(context, '/home');
  }
}
