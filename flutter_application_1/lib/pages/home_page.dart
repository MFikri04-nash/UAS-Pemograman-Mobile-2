import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/inventory_provider.dart';
import 'package:provider/provider.dart';
import 'products_page.dart';
import 'stock_page.dart';
import 'profile_page.dart';
import 'report_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Pastikan nama class di bawah ini (ProductsPage, StockPage, ProfilePage) 
  // sama persis dengan nama class yang tertulis di dalam file masing-masing.
  final List<Widget> _pages = [
    const ProductsPage(), // Diubah dari ProductPage ke ProductsPage sesuai gambar sidebar Anda
    const StockPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const ReportPage())
              );
            },
          )
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Stock"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
   // Pastikan pakai 'y' sesuai nama class di atas
final provider = Provider.of<InventoryProvider>(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.blue.shade50,
          child: Row(
            children: [
              Expanded(child: _buildCard("Total Stock", "${provider.totalStock}", Colors.blue)),
              const SizedBox(width: 12),
              Expanded(child: _buildCard("Total Value", "\$${provider.totalValue}", Colors.indigo)),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(alignment: Alignment.centerLeft, child: Text("Quick Actions", style: TextStyle(fontWeight: FontWeight.bold))),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.items.length,
            itemBuilder: (ctx, i) => ListTile(
              leading: const CircleAvatar(child: Icon(Icons.inventory_2)),
              title: Text(provider.items[i].name),
              subtitle: Text("Stock: ${provider.items[i].stock}"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductsPage())),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCard(String title, String val, Color col) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: col, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          Text(val, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}