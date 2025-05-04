import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customLoading extends StatelessWidget {
  const customLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 70.h,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
