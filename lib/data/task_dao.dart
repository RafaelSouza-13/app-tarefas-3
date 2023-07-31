import 'package:sqflite/sqflite.dart';
import '../components/task.dart';
import 'database.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_difficulty INT,'
      '$_image TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'nome';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

  save(Task tarefa) async {}

  Future<List<Task>> findAll() async {
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tableName);
    print('Resultado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaTarefas) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> tarefa in mapaTarefas) {
      tarefas.add(Task(
          task: tarefa[_name],
          photo: tarefa[_image],
          hardShip: tarefa[_difficulty]));
    }
    return tarefas;
  }

  Future<List<Task>> find(String nomeTarefa) async {
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tableName, where: '$_name = ?', whereArgs: [nomeTarefa]);
    return toList(result);
  }

  delete(String nomeTarefa) async {}
}
