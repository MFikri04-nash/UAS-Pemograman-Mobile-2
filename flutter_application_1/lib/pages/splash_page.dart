import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });

    return const Scaffold(
      backgroundColor: Color(0xFF1A237E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text("E-INVENTORY", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}