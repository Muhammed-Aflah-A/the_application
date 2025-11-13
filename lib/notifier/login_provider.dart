import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final gmailFocus = FocusNode();
  final passwordFocus = FocusNode();
  String? gmail;
  String? password;
  bool obscurePassword = true;
  void passVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  @override
  void dispose() {
    gmailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }
}
