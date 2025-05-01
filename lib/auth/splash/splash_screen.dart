import  'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/core/utils/assets_magaer.dart';
import 'package:mostafa/core/utils/routes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
      },
    );
    return Scaffold(
       backgroundColor: const Color(0xFF0C0077),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 9),
          SizedBox(
            height: 300.r,
            width: double.infinity.r,
            child: Image.asset(AssetsManager.logoSplash,),
          ),
          const Spacer(flex: 9),
          SizedBox(
              height: 20.r,
              width: double.infinity.r,
            child: Image.asset(
              AssetsManager.logoText,
            ),
          ),
          const Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
