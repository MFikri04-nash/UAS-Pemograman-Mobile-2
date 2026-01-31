import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text("Stock Movement History", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildMovementTile("Laptop Pro X", "Stock In", "+10", Colors.green),
        _buildMovementTile("Audio Tech", "Stock Out", "-5", Colors.red),
      ],
    );
  }

  Widget _buildMovementTile(String name, String type, String qty, Color col) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text(type),
        trailing: Text(qty, style: TextStyle(color: col, fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
