import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/core/utils/routes_manager.dart';

import '../../core/utils/assets_magaer.dart';
import '../LoginScreen/Widgets/Button.dart';
import '../LoginScreen/Widgets/textFildWedgiet.dart';

class createScreen extends StatelessWidget {
  createScreen({super.key});

  TextEditingController FullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

// TextEditingController FullNameCobntroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
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
              Hinte: 'Enter your name',

              HaedField: 'Full name',
              controller: FullNameController,
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return 'Pleas enter full Name';
                }
                if (input.length < 8) {
                  return 'Full name must be more than 10 characters';
                }
              },
            ),
            TextFWidget(
                Hinte: 'Enter your email',
                HaedField: 'E-mail ',
                controller: userNameController,

            validator:(input){
              if(input==null|| input.trim().isEmpty){
                return 'Pleas enter user Name';
              }
            },
            ),
            TextFWidget(
                Hinte: 'Enter your Password',
                HaedField: 'Password',
                IsScure: true,
                controller: PasswordController,

              validator: (input) {
                  if(input==null||input.trim().isEmpty){
                    return'Pleas enter password';
                  }
                if (input.length < 8) {
                return 'password must be more than 10  ';
                }
              }
            ),
            TextFWidget(
                HaedField: 'Confirm',
                Hinte: 'Confirm Password',
                IsScure: true,
                controller: rePasswordController,
                validator: (input) {
                  if(input==null||input.trim().isEmpty){
                    return'Pleas enter rePassword';
                  }
                  if (input.length < 8) {
                    return 'password must be more than 10  ';
                  }
                },


            ),
            SizedBox(
              height: 40,
            ),
            EButton(
                shaildButton: 'Create account',
                routeNme: RoutesManager.homeRoute),
            SizedBox(
              height: 20,
            ),
            Text('or signep with',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                height: 60,
                child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(AssetsManager.iconGoogle)),
              ),
              Container(
                height: 60,
                child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(AssetsManager.iconFacebook)),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',
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
                    child: Text('sign in',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400 ,color: Colors.blueAccent),
                        textAlign: TextAlign.center))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
