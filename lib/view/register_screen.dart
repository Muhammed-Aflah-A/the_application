import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_app/model/hive_user.dart';
import 'package:the_app/notifier/register_provider.dart';
import 'package:the_app/utils/colours.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final registerForm = context.watch<RegisterProvider>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColor.gradientColor_1, AppColor.gradientColor_2],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Form(
                  key: registerForm.formKey,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontFamily: "LoginText2",
                            fontSize: 50,
                            color: AppColor.signUpText,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          style: TextStyle(color: AppColor.textFeildForeground),
                          decoration: const InputDecoration(
                            hintText: "Full Name",
                            hintStyle: TextStyle(color: AppColor.textFeildHint),
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppColor.personIcon,
                            ),
                            filled: true,
                            fillColor: AppColor.textFeildColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.textFeildBorder,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.textFeildBorder,
                                width: 2,
                              ),
                            ),
                          ),
                          validator: (value) {
                            value = value?.replaceAll("  ", " ").trim();
                            if (value == null || value.isEmpty) {
                              return "Please enter a name";
                            }
                            if (value.length < 3) {
                              return "Name must be at least 3 character long";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            registerForm.fullName = newValue;
                          },
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(
                              context,
                            ).requestFocus(registerForm.gmailFocus);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: AppColor.textFeildForeground),
                          decoration: const InputDecoration(
                            hintText: "Gmail",
                            hintStyle: TextStyle(color: AppColor.textFeildHint),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: AppColor.mailIcon,
                            ),
                            filled: true,
                            fillColor: AppColor.textFeildColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.textFeildBorder,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.textFeildBorder,
                                width: 2,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            value = value?.replaceAll(" ", "").trim();
                            if (value == null || value.isEmpty) {
                              return "Please enter a gmail";
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return "Please enter a valid gmail";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            registerForm.gmail = newValue;
                          },
                          focusNode: registerForm.gmailFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(
                              context,
                            ).requestFocus(registerForm.passwordFocus);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: AppColor.textFeildForeground),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: AppColor.textFeildHint),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColor.lockIcon,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                registerForm.obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColor.visibilityIcon,
                              ),
                              onPressed: () {
                                registerForm.passVisibility();
                              },
                            ),
                            filled: true,
                            fillColor: AppColor.textFeildColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.textFeildBorder,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.textFeildBorder,
                                width: 2,
                              ),
                            ),
                          ),
                          obscureText: registerForm.obscurePassword,
                          validator: (value) {
                            value = value?.replaceAll(" ", "").trim();
                            if (value == null || value.isEmpty) {
                              return "Please enter a password";
                            }
                            if (!RegExp(r'^(?=.*[A-Z]).+$').hasMatch(value)) {
                              return "Include uppercase";
                            }
                            if (!RegExp(
                              r'^(?=.*[@$!%*?&]).+$',
                            ).hasMatch(value)) {
                              return "Include special character";
                            }
                            if (!RegExp(
                              r'^[A-Za-z\d@$!%*?&]{8,}$',
                            ).hasMatch(value)) {
                              return "Password must be at least 8 characters";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            registerForm.password = newValue;
                          },
                          focusNode: registerForm.passwordFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(
                              context,
                            ).requestFocus(registerForm.confirmPasswordFocus);
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: AppColor.textFeildForeground),
                          controller: registerForm.passwordController,
                          decoration: InputDecoration(
                            hintText: "Confirm password",
                            hintStyle: TextStyle(color: AppColor.textFeildHint),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColor.lockIcon,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                registerForm.obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColor.visibilityIcon,
                              ),
                              onPressed: () {
                                registerForm.passVisibility();
                              },
                            ),
                            filled: true,
                            fillColor: AppColor.textFeildColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.textFeildBorder,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.textFeildBorder,
                                width: 2,
                              ),
                            ),
                          ),
                          obscureText: registerForm.obscurePassword,
                          validator: (value) {
                            value = value?.replaceAll(" ", "").trim();
                            if (value == null || value.isEmpty) {
                              return "Please confirm the password";
                            }
                            if (value != registerForm.passwordController.text) {
                              return "Password do not match";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            registerForm.confirmPassword = newValue;
                          },
                          focusNode: registerForm.confirmPasswordFocus,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            Future.delayed(
                              const Duration(milliseconds: 300),
                              () {
                                if (registerForm.formKey.currentState!
                                    .validate()) {
                                  registerForm.formKey.currentState!.save();
                                  final user = HiveUser(
                                    fullName: registerForm.fullName,
                                    gmail: registerForm.gmail,
                                  );
                                  context.read<RegisterProvider>().addUser(
                                    user,
                                    registerForm.confirmPassword!,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Account Registered Successfully",
                                        style: TextStyle(
                                          color: AppColor.normalText,
                                        ),
                                      ),
                                      backgroundColor: Colors.green,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                    ),
                                  );
                                  Future.delayed(
                                    const Duration(milliseconds: 300),
                                    () {
                                      registerForm.passwordController.clear();
                                      registerForm.formKey.currentState!
                                          .reset();
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        "/home_screen",
                                        (route) => false,
                                      );
                                    },
                                  );
                                }
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.buttonForeground,
                            backgroundColor: AppColor.buttonBg,
                            side: const BorderSide(
                              color: AppColor.buttonBorder,
                              width: 3,
                            ),
                            minimumSize: Size(300, 50),
                          ),
                          child: const Text("Register"),
                        ),
                        const SizedBox(height: 5),
                        Divider(
                          thickness: 5,
                          indent: 25,
                          endIndent: 25,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.buttonForeground,
                            backgroundColor: AppColor.buttonBg,
                            side: BorderSide(
                              color: AppColor.buttonBorder,
                              width: 3,
                            ),
                            minimumSize: Size(300, 50),
                          ),
                          child: const Text("Go back"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
