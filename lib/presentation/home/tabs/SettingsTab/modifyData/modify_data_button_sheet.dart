import 'package:flutter/material.dart';

class ModifyDataButtonSheet extends StatelessWidget {
  const ModifyDataButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.transparent),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text(
            'Edit',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'enter your name'),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextFormField(
              decoration: InputDecoration(hintText: 'enter your Phone'),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Save changes'))
        ],
      ),
    );
  }

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ModifyDataButtonSheet(),
    );
  }
}
