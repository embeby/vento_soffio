import 'package:flutter/material.dart';
import 'package:mostafa/presentation/LoginScreen/Widgets/textFildWedgiet.dart';

class ModifyDataButtonSheet extends StatelessWidget {
   ModifyDataButtonSheet({super.key});
  TextEditingController nameUController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextFormField(
              controller: nameUController,
              obscureText: true,
              validator: (input) {
                if(input==null){
                  return 'pleas enter your Name';
                }
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(hintText: 'enter your name'),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              controller: phoneController,
              obscureText: true,
              decoration: InputDecoration(

                  hintText: 'enter your Phone'),
            ),
          ),
          const SizedBox(
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
