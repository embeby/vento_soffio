import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';

class TaskProgressExample extends StatefulWidget {
  const TaskProgressExample({super.key});

  @override
  TaskProgressExampleState createState() => TaskProgressExampleState();
}

class TaskProgressExampleState extends State<TaskProgressExample> {
  double progress = 0.0; // من 0.0 إلى 1.0

  void completeTask() {
    setState(() {
      if (progress < 1.0) {
        progress += 0.2; // كل ضغطة تزود 20%
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: progress,
              minHeight: 20,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
            ),
            const SizedBox(height: 15),
            Text(
              "${(progress * 100).toInt()}${AppLocalizations.of(context)!.mission}",
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            // ElevatedButton(
            //   onPressed: completeTask,
            //   child: const Text("أتمم مهمة"),
            // ),
          ],
        ),
      ),
    );
  }
}
