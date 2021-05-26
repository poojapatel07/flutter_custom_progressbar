import 'package:flutter/material.dart';
import 'package:flutter_custom_progressbar/ProgressController.dart';
import 'package:flutter_custom_progressbar/RestartableCircularProgressIndicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ProgressController controller;

  @override
  void initState() {
    super.initState();
    controller = ProgressController(
      duration: Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RestartableCircularProgressIndicator(
                controller: controller,
                onTimeout: () => print('timeout'),
              ),
              RaisedButton(
                onPressed: controller.start,
                child: Text('Start'),
              ),
              RaisedButton(
                onPressed: controller.restart,
                child: Text('Restart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}