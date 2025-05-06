import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/auth/Widgets/button.dart';
import 'package:mostafa/auth/Widgets/constants.dart';
import 'package:mostafa/auth/Widgets/custom_loading.dart';
import 'package:mostafa/auth/Widgets/firebase_auth_code.dart';
import 'package:mostafa/auth/Widgets/text_field_widget.dart';
import 'package:mostafa/core/utils/routes_manager.dart';

import '../../core/utils/assets_manager.dart';
import '../../presentation/home/tabs/SettingsTab/model.dart';
import '../../presentation/home/tabs/SettingsTab/repo.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => SignScreenState();
}

class SignScreenState extends State<SignScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
                headField: 'Full name',
                controller: fullNameController,
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
                keyboard: TextInputType.text,
                headField: 'User name',
                controller: userNameController,
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
                headField: 'E-mail ',
                controller: emailController,
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
              TextFWidget(
                keyboard: TextInputType.phone,
                headField: 'Phone Number',
                controller: phoneController,
                validator: (input) {
                  if (input == null || input.trim().isEmpty) {
                    return 'Pleas enter Phone Number';
                  }
                  if (input.length == 10) {
                    return 'Phone Number must be 11 characters';
                  }
                  return null;
                },
              ),
              TextFWidget(
                  keyboard: TextInputType.visiblePassword,
                  headField: 'Password',
                  isPassword: true,
                  controller: passwordController,
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
                headField: 'Confirm',
                isPassword: true,
                controller: rePasswordController,
                validator: (input) {
                  if (input != passwordController.text) {
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
              // const Text('or signup with',
              //     style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 22,
              //         fontWeight: FontWeight.bold),
              //     textAlign: TextAlign.center),
              // const SizedBox(
              //   height: 20,
              // ),
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
        showDialog(
            context: context, builder: (context) => const CustomLoading());

        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text);

        if (userCredential.user != null) {
          UserEntity newUser = UserEntity(
            id: userCredential.user!.uid,
            username: userNameController.text.trim(),
            phoneNumber: phoneController.text.trim(),
            fullName: fullNameController.text.trim(),
            email: userCredential.user!.email ?? "",
            role: 'user',
          );

          await UserRepository(
            firestore: FirebaseFirestore.instance,
            auth: FirebaseAuth.instance,
          ).saveUser(newUser);
        }

        if (mounted) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesManager.homeRoute,
            (route) => false,
          );
        }
      } on FirebaseAuthException catch (e) {
        if (mounted) {
          Navigator.pop(context);
        }
        if (e.code == FirebaseAuthCode.weakPassword) {
          print('كلمة المرور ضعيفة جدًا.');
        } else if (e.code == FirebaseAuthCode.emailAlreadyInUse) {
          print('هذا البريد الإلكتروني مستخدم بالفعل.');
        }
      } catch (error) {
        print("خطأ أثناء إنشاء الحساب: $error");
      }
    }
  }
}
