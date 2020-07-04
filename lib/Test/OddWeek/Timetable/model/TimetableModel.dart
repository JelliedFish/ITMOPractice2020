
import 'package:flutter/cupertino.dart';

class OddTimetableModel{

  List<String> _subjects = ["Russian", "Federation"];

  OddTimetableModel(){
   _subjects =  ["Russian", "Federation"];
  }

  List<String> get subjects => _subjects;

  void addSubject(String subject){
    _subjects.add(subject);
  }

  void removeSubject(String subject){
    _subjects.remove(subject);
  }

  set subjects(List<String> value) {
    _subjects = value;
  }

}