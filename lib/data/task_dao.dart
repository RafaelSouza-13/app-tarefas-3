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

  save(Task tarefa) async {
    final Database bancoDeDados = await getDataBase();
    var itemExist = await find(tarefa.task);
    Map<String, dynamic> values = toMap(tarefa);
    if (itemExist.isEmpty) {
      return await bancoDeDados.insert(_tableName, values);
    } else {
      return await bancoDeDados.update(_tableName, values,
          where: '$_name = ?', whereArgs: [tarefa.task]);
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    Map<String, dynamic> mapa = {
      _name: tarefa.task,
      _difficulty: tarefa.hardShip,
      _image: tarefa.photo,
    };
    return mapa;
  }

  Future<List<Task>> findAll() async {
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tableName);
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaTarefas) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> tarefa in mapaTarefas) {
      tarefas.add(Task(
        task: tarefa[_name],
        hardShip: tarefa[_difficulty],
        photo: tarefa[_image],
      ));
    }
    return tarefas;
  }

  Future<List<Task>> find(String nomeTarefa) async {
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tableName, where: '$_name = ?', whereArgs: [nomeTarefa]);
    return toList(result);
  }

  delete(String nomeTarefa) async {
    final Database bancoDeDados = await getDataBase();
    return bancoDeDados
        .delete(_tableName, where: '$_name = ?', whereArgs: [nomeTarefa]);
  }
}
