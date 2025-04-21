import 'package:flutter/material.dart';

class TaskProgressExample extends StatefulWidget {
  @override
  _TaskProgressExampleState createState() => _TaskProgressExampleState();
}

class _TaskProgressExampleState extends State<TaskProgressExample> {
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
        padding:  EdgeInsets.symmetric(horizontal: 20,),
        child: Column(

          children: [
            LinearProgressIndicator(
              value: progress,
              minHeight: 20,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
            ),
            SizedBox(height: 15),
            Text(
              "${(progress * 100).toInt()}% تم إنجازه!",
              style: TextStyle(fontSize: 22,color: Colors.white),
            ),
            ElevatedButton(
              onPressed: completeTask,
              child: Text("أتمم مهمة"),
            ),
          ],
        ),
      ),
    );
  }
}
