import 'package:flutter/material.dart';
import 'package:the_app/utils/colours.dart';
import 'package:the_app/view/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    });
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
                Icon(Icons.waving_hand, size: 80, color: AppColor.welcomeIcon),
                SizedBox(height: 30),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Welcome ",
                    style: const TextStyle(
                      color: AppColor.welcomeText_1,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: "WelcomeText",
                    ),
                    children: [
                      TextSpan(
                        text: "Page",
                        style: TextStyle(
                          color: AppColor.welcomeText_2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Let's get started!",
                  style: TextStyle(color: AppColor.welcomeText_3, fontSize: 18),
                ),
                SizedBox(height: 50),
                CircularProgressIndicator(
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
