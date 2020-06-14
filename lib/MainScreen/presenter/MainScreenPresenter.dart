

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

  void goToCatalogMath(BuildContext context){
    _mainPresenter.catalogPresenter.catalogView.state = "Math";
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => _mainPresenter.catalogPresenter.catalogView),
    );
  }

  void goToCatalogRussian(BuildContext context){
    _mainPresenter.catalogPresenter.catalogView.state = "Russian";
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => _mainPresenter.catalogPresenter.catalogView),
    );
  }

}