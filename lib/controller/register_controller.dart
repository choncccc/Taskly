import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void register(BuildContext context) {
    String email = emailController.text.trim();
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();


    if (email.isEmpty || username.isEmpty || password.isEmpty) {
      _showToast("Please fill all fields", Colors.red);
      return;
    }
    if (password.length < 6) {
      _showToast("Password must be at least 6 characters", Colors.orange);
      return;
    }
    _showToast("Registered Successfully\nEmail: $email", Colors.green);
      Navigator.pushReplacementNamed(context, '/');
  }

  void _showToast(String msg, Color color) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
    );
  }
}
