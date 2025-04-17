import 'package:flutter/material.dart';
import 'package:mostafa/core/utils/routes_manager.dart';

class EButton extends StatelessWidget {
  String shaildButton;
  String routeNme;

  EButton({required this.shaildButton, required this.routeNme});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(200, 60),
          maximumSize: Size(300, 80),
          backgroundColor: Color(0xFF0024FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // تعديل الـ border radius
          ),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, routeNme);
        },
        child: Text(
          shaildButton,
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }
}
