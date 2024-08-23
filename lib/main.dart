import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'cart_screen.dart';
import 'package:flutter_application_k/checkout_screen.dart';
import 'package:flutter_application_k/product_screen.dart';
// ignore: unused_import
import 'package:flutter_application_k/product_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) =>
            const ProfileScreen(name: 'roaa', email: 'roaaahmed@gmail.com'),
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
        '/product': (context) => ProductScreen(),
      },
    );
  }
}
