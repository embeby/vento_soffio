import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostafa/core/utils/routes_manager.dart';

import '../../core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0077),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 9),
          SizedBox(
            height: 300.r,
            width: double.infinity.r,
            child: Image.asset(
              AssetsManager.logoSplash,
            ),
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
