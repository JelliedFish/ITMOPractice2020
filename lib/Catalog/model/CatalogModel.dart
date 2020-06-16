

import 'package:flutter/material.dart';

class CatalogModel{


  var _catalogPresenter;
  Color _color = Colors.redAccent;
  var _amountOfAnswers = "50 из 600";

  get color => _color;

  set color(value) {
    _color = value;
  }

  get amountOfAnswers => _amountOfAnswers;

  set amountOfAnswers(value) {
    _amountOfAnswers = value;
  }

  CatalogModel(this._catalogPresenter);
}