import 'package:flutter/material.dart';

class customMessage extends StatelessWidget {
   customMessage({super.key ,required this. message});
   String message;
  @override
  Widget build(BuildContext context) {
    return       AlertDialog(
        content: Text(message),
        actions: [TextButton(onPressed: () {
          Navigator.pop(context);
        }, child: Text('OK'))],
      );

  }
}
