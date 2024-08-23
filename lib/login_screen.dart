import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // حقل لإدخال البريد الإلكتروني
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),

            // حقل لإدخال كلمة المرور
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // زر تسجيل الدخول
            ElevatedButton(
              onPressed: () {
                // التحقق من صحة بيانات تسجيل الدخول
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  // إذا كانت البيانات صحيحة، انتقل إلى الصفحة الرئيسية
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  // إذا كانت البيانات غير صحيحة، أظهر رسالة خطأ
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter valid details')),
                  );
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),

            // زر للانتقال إلى صفحة التسجيل إذا لم يكن لدى المستخدم حساب
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
