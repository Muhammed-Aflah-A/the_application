import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        decoration: BoxDecoration(
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
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "SIGN UP",
                          style: TextStyle(
                            fontFamily: "LoginText2",
                            fontSize: 50,
                            color: AppColor.loginText,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            hintStyle: TextStyle(color: AppColor.textFeildHint),
                            floatingLabelStyle: TextStyle(
                              color: AppColor.textFeildFloatingLabel,
                              fontWeight: FontWeight.bold,
                            ),
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
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: AppColor.textFeildBorder,
                            //     width: 2,
                            //   ),
                            // ),
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
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Gmail",
                            hintStyle: TextStyle(color: AppColor.textFeildHint),
                            floatingLabelStyle: TextStyle(
                              color: AppColor.textFeildFloatingLabel,
                              fontWeight: FontWeight.bold,
                            ),
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
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: AppColor.textFeildBorder,
                            //     width: 2,
                            //   ),
                            // ),
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
                            ).requestFocus(registerForm.phoneNumberFocus);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Phone number",
                            hintStyle: TextStyle(color: AppColor.textFeildHint),
                            floatingLabelStyle: TextStyle(
                              color: AppColor.textFeildFloatingLabel,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: AppColor.phoneIcon,
                            ),
                            filled: true,
                            fillColor: AppColor.textFeildColor,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColor.textFeildBorder,
                                width: 2,
                              ),
                            ),
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: AppColor.textFeildBorder,
                            //     width: 2,
                            //   ),
                            // ),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            value = value?.replaceAll(" ", "").trim();
                            if (value == null || value.isEmpty) {
                              return "Please enter a phone number";
                            }
                            if (!RegExp(r'^[0-9]{10,}$').hasMatch(value)) {
                              return "Ph no: at least 10 number long (digits only)";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            registerForm.phoneNumber = newValue;
                          },
                          focusNode: registerForm.phoneNumberFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (value) {
                            FocusScope.of(
                              context,
                            ).requestFocus(registerForm.passwordFocus);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: AppColor.textFeildHint),
                            floatingLabelStyle: TextStyle(
                              color: AppColor.textFeildFloatingLabel,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColor.lockIcon,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                registerForm.obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColor.visibilityButton,
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
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: AppColor.textFeildBorder,
                            //     width: 2,
                            //   ),
                            // ),
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
                        SizedBox(height: 20),
                        TextFormField(
                          controller: registerForm.passwordController,
                          decoration: InputDecoration(
                            hintText: "Confirm password",
                            hintStyle: TextStyle(color: AppColor.textFeildHint),
                            floatingLabelStyle: TextStyle(
                              color: AppColor.textFeildFloatingLabel,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColor.lockIcon,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                registerForm.obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColor.visibilityButton,
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
                            // focusedBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(
                            //     color: AppColor.textFeildBorder,
                            //     width: 2,
                            //   ),
                            // ),
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
                          onPressed: () {
                            if (registerForm.formKey.currentState!.validate()) {
                              registerForm.formKey.currentState!.save();
                              registerForm.passwordController.clear();
                              registerForm.formKey.currentState!.reset();

                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                "home_screen",
                                (route) => false,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Account Registered Successfull",
                                    style: TextStyle(
                                      color: AppColor.normalText,
                                    ),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.black, width: 3),
                            minimumSize: Size(300, 50),
                          ),
                          child: Text("Register"),
                        ),
                        SizedBox(height: 5),
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
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            side: BorderSide(color: Colors.black, width: 3),
                            minimumSize: Size(300, 50),
                          ),
                          child: Text("Go back"),
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
