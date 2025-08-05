import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'views/login_view.dart';
import 'views/register_view.dart';
import 'views/home_view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://jpnbxkebjshishsfzodj.supabase.co',  
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpwbmJ4a2VianNoaXNoc2Z6b2RqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ0MTA0NjksImV4cCI6MjA2OTk4NjQ2OX0.GvuxP9IQKYsJ-pqxWCQU0bKLBdJ-GecWHlnOS5VBsgQ',                 
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskApp',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/home': (context) => const HomeView(),
      },
    );
  }
}
