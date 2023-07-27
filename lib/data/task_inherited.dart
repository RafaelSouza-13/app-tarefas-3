import 'package:flutter/material.dart';
import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final List<Task> lista = [
    Task(
      task: 'Aprendendo flutter',
      photo: 'assets/images/flutter.png',
      hardShip: 4,
    ),
    Task(
      task: 'Aprender a desenhar',
      photo: 'assets/images/desenhar.jpg',
      hardShip: 3,
    ),
    Task(
      task: 'Aprender django',
      photo: 'assets/images/dj.png',
      hardShip: 4,
    ),
    Task(
      task: 'Aprender a cozinhar',
      photo: 'assets/images/cozinhar.jpg',
      hardShip: 3,
    ),
    Task(
      task: 'Aprender a fazer drinks',
      photo: 'assets/images/drink.jpg',
      hardShip: 2,
    ),
    Task(
      task: 'ler mais',
      photo: 'assets/images/livro.jpeg',
      hardShip: 3,
    ),
    Task(
      task: 'Jogar video game',
      photo: 'assets/images/controle.jpg',
      hardShip: 1,
    ),
  ];

  void newTask(String name, String photo, int difficulty) {
    lista.add(Task(task: name, photo: photo, hardShip: difficulty));
  }

  @override
  final Widget child;

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.lista.length != lista.length;
  }
}
