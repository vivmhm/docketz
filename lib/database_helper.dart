//import 'package:docketz/mod/dockz.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'mod/task.dart';
import 'mod/dockz.dart';

class DatabaseHelper {

  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'dockz.db'),
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
        await db.execute("CREATE TABLE dockz(id INTEGER PRIMARY KEY, taskId INTEGER, title TEXT, isDone INTEGER)");

        return db;
      },
      version: 1,
    );
  }

  Future<int> insertTask(Task task) async {
    int taskId = 0;
    Database _db = await database();
    await _db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace).then((value) {
      taskId = value;
    });
    return taskId;
  }

  Future<void> updateTaskTitle(int id, String title) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET title = '$title' WHERE id = '$id'");
  }

  Future<void> updateTaskDescription(int id, String description) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE tasks SET description = '$description' WHERE id = '$id'");
  }

  Future<void> insertDockz(Dockz dockz) async {
    Database _db = await database();
    await _db.insert('dockz', dockz.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> getTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('tasks');
    return List.generate(taskMap.length, (index) {
      return Task(id: taskMap[index]['id'], title: taskMap[index]['title'], description: taskMap[index]['description']);
    });
  }

  Future<List<Dockz>> getDockz(int taskId) async {
    Database _db = await database();
    List<Map<String, dynamic>> dockzMap = await _db.rawQuery("SELECT * FROM dockz WHERE taskId = $taskId");
    return List.generate(dockzMap.length, (index) {
      return Dockz(id: dockzMap[index]['id'], title: dockzMap[index]['title'], taskId: dockzMap[index]['taskId'], isDone: dockzMap[index]['isDone']);
    });
  }

  Future<void> updateDockzDone(int id, int isDone) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE dockz SET isDone = '$isDone' WHERE id = '$id'");
  }

  Future<void> deleteTask(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM tasks WHERE id = '$id'");
    await _db.rawDelete("DELETE FROM dockz WHERE taskId = '$id'");
  }

}