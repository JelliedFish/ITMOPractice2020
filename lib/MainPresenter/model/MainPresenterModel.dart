


import 'package:flutterapp/MainPresenter/MainPresenter.dart';

class MainPresenterModel {
  var _amountOfTasks;
  var _themeColorStart;
  var _themeColorEnd;

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
}