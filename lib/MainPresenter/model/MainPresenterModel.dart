


import 'package:flutterapp/MainPresenter/MainPresenter.dart';

class MainPresenterModel {
  var _amountOfTasks;
  var _themeColorStart;
  var _themeColorEnd;
  var _teacher = true;
  var _name;
  var _teacher_id;
  var _lastname;
  var _group;
  var _id;
  var _group_id;
  int _students_visits;
  int _visits;


  get themeColorEnd => _themeColorEnd;

  set themeColorEnd(value) {
    _themeColorEnd = value;
  }

  get amountOfTasks => _amountOfTasks;

  set amountOfTasks(value) {
    _amountOfTasks = value;
  }

  var _mainPresenter;


  MainPresenterModel(MainPresenter mainPresenter){
    _mainPresenter = mainPresenter;
  }

  get themeColorStart => _themeColorStart;

  set themeColorStart(value) {
    _themeColorStart = value;
  }

  get teacher => _teacher;

  set teacher(value) {
    _teacher = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get lastname => _lastname;

  set lastname(value) {
    _lastname = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }

  get group_id => _group_id;

  set group_id(value) {
    _group_id = value;
  }

  get group => _group;

  set group(value) {
    _group = value;
  }

  get teacher_id => _teacher_id;

  set teacher_id(value) {
    _teacher_id = value;
  }

  get students_visits => _students_visits;

  set students_visits(value) {
    _students_visits = value;
  }

  get visits => _visits;

  set visits(value) {
    _visits = value;
  }
}