import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_app/notifier/theme_provider.dart';
import 'package:the_app/utils/colours.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomeScreen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.appbarHome,
        foregroundColor: AppColor.appbarHomeText,
        actions: [
          IconButton(
            onPressed: () {
              theme.toggleTheme();
            },
            icon: Icon(theme.isDark ? Icons.brightness_2 : Icons.brightness_6),
          ),
        ],
      ),
    );
  }
}
