import 'package:flutter/material.dart';
import 'package:task/screen/task-screen/task-screen.dart';

import 'di.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: TaskScreen(),

    );
  }
}

