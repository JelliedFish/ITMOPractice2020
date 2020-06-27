import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class Variant {
  final int id;
  final String text_of_tasks;
  final String image_link;

  Variant({this.id, this.text_of_tasks, this.image_link});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': text_of_tasks,
      'age': image_link,
    };
  }

  

}