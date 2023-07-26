import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Viewer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'YEEZY BOOST 350 V2',
      description: '9,000,000 đ',
      imageUrl: 'https://kingshoes.vn/data/upload/media/gia%CC%80y-adidas-yeezy-boost-350-v2-beluga-reflective-gw1229-king-shoes-sneaker-real-hcm-11-1639905369.jpeg',
    ),
    Product(
      name: 'JORDAN 1 MID TUFT ORANGE',
      description: '5,800,000 đ',
      imageUrl: 'https://kingshoes.vn/data/upload/media/jordan-1-mid-tuft-orange-bq6931-802-king-shoes-sneaker-real-hcm-1624273330.jpeg',
    ),
    Product(
      name: 'AIR JORDAN 1 HI TROPHY ROOM CHICAGO',
      description: '60,000,000 đ',
      imageUrl: 'https://kingshoes.vn/data/upload/media/air-jordan-1-hi-trophy-room-chicago-da2728-100-king-shoes-sneaker-real-hcm-1624273272.jpeg',
    ),
    Product(
      name: 'NIKE BLAZER LOW JUMBO',
      description: '3,900,000 đ',
      imageUrl: 'https://kingshoes.vn/data/upload/media/gia%CC%80y-nike-blazer-low-jumbo-white-orange-dn2158-100-chi%CC%81nh-ha%CC%83ng-de%CC%82%CC%81n-king-shoes-12-1648102105.jpeg',
    ),
    Product(
      name: 'AIR MORE UPTEMPO WHEAT',
      description: '3,900,000 đ',
      imageUrl: 'https://kingshoes.vn/data/upload/media/dq4713-700-gia%CC%80y-nike-air-more-uptempo-wheat-gia%CC%80y-chi%CC%81nh-ha%CC%83ng-de%CC%82%CC%81n-king-shoes-12-1659879797.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: products[index]),
                ),
              );
            },
            child: ListTile(
              leading: Image.network(products[index].imageUrl),
              title: Text(products[index].name),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            product.imageUrl,
            height: 300,
            width: 300,
          ),
          SizedBox(height: 16),
          Text(
            product.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(product.description),
        ],
      ),

    );
  }
}
