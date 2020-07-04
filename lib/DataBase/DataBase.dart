
import 'dart:io';

import 'package:flutterapp/Catalog/tasks/model/TaskModel.dart';
import 'package:flutterapp/Catalog/variants/model/VariantsModel.dart';
import 'package:flutterapp/Theory/model/ProfilMathTheoryModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBClient {
  DBClient._();

  static final DBClient db = DBClient._();

  static Database _databaseOfVariants;
  static Database _databaseOfTasks;
  static Database _databaseOfTheory;

  Future<Database> get databaseOfVariants async {
    if (_databaseOfVariants != null)
      return _databaseOfVariants;

    // if _database is null we instantiate it
    _databaseOfVariants = await initDBOfVariants();
    return _databaseOfVariants;
  }

  Future<Database> get databaseOfTheory async {
    if (_databaseOfTheory != null)
      return _databaseOfTheory;

    // if _database is null we instantiate it
    _databaseOfTheory = await initDBOfTheory();
    return _databaseOfTheory;
  }

  Future<Database> get databaseOfTasks async {
    if (_databaseOfTasks != null)
      return _databaseOfTasks;

    // if _database is null we instantiate it
    _databaseOfTasks = await initDBOfTasks();
    return _databaseOfTasks;
  }

  initDBOfVariants() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DBOfVariants.db");
    return await openDatabase(path, version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Variant ("
              "id INTEGER PRIMARY KEY,"
              "text1 TEXT,"
              "text2 TEXT,"
              "text3 TEXT,"
              "text4 TEXT,"
              "text5 TEXT,"
              "text6 TEXT,"
              "text7 TEXT,"
              "text8 TEXT,"
              "text9 TEXT,"
              "text10 TEXT,"
              "text11 TEXT,"
              "text12 TEXT,"
              "image_link1 TEXT,"
              "image_link2 TEXT,"
              "image_link3 TEXT,"
              "image_link4 TEXT,"
              "image_link5 TEXT,"
              "image_link6 TEXT,"
              "image_link7 TEXT,"
              "image_link8 TEXT,"
              "image_link9 TEXT,"
              "image_link10 TEXT,"
              "image_link11 TEXT,"
              "image_link12 TEXT,"
              "visited INTEGER,"
              "right_answers INTEGER"
              ")");
        });
  }

  initDBOfTasks() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DBOfTasksNew.db");
    return await openDatabase(path, version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Task ("
              "id INTEGER PRIMARY KEY,"
              "text TEXT,"
              "image_link TEXT,"
              "visited INTEGER,"
              "right_answer INTEGER"
              ")");
        });
  }

  initDBOfTheory() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DBOfTheory.db");
    return await openDatabase(path, version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Theory ("
              "id INTEGER PRIMARY KEY,"
              "text TEXT"
              ")");
        });
  }



    Future<void> insertTheory(TheoryModel tm) async {
      final db = await databaseOfTheory;
      var res = await db.insert("Theory", tm.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
        return res;
    }


  updateTheory(TheoryModel tm) async {
    final db = await databaseOfTheory;
    var res = await db.update("Theory", tm.toJson(),
        where: "id = ?", whereArgs: [tm.id]);
    return res;
  }


   getTheoryByID(int id) async {
      final db = await databaseOfTheory;
      var res = await  db.query("Theory", where: "id = ?", whereArgs: [id]);
      return res.isNotEmpty ? TheoryModel.fromJson(res.first) : Null ;
    }
  }
