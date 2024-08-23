import 'package:flutter/material.dart';
import 'product_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Pizza',
      'options': ['Margherita', 'Pepperoni', 'Veggie'],
      'image': 'assets/photo_2024-08-18_21-31-21.jpg', // مسار الصورة
    },
    {
      'name': 'Pasta',
      'options': ['Carbonara', 'Alfredo', 'Pesto'],
      'image': 'assets/photo_pasta.jpg', // مسار الصورة
    },
    {
      'name': 'Sandwiches',
      'options': ['Chicken', 'Beef', 'Vegetarian'],
      'image': 'assets/photo_snn.jpg', // مسار الصورة
    },
    {
      'name': 'Crepes',
      'options': ['Nutella', 'Banana', 'Strawberry'],
      'image': 'assets/photo_crep.jpg', // مسار الصورة
    },
    {
      'name': 'Juices',
      'options': ['Orange', 'Apple', 'Grapes'],
      'image': 'assets/photo_jus.jpg', // مسار الصورة
    },
    {
      'name': 'Fries',
      'options': ['Regular', 'Cheese', 'Curly'],
      'image': 'assets/photo_patata.jpg', // مسار الصورة
    }
  ];

  ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        String productName = products[index]['name'];
        String productImage = products[index]['image'];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(
                  productName: productName,
                  options: products[index]['options'],
                ),
              ),
            );
          },
          child: Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  productImage,
                  height: 80,
                  width: 80,
                ),
                const SizedBox(height: 10),
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
