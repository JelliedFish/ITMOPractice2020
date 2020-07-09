

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CatalogModel{

  List<String> _groups;
  var _catalogPresenter;
  var _amountOfAnswers = "ФИО преподавателя";

  get amountOfAnswers => _amountOfAnswers;

  set amountOfAnswers(value) {
    _amountOfAnswers = value;
  }

  CatalogModel(this._catalogPresenter) {
    _groups = ["M3205","M3203"]; //add from DB
  }


  List<String> get groups => _groups;

  set groups(List<String> value) {
    _groups = value;
  }
}