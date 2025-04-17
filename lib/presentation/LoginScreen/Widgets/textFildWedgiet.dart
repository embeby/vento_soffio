import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Validator = String? Function(String?);

class TextFWidget extends StatelessWidget {
  TextFWidget(
      {required this.HaedField,
      required this.Hinte,
      this.validator,
      this.controller,
      this.IsScure = false });

  String HaedField;
  String Hinte;
  Validator? validator;
  TextEditingController? controller;
  bool IsScure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50.h,
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: IsScure,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          decoration: InputDecoration(
            labelText: HaedField,
            labelStyle: TextStyle(color: Colors.white24),
            hintText: Hinte,
            hintStyle: TextStyle(color: Colors.white24),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white60, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
