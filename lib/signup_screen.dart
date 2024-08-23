import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // حقل لإدخال الاسم
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),

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

            // حقل لتأكيد كلمة المرور
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            // زر لإنشاء حساب جديد
            ElevatedButton(
              onPressed: () {
                // التحقق من صحة البيانات
                if (_passwordController.text ==
                        _confirmPasswordController.text &&
                    _emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty &&
                    _nameController.text.isNotEmpty) {
                  // الانتقال إلى صفحة تسجيل الدخول بعد التسجيل
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                } else {
                  // رسالة تحذيرية عند وجود خطأ في الإدخال
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter valid details')),
                  );
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
