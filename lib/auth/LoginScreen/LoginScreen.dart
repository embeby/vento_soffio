import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/auth/Widgets/Button.dart';
import 'package:mostafa/auth/Widgets/FirebaseAuthCode.dart';
import 'package:mostafa/auth/Widgets/constants.dart';
import 'package:mostafa/auth/Widgets/textFildWedgiet.dart';

import 'package:mostafa/core/utils/routes_manager.dart';
import '../../core/utils/assets_magaer.dart';

class loginScreen extends StatefulWidget {
  loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 80,
              ),
              Container(
                child: Image.asset(
                  AssetsManager.logoSoled,
                  height: 100.h,
                  width: 200.w,
                ),
              ),
              Text('Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start),
              SizedBox(
                height: 30.h,
              ),
              TextFWidget(
                keyboard: TextInputType.emailAddress,
                HaedField: 'Email',
                controller: userNameController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Pleas enter user email';
                  }
                  if (!isValidEmail(input)) {
                    return "invaled";
                  }
                  return null;
                },
              ),
              TextFWidget(
                  keyboard: TextInputType.visiblePassword,
                  HaedField: 'password',
                  IsPasswerd: true,
                  controller: PasswordController,
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
                height: 50,
              ),
              EButton(
                childButton: 'sign in',
                routeNme: RoutesManager.homeRoute,
                onClick: () {
                  Login();
                },
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'or sign in with',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 100),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  height: 60,
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(AssetsManager.iconGoogle)),
                ),
                SizedBox(
                  height: 60,
                  child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(AssetsManager.iconFacebook)),
                ),
              ]),
              const SizedBox(height: 50),
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

  Login() async {
    if (formKey.currentState?.validate() == true) {
      try{
        UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: userNameController.text.trim(),
          password: PasswordController.text);
        Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
        print(credential.user?.email);
        print(credential.user?.uid);
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseAuthCode.userNotFound) {
          print('No user found for that email.');
        } else if (e.code == FirebaseAuthCode.wrongPassword) {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
