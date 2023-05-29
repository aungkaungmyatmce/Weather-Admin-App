import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sql.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    /// palces = database file name, user_places = table name
    return await sql.openDatabase(path.join(dbPath, 'itemFolder.db'),
        onCreate: (db, version) {
      return db.execute('''CREATE TABLE cities(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT
        )''');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //Read all data
  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    List<Map<String, dynamic>> data = await db.query(table, orderBy: 'id');
    return data;
  }

  // Delete
  static Future<void> deleteItem(String name) async {
    final db = await DBHelper.database();
    try {
      await db.delete("cities", where: "name = ?", whereArgs: [name]);
    } catch (err) {
      print("Something went wrong when deleting an item: $err");
    }
  }
}
