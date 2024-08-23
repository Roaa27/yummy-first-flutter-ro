import 'package:flutter/material.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final List<String> options;

  const ProductDetailScreen(
      {super.key, required this.productName, required this.options});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$productName Options'),
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(options[index]),
            trailing: const Icon(Icons.add_shopping_cart),
            onTap: () {
              CartScreen.cartItems.add({
                'name': '$productName - ${options[index]}',
                'price': 10,
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${options[index]} added to cart')),
              );
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
