import 'package:flutter/material.dart';
import 'package:the_app/utils/colours.dart';
import 'package:the_app/view/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  static const _splashDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  Future<void> _navigateToLogin() async {
    await Future.delayed(_splashDuration);
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColor.gradientColor_1, AppColor.gradientColor_2],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.waving_hand,
                  size: 80,
                  color: AppColor.welcomeIcon,
                ),
                const SizedBox(height: 30),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Welcome ",
                    style: TextStyle(
                      color: AppColor.welcomeText,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: "WelcomeText",
                    ),
                    children: [
                      TextSpan(
                        text: "Page",
                        style: TextStyle(
                          color: AppColor.welcomeText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Let's get started!",
                  style: TextStyle(
                    color: AppColor.welcomeTextCaption,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 50),
                const CircularProgressIndicator(
                  color: AppColor.progressIndicator,
                  strokeWidth: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
