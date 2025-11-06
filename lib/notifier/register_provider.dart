import 'package:flutter/material.dart';
import 'package:the_app/model/hive_user.dart';
import 'package:the_app/service/service_confiq.dart';
import 'package:the_app/service/secure_storage_service.dart';

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
  final ServiceLayer serviceLayer;
  final SecureStorageService secureStorage;
  RegisterProvider({required this.serviceLayer, required this.secureStorage});
  void passVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> addUser(HiveUser user, String password) async {
    await serviceLayer.addUser(user);
    await secureStorage.addPass(user.gmail!, password);
  }

  @override
  void dispose() {
    gmailFocus.dispose();
    passwordController.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }
}
