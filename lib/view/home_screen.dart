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
        backgroundColor: AppColor.homeAppbar,
        foregroundColor: AppColor.homeAppbarText,
        actions: [
          IconButton(
            onPressed: () {
              theme.toggleTheme();
            },
            icon: Icon(theme.isDark ? Icons.brightness_2 : Icons.brightness_6),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppColor.accountHeader),
              accountName: Text("Muhammed Aflah A"),
              accountEmail: Text("aflahathimannil@gmail.com"),
              currentAccountPicture: CircleAvatar(),
            ),
            ListTile(
              leading: Icon(Icons.person, color: AppColor.personIcon),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "profile");
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: AppColor.settingsIcon),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "settings");
              },
            ),
          ],
        ),
      ),
    );
  }
}
