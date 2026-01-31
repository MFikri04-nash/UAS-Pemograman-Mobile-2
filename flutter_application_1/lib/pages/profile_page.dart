import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile & Settings")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
          const ListTile(title: Text("John Doe"), subtitle: Text("Administrator"), leading: Icon(Icons.badge)),
          const Divider(),
          const ListTile(title: Text("App Settings"), leading: Icon(Icons.settings)),
          const ListTile(title: Text("Help & Support"), leading: Icon(Icons.help)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  LoginPage()), (route) => false),
              child: const Center(child: Text("Log Out")),
            ),
          )
        ],
      ),
    );
  }
}