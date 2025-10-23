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
        backgroundColor: AppColor.appbar,
        foregroundColor: AppColor.appbarText,
        actions: [],
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
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: Icon(Icons.person, color: AppColor.personIcon2),
              onTap: () {
                Navigator.pushNamed(context, "profile");
              },
            ),
            ListTile(
              title: Text(
                "Theme",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: Icon(
                theme.isDark ? Icons.brightness_2 : Icons.brightness_6,
                color: AppColor.themeIcon,
              ),
              onTap: () {
                theme.toggleTheme();
              },
            ),
            ListTile(
              title: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: Icon(Icons.settings, color: AppColor.settingsIcon),
              onTap: () {
                Navigator.pushNamed(context, "settings");
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Card(
              elevation: 2,
              color: AppColor.cardColor,
              child: ListTile(
                leading: Icon(Icons.pages, color: AppColor.pageIcon),
                title: Text(
                  "Flutter Fundementals",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.normalText,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "flutter_fundementals");
                },
                trailing: Icon(Icons.more_horiz, color: AppColor.moreIconHoriz),
              ),
            ),
            Card(
              elevation: 2,
              color: AppColor.cardColor,
              child: ListTile(
                leading: Icon(Icons.pages, color: AppColor.pageIcon),
                title: Text(
                  "Flutter navigation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.normalText,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "flutter_navigation");
                },
                trailing: Icon(Icons.more_horiz, color: AppColor.moreIconHoriz),
              ),
            ),
            Card(
              elevation: 2,
              color: AppColor.cardColor,
              child: ListTile(
                leading: Icon(Icons.pages, color: AppColor.pageIcon),
                title: Text(
                  "Form validation",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.normalText,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "form_validation");
                },
                trailing: Icon(Icons.more_horiz, color: AppColor.moreIconHoriz),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
