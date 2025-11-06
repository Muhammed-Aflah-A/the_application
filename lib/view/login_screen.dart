import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_app/notifier/login_provider.dart';
import 'package:the_app/utils/colours.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginForm = context.watch<LoginProvider>();
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
                  key: loginForm.formKey,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "SIGN IN",
                          style: TextStyle(
                            fontFamily: "LoginText2",
                            fontSize: 50,
                            color: AppColor.signInText,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          style: TextStyle(color: AppColor.textFeildForeground),
                          decoration: const InputDecoration(
                            hintText: "Email",
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
                            loginForm.gmail = newValue;
                          },
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(
                              context,
                            ).requestFocus(loginForm.passwordFocus);
                          },
                        ),
                        const SizedBox(height: 20),
                        Consumer<LoginProvider>(
                          builder: (context, value, child) => TextFormField(
                            style: TextStyle(
                              color: AppColor.textFeildForeground,
                            ),
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: AppColor.textFeildHint,
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: AppColor.lockIcon,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  loginForm.obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColor.visibilityIcon,
                                ),
                                onPressed: () {
                                  loginForm.passVisibility();
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
                            obscureText: loginForm.obscurePassword,
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
                              loginForm.password = newValue;
                            },
                            focusNode: loginForm.passwordFocus,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            Future.delayed(const Duration(seconds: 1), () {
                              if (loginForm.formKey.currentState!.validate()) {
                                loginForm.formKey.currentState!.save();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Login Successfull",
                                      style: TextStyle(
                                        color: AppColor.normalText,
                                      ),
                                    ),
                                    backgroundColor: Colors.green,
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                                Future.delayed(
                                  const Duration(milliseconds: 300),
                                  () {
                                    loginForm.formKey.currentState!.reset();
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      "/home_screen",
                                      (route) => false,
                                    );
                                  },
                                );
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColor.buttonForeground,
                            backgroundColor: AppColor.buttonBg,
                            side: const BorderSide(
                              color: AppColor.buttonBorder,
                              width: 3,
                            ),
                            minimumSize: const Size(300, 50),
                          ),
                          child: const Text("SIGN IN"),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont have an account ?",
                              style: TextStyle(
                                color: AppColor.normalText,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "/register_screen",
                                );
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: AppColor.normalText,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColor.underlineColor,
                                  decorationThickness: 2,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
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
