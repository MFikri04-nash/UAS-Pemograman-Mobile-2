import '../models/product.dart';

class MockApi {
  static List<Product> getMockProducts() {
    return [
      Product(id: '1', name: 'Laptop Pro X', brand: 'LPX', model: 'LPX-550', stock: 485, price: 1250.0, imageUrl: 'https://picsum.photos/200'),
      Product(id: '2', name: 'Smartphone Model S', brand: 'Seomang', model: '521 Ultra', stock: 78, price: 900.0, imageUrl: 'https://picsum.photos/201'),
      Product(id: '3', name: 'Audio Tech', brand: 'SoundMaster', model: 'A-10', stock: 25, price: 150.0, imageUrl: 'https://picsum.photos/202'),
    ];
  }
}