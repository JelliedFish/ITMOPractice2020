


import 'package:flutterapp/MainPresenter/MainPresenter.dart';

class MainPresenterModel {
  var _amountOfTasks;
  var _themeColor;

  get amountOfTasks => _amountOfTasks;

  set amountOfTasks(value) {
    _amountOfTasks = value;
  }

  var _mainPresenter;


  MainPresenterModel(MainPresenter mainPresenter){
    _mainPresenter = mainPresenter;
  }

  get themeColor => _themeColor;

  set themeColor(value) {
    _themeColor = value;
  }
}