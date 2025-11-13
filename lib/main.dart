import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:the_app/db/hive_db.dart';
import 'package:the_app/model/hive_user.dart';
import 'package:the_app/notifier/permission_provider.dart';
import 'package:the_app/notifier/login_provider.dart';
import 'package:the_app/notifier/register_provider.dart';
import 'package:the_app/notifier/theme_provider.dart';
import 'package:the_app/storage/secure_storage.dart';
import 'package:the_app/view/android_fundementals.dart';
import 'package:the_app/view/flutter_fundementals.dart';
import 'package:the_app/view/flutter_navigation.dart';
import 'package:the_app/view/flutter_navigation_2.dart';
import 'package:the_app/view/form_validation.dart';
import 'package:the_app/view/home_screen.dart';
import 'package:the_app/view/login_screen.dart';
import 'package:the_app/view/profile.dart';
import 'package:the_app/view/register_screen.dart';
import 'package:the_app/view/settings.dart';
import 'package:the_app/view/splash_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveUserAdapter());
  await HiveDb.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(
            serviceLayer: HiveDb(),
            secureStorage: SecureStorage(),
          ),
        ),
        ChangeNotifierProvider(create: (_) => PermissionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.isDark ? ThemeData.dark() : ThemeData.light(),
      title: "Studying Application",
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomeScreen(),
        "/login_screen": (context) => const LoginScreen(),
        "/register_screen": (context) => const RegisterScreen(),
        "/home_screen": (context) => const HomeScreen(),
        "/profile": (context) => const Profile(),
        "/settings": (context) => const Settings(),
        "/flutter_fundementals": (context) => const Page1(),
        "/flutter_navigation": (context) => const Page2(),
        "/flutter_navigation_2": (context) => const DataReciever(),
        "/form_validation": (context) => const Page3(),
        "/android_fundementals": (context) => const Page4(),
      },
    );
  }
}
