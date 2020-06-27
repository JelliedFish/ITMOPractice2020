



import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
}


class DataBase {
  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

}

initDB() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "TestDB.db");
  return await openDatabase(path, version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Variant ("
            "id INTEGER PRIMARY KEY,"
            "number TEXT,"
            "text_of_tasks TEXT,"
            "image_link TEXT,"
            "blocked BIT"
            ")");
      });
}
