

import 'package:flutter/material.dart';

class CatalogModel{


  var _catalogPresenter;
  var _amountOfAnswers = "50 из 600";

  get amountOfAnswers => _amountOfAnswers;

  set amountOfAnswers(value) {
    _amountOfAnswers = value;
  }

  CatalogModel(this._catalogPresenter);
}