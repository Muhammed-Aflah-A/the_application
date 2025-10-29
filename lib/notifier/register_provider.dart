import 'package:flutter/material.dart';
import 'package:the_app/model/hive_user.dart';
import 'package:the_app/service/hive_service.dart';
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
  final HiveService hiveService;
  final SecureStorageService secureStorage;
  RegisterProvider({required this.hiveService, required this.secureStorage});
  void passVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> addUser(HiveUser user,String password) async {
    await hiveService.addUser(user);
    await secureStorage.addPass(user.gmail!, password);
  }
}
