import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../controller/register_controller.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = RegisterController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40), // Top spacing
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/img/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Email label
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Email input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextField(
                  controller: _controller.emailController,
                  cursorColor: Color(0xFF0B375C),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        'assets/img/mail.svg',
                        height: 20,
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          Colors.blue,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Color(0xFF1975BD), width: 2.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Username label
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Username
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextField(
                  controller: _controller.usernameController,
                  cursorColor: Color(0xFF0B375C),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        'assets/img/user.svg',
                        height: 20,
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          Colors.blue,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Color(0xFF1975BD), width: 2.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Password label
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              const SizedBox(height: 6),

              // Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextField(
                  controller: _controller.passwordController,
                  cursorColor: Color(0xFF0B375C),
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        'assets/img/lock.svg',
                        height: 20,
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          Colors.blue,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Color(0xFF1975BD), width: 2.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Register button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFF0B375C),
                  ),
                  onPressed: () {
                    _controller.register(context);
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1975BD),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}