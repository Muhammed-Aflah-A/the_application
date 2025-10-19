import 'package:flutter/material.dart';

class FormProvider with ChangeNotifier {
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
}
