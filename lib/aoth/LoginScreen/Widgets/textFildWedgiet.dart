import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Validator = String? Function(String?);

class TextFWidget extends StatefulWidget {
  TextFWidget(
      {super.key,
      required this.HaedField,
      required this.Hinte,
      this.validator,
      required this.keyboard,
      this.controller,
      this.IsPasswerd = false});

  String HaedField;
  String Hinte;
  TextInputType keyboard;
  Validator? validator;
  TextEditingController? controller;
  bool IsPasswerd;

  @override
  State<TextFWidget> createState() => _TextFWidgetState();
}

class _TextFWidgetState extends State<TextFWidget> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50.h,
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          keyboardType: widget.keyboard,
          obscureText: widget.IsPasswerd == true ? isObscured : false,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          decoration: InputDecoration(
            suffixIcon: widget.IsPasswerd
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    icon: isObscured
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility_outlined),
                  )
                : null,
            labelText: widget.HaedField,
            labelStyle: const TextStyle(color: Colors.white24),
            hintText: widget.Hinte,
            hintStyle: const TextStyle(color: Colors.white24),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.blue, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white60, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
