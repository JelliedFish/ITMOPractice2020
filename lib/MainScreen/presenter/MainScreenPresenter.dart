


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/MainPresenter/MainPresenter.dart';
import 'package:flutterapp/MainScreen/model/MainScreenModel.dart';
import 'package:flutterapp/MainScreen/view/MainScreenView.dart';

class MainScreenPresenter {
  var _mainScreenView;
  var _mainScreenModel;

  get mainScreenView => _mainScreenView;

  set mainScreenView(value) {
    _mainScreenView = value;
  }

  var _mainPresenter;


  MainScreenPresenter(MainPresenter mainPresenter){
    this._mainPresenter = mainPresenter;
    this._mainScreenView = MainScreenView.presenter(this);
    _mainScreenModel = MainScreenModel(this);

  }


  void goToCatalogTeacher(BuildContext context, id){
    _mainPresenter.catalogPresenter.state = "Teacher";
    _mainPresenter.catalogPresenter.loadCatalogModel();
    _mainPresenter.mainPresenterModel.teacher_id = id;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => _mainPresenter.mainPresenterView),
    );
  }

  void goToCatalogStudent(BuildContext context, id) async {
    _mainPresenter.catalogPresenter.state = "Student";
    _mainPresenter.catalogPresenter.loadCatalogModel();
    _mainPresenter.testPresenter.testModel.group = await Firestore.instance.collection("Groups").document(id).get()
        .then((document) {
          mainPresenter.mainPresenterModel.group = document.data["group_name"] ;
          mainPresenter.mainPresenterModel.visits = document.data["visits"] ;
        });

        Navigator.push(context,
        MaterialPageRoute(builder: (context) => _mainPresenter.testPresenter.testView),
    );
  }

  get mainPresenter => _mainPresenter;

  set mainPresenter(value) {
    _mainPresenter = value;
  }

  get mainScreenModel => _mainScreenModel;

  set mainScreenModel(value) {
    _mainScreenModel = value;
  }
}