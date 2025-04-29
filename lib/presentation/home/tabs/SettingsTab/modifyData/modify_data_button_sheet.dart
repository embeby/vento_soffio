import 'package:flutter/material.dart';


class ModifyDataButtonSheet extends StatelessWidget {
  ModifyDataButtonSheet({super.key});

  TextEditingController nameUController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.transparent),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
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
              validator: (input) {
                if (input == null) {
                  return 'pleas enter your Name';
                }
              },
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(hintText: 'enter your name'),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: phoneController,
              decoration: const InputDecoration(hintText: 'enter your Phone'),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Save changes'))
        ],
      ),
    );
  }

  static void show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: ModifyDataButtonSheet(),
      ),
    );
  }
}
