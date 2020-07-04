import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/MainPresenter/MainPresenter.dart';
import 'package:flutterapp/MainScreen/view/MainScreenView.dart';

class MainScreenPresenter {
  var _mainScreenView;
  var _mainPresenter;


  MainScreenPresenter(MainPresenter mainPresenter){
    this._mainPresenter = mainPresenter;
    this._mainScreenView = MainScreenView.presenter(this);
    startMainScreen();
  }

   void startMainScreen() {
    runApp(_mainScreenView);
  }

  void goToCatalogTeacher(BuildContext context){
    _mainPresenter.catalogPresenter.state = "Teacher";
    _mainPresenter.catalogPresenter.loadCatalogModel();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => _mainPresenter.mainPresenterView),
    );
  }

  void goToCatalogStudent(BuildContext context){
    _mainPresenter.catalogPresenter.state = "Student";
    _mainPresenter.catalogPresenter.loadCatalogModel();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => _mainPresenter.mainPresenterView),
    );
  }

}