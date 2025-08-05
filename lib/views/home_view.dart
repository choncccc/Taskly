import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    // Get username from user metadata, fallback to email
    final username = user?.userMetadata?['username'] ?? user?.email ?? 'Guest';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await Supabase.instance.client.auth.signOut();
              Navigator.pushReplacementNamed(context, '/'); // Back to login
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome, $username!',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
