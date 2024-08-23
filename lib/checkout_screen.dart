import 'package:flutter/material.dart';
import 'package:flutter_application_k/cart_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Total: \$${CartScreen.cartItems.fold(0, (sum, item) => sum + (item['price'] as int))}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Enter your address',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                CartScreen.cartItems.clear();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Order placed successfully!'),
                ));
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
