import 'package:flutter/material.dart';
import '../models/product.dart';

class InventoryProvider with ChangeNotifier {
  // Data Produk
  final List<Product> _items = [];
  
  // Data Profile
  String _userName = "Guest"; 

  List<Product> get items => [..._items];
  String get userName => _userName;

  // --- TAMBAHKAN DUA BARIS INI ---
  // Menghitung total stok (jumlah semua quantity produk)
  int get totalStock => _items.fold(0, (sum, item) => sum + item.stock);

  // Menghitung total nilai (harga x stok untuk semua produk)
  double get totalValue => _items.fold(0, (sum, item) => sum + (item.price * item.stock));
  // -------------------------------

  void setUserName(String name) {
    if (name.isNotEmpty) {
      _userName = name;
      notifyListeners();
    }
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void deleteProduct(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}