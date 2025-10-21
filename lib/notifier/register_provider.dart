import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final gmailFocus = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();
  String? fullName;
  String? gmail;
  String? password;
  String? confirmPassword;
  bool obscurePassword = true;
  void passVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }
}
