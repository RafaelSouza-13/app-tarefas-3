import '../components/task.dart';

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
  Future<List<Task>> findAll() async {}
  Future<List<Task>> find(String nomeTarefa) async {}
}
