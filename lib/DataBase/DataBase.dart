
import 'dart:io';

import 'package:flutterapp/Catalog/variants/model/ProfilMathVariantsModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBClient {
  DBClient._();

  static final DBClient db = DBClient._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "DB1.db");
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
              "number INTEGER,"
              "visited INTEGER,"
              "right_answers INTEGER"
              ")");
        });
  }

    Future<void> insertVariant(VariantModel vm) async {
        final db = await database;
        var res = await db.insert("Variant", vm.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
        return res;
    }


   getVariantByID(int id) async {
      final db = await database;
      var res = await  db.query("Variant", where: "id = ?", whereArgs: [id]);
      return res.isNotEmpty ? VariantModel.fromJson(res.first) : Null ;
    }
  }
