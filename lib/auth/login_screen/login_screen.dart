import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/auth/Widgets/button.dart';
import 'package:mostafa/auth/Widgets/constants.dart';
import 'package:mostafa/auth/Widgets/custom_loading.dart';
import 'package:mostafa/auth/Widgets/custom_massage.dart';
import 'package:mostafa/auth/Widgets/firebase_auth_code.dart';
import 'package:mostafa/auth/Widgets/text_field_widget.dart';
import 'package:mostafa/core/utils/routes_manager.dart';

import '../../core/utils/assets_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191919),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                AssetsManager.logoSoled,
                height: 140.h,
                width: 150.w,
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text('Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start),
              const SizedBox(
                height: 30,
              ),
              TextFWidget(
                keyboard: TextInputType.emailAddress,
                headField: 'Email',
                controller: userNameController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Pleas enter user email';
                  }
                  if (!isValidEmail(input)) {
                    return "invalid";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFWidget(
                  keyboard: TextInputType.visiblePassword,
                  headField: 'password',
                  isPassword: true,
                  controller: passwordController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return "pleas enter your Password";
                    }
                    if (input.length < 8) {
                      return 'password must be more than 8  ';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 100,
              ),
              EButton(
                childButton: 'sign in',
                routeNme: RoutesManager.homeRoute,
                onClick: () {
                  login();
                },
              ),

              // const Text(
              //   'or sign in with',
              //   textAlign: TextAlign.center,
              //   style: TextStyle(color: Colors.white, fontSize: 18),
              // ),
              // const SizedBox(height: 150),
              // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              //   SizedBox(
              //     height: 60,
              //     child: IconButton(
              //         onPressed: () {},
              //         icon: Image.asset(AssetsManager.iconGoogle)),
              //   ),
              //   SizedBox(
              //     height: 60,
              //     child: IconButton(
              //         onPressed: () {},
              //         icon: Image.asset(AssetsManager.iconFacebook)),
              //   ),
              // ]),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dont have a account?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesManager.createRoute);
                      },
                      child: const Text('Create an  account',
                          style: TextStyle(
                              fontSize: 16, color: Colors.blueAccent)))
                ],
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    if (formKey.currentState?.validate() == true) {
      try {
        showDialog(
            context: context, builder: (context) => const CustomLoading());
        UserCredential credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: userNameController.text.trim(),
                password: passwordController.text);
        if (mounted) {
          Navigator.pop(context);
        }
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesManager.homeRoute,
            (route) => false,
          );
        }
        if (kDebugMode) {
          print(credential.user?.email);
        }
        if (kDebugMode) {
          print(credential.user?.uid);
        }
      } on FirebaseAuthException catch (e) {
        if (mounted) {
          Navigator.pop(context);
          if (e.code == FirebaseAuthCode.userNotFound) {
            showDialog(
              context: context,
              builder: (context) => const CustomMessage(
                message: 'No user found for that email.',
              ),
            );
            if (kDebugMode) {
              print('No user found for that email.');
            }
          } else if (e.code == FirebaseAuthCode.wrongPassword) {
            showDialog(
              context: context,
              builder: (context) => const CustomMessage(
                message: 'Wrong password provided for that user.',
              ),
            );
            if (kDebugMode) {
              print('Wrong password provided for that user.');
            }
          }
        }
      }
    }
  }
}
