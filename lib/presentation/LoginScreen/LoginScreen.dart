import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/core/utils/routes_manager.dart';
import 'package:mostafa/presentation/LoginScreen/Widgets/textFildWedgiet.dart';
import '../../core/utils/assets_magaer.dart';
import 'Widgets/Button.dart';

class loginScreen extends StatelessWidget {
  loginScreen({super.key});

  TextEditingController PasswordCobntroller = TextEditingController();
  TextEditingController userNameCobntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      body: SingleChildScrollView(
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
              HaedField: 'Email',
              Hinte: 'enter your email',
              controller: userNameCobntroller,
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return 'Pleas enter full Name';
                }

              },
            ),
            TextFWidget(
              HaedField: 'password',
              Hinte: 'enter your password',
              IsScure: true,
              controller: PasswordCobntroller,

            ),
            const SizedBox(
              height: 50,
            ),
            EButton(shaildButton: 'sign in', routeNme: RoutesManager.homeRoute),
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
                        style: TextStyle(fontSize: 16,color: Colors.blueAccent)))
              ],
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
