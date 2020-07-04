import 'dart:convert';

import 'package:flutterapp/Catalog/model/CatalogModel.dart';
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/Statistics/presenter/StatisticsPresenter.dart';


class TaskModel {
  var _catalogModel;

  TaskModel(CatalogModel catalogModel){
    _catalogModel = catalogModel;
  }

  get catalogModel => _catalogModel;

}