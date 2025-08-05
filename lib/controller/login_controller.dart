import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final SupabaseClient _supabase = Supabase.instance.client;

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showToast("Please fill all fields", Colors.red);
      return;
    }
    if (password.length < 6) {
      _showToast("Password must be at least 6 characters", Colors.orange);
      return;
    }

    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        _showToast("Login Successful", Colors.green);

        // Navigate to HomeView
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _showToast("Invalid login credentials", Colors.red);
      }
    } on AuthException catch (e) {
      _showToast(e.message, Colors.red);
    } catch (e) {
      _showToast("Unexpected error: $e", Colors.red);
    }
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
