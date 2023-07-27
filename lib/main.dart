import 'package:flutter/material.dart';
import 'package:tarefas/screens/inicial_screem.dart';
import 'data/task_inherited.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: TaskInherited(child: const InicialScream()),
    );
  }
}
