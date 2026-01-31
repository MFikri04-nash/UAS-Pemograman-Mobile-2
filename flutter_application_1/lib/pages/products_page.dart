import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/inventory_provider.dart'; // Harus di-import agar tidak merah

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Memanggil provider dengan nama class yang benar (pakai y)
    final provider = Provider.of<InventoryProvider>(context);

    return Column(
      children: [
        // Ringkasan Statistik Biru
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              _buildStatCard("Total Products", "${provider.items.length}", const Color(0xFF1A237E)),
              const SizedBox(width: 12),
              _buildStatCard("Total Value", "\$${provider.totalValue.toStringAsFixed(0)}", Colors.blueGrey),
            ],
          ),
        ),
        // List Barang
        Expanded(
          child: ListView.builder(
            itemCount: provider.items.length,
            itemBuilder: (ctx, i) {
              final item = provider.items[i];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.inventory_2)),
                  title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(item.model),
                  trailing: Text("${item.stock}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}