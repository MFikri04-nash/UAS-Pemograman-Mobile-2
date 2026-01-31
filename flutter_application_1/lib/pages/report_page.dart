import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stock Report")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Monthly Stock Report", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(child: Center(child: Icon(Icons.bar_chart, size: 200, color: Colors.blue.shade100))),
            const ListTile(title: Text("Net Change"), trailing: Text("+35", style: TextStyle(color: Colors.green))),
          ],
        ),
      ),
    );
  }
}