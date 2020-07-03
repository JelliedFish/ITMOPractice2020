

import 'package:flutter/material.dart';

class CatalogModel{


  var _catalogPresenter;
  var _amountOfAnswers = "ФИО преподавателя";

  get amountOfAnswers => _amountOfAnswers;

  set amountOfAnswers(value) {
    _amountOfAnswers = value;
  }

  CatalogModel(this._catalogPresenter);
}