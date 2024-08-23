import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => _isLastPage = index == 2);
                },
                children: [
                  buildPage(
                    title: 'Welcoming to our app',
                    description: 'Welcome to Yummy! ',
                    imagePath: 'assets/Screenshot_res.png',
                  ),
                  buildPage(
                    title: 'Introducing the restaurant',
                    description:
                        'Yummy is a restaurant offering a wide variety of delicious dishes to suit every taste. Explore our diverse menu, featuring unique flavors and fresh ingredients',
                    imagePath: 'assets/Screenshot_cen.png',
                  ),
                  buildPage(
                    title: 'Wishing a great experience',
                    description:
                        'We hope you have an easy and enjoyable experience using our app. Enjoy browsing our menus and ordering your favorite meal with ease',
                    imagePath: 'assets/Screenshot_so.png',
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.orange,
              ),
            ),
            const SizedBox(height: 20),
            _isLastPage
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: const Text('Get Started'),
                  )
                : TextButton(
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text('Next'),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildPage({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 150, // تحديد العرض
          height: 150, // تحديد الارتفاع
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
