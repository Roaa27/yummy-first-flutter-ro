import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static List<Map<String, dynamic>> cartItems = [];

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int totalPrice =
        cartItems.fold(0, (sum, item) => sum + (item['price'] as int));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // leading: Image.asset(cartItems[index]['image']), // تم إزالة هذا السطر لتجنب الخطأ
                        title: Text(cartItems[index]['name']),
                        subtitle: Text('\$${cartItems[index]['price']}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cartItems.removeAt(index);
                            // ignore: invalid_use_of_protected_member
                            (context as Element).reassemble();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total: \$$totalPrice',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkout');
                    },
                    child: const Text('Checkout'),
                  ),
                ),
              ],
            ),
    );
  }
}
