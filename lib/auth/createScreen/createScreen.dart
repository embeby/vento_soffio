import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/auth/Widgets/Button.dart';
import 'package:mostafa/auth/Widgets/FirebaseAuthCode.dart';
import 'package:mostafa/auth/Widgets/constants.dart';
import 'package:mostafa/auth/Widgets/textFildWedgiet.dart';
import 'package:mostafa/core/utils/routes_manager.dart';
import '../../core/utils/assets_magaer.dart';

class createScreen extends StatefulWidget {
  createScreen({super.key});

  @override
  State<createScreen> createState() => createScreenState();
}

class createScreenState extends State<createScreen> {
  TextEditingController FullNameController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  TextEditingController PhoneController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191919),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                AssetsManager.logoSoled,
                height: 130,
                width: 300,
              ),
              Text('   Create your account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.h,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20.h,
              ),
              TextFWidget(
                keyboard: TextInputType.name,
                HaedField: 'Full name',
                controller: FullNameController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Pleas enter full Name';
                  }
                  if (input.length < 8) {
                    return 'Full name must be more than 10 characters';
                  }
                  return null;
                },
              ),
              TextFWidget(
                keyboard: TextInputType.emailAddress,
                HaedField: 'E-mail ',
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
              // TextFWidget(
              //   keyboard: TextInputType.phone,
              //   HaedField: 'Phone Number',
              //   controller: PhoneController,
              //   validator: (input) {
              //     if (input == null || input.trim().isEmpty) {
              //       return 'Pleas enter your Phone';
              //     }
              //     if (input.length < 11) {
              //       return "Pleas enter your Phone ";
              //     }
              //     return null;
              //   },
              // ),
              TextFWidget(
                  keyboard: TextInputType.visiblePassword,
                  HaedField: 'Password',
                  IsPasswerd: true,
                  controller: PasswordController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Pleas enter password';
                    }
                    if (input.length < 8) {
                      return 'password must be more than 8  ';
                    }
                    return null;
                  }),
              TextFWidget(
                keyboard: TextInputType.visiblePassword,
                HaedField: 'Confirm',
                IsPasswerd: true,
                controller: rePasswordController,
                validator: (input) {
                  if (input != PasswordController.text) {
                    return 'Should be same as password';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              EButton(
                childButton: 'Create account',
                routeNme: RoutesManager.homeRoute,
                onClick: () {
                  createAccount();
                },
              ),
              const SizedBox(
                height: 20,
              ),
               const Text('or signup with',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesManager.loginRoute);
                      },
                      child: const Text('sign in',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueAccent),
                          textAlign: TextAlign.center))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  createAccount() async {
    if (formKey.currentState?.validate() == true) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: userNameController.text.trim(),
                password: PasswordController.text);
        Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseAuthCode.weakPassword) {
          print('The password provided is too weak.');
        } else if (e.code == FirebaseAuthCode.emailAlreadyInUse) {
          print('The account already exists for that email.');
        }
      } catch (error) {

      }
    }
  }
}
