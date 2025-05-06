import 'package:flutter/material.dart';

typedef AuthFunction = void Function();

class EButton extends StatelessWidget {
  final String childButton;
  final String routeNme;
  final AuthFunction onClick;

  const EButton(
      {super.key,
      required this.childButton,
      required this.onClick,
      required this.routeNme});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 60),
          maximumSize: const Size(300, 80),
          backgroundColor: const Color(0xFF0024FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // تعديل الـ border radius
          ),
        ),
        onPressed: onClick,
        child: Text(
          childButton,
          style: const TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}
