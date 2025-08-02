import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _showForm = false;
  bool _logoAtTop = false;

  @override
  void initState() {
    super.initState();
    // Animate logo + form
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _logoAtTop = true;
      });
      Future.delayed(const Duration(milliseconds: 600), () {
        setState(() {
          _showForm = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Form Section
            if (_showForm)
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 240.0,
                  bottom: 30.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Username label
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      // Username input
                      TextField(
                        cursorColor: const Color(0xFF0B375C),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(16.0), 
                            child: SvgPicture.asset(
                              'assets/img/user.svg',
                              height: 20,
                              width: 20,
                              colorFilter: const ColorFilter.mode(
                                  Colors.blue, BlendMode.srcIn),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                            borderSide:
                                BorderSide(color: Color(0xFF1975BD), width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password label
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      // Password input
                      TextField(
                        cursorColor: const Color(0xFF0B375C),
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SvgPicture.asset(
                              'assets/img/lock.svg',
                              height: 20,
                              width: 20,
                              colorFilter: const ColorFilter.mode(
                                  Colors.blue, BlendMode.srcIn),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18.0)),
                            borderSide:
                                BorderSide(color: Color(0xFF1975BD), width: 2.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Login button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: const Color(0xFF0B375C),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Register link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF1975BD),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Forgot password link
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/forgot-password');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF1975BD),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade400,
                              thickness: 1,
                              endIndent: 10,
                            ),
                          ),
                          const Text(
                            'Or login with',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade400,
                              thickness: 1,
                              indent: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Social login buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // TODO: Implement Google login
                            },
                            child: SvgPicture.asset(
                              'assets/img/brand-google.svg',
                              height: 30,
                              width: 30,
                              colorFilter: const ColorFilter.mode(
                                  Colors.blue, BlendMode.srcIn),
                            ),
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              // TODO: Implement Facebook login
                            },
                            child: SvgPicture.asset(
                              'assets/img/brand-facebook.svg',
                              height: 30,
                              width: 30,
                              colorFilter: const ColorFilter.mode(
                                  Colors.blue, BlendMode.srcIn),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(duration: 800.ms),

            // Logo animation
            IgnorePointer(
              ignoring: true,
              child: AnimatedAlign(
                alignment:
                    _logoAtTop ? Alignment.topCenter : Alignment.center,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
                  margin: EdgeInsets.only(top: _logoAtTop ? 30 :30),
                  height: _logoAtTop ? 200 : 300,
                  width: _logoAtTop ? 200 : 300,
                  child: Image.asset(
                    'assets/img/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
