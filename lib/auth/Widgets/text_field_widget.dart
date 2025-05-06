import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef Validator = String? Function(String?);

class TextFWidget extends StatefulWidget {
  const TextFWidget(
      {super.key,
      required this.headField,
      this.validator,
      this.keyboard,
      this.controller,
      this.isPassword = false});

  final String headField;

  final TextInputType? keyboard;
  final Validator? validator;
  final TextEditingController? controller;
  final bool isPassword;

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
          obscureText: widget.isPassword == true ? isObscured : false,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                    icon: isObscured
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  )
                : null,
            labelText: widget.headField,
            labelStyle: const TextStyle(color: Colors.white24),
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
