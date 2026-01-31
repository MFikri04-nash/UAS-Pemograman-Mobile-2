import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () async {
                await Supabase.instance.client.auth.signInWithPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              child: const Text("Login"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>  RegisterPage()),
                );
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
