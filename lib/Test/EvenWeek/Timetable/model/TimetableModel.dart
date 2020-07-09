
import 'package:flutter/cupertino.dart';

class EvenTimetableModel{

  var _dayOfTheWeek;

  List<String> _subjects = [];

  EvenTimetableModel(){
    _subjects =  [];
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

  get dayOfTheWeek => _dayOfTheWeek;

  set dayOfTheWeek(value) {
    _dayOfTheWeek = value;
  }
}