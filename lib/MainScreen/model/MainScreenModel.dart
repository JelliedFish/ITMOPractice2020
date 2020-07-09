import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainScreenModel {

  var _name;
  var _lastname;
  var _id;
  var _group_id;

  var _mainScreenPresenter;

  MainScreenModel(this._mainScreenPresenter);

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
}