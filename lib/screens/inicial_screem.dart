import 'package:flutter/material.dart';
import 'package:tarefas/data/task_inherited.dart';
import 'form.dart';

class InicialScream extends StatefulWidget {
  const InicialScream({super.key});

  @override
  State<InicialScream> createState() => _InicialScreamState();
}

class _InicialScreamState extends State<InicialScream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Tarefas',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          children: TaskInherited.of(context)!.lista,
        ),
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contextNew) => FormScreem(
                    taskContext: context,
                  ),
                ));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
