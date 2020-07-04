import 'dart:convert';

import 'package:flutterapp/Catalog/model/CatalogModel.dart';
import 'package:flutterapp/Catalog/tasks/model/TaskModel.dart';
import 'package:flutterapp/Statistics/presenter/StatisticsPresenter.dart';


class VariantsModel {
    var _catalogModel;

  VariantsModel(CatalogModel catalogModel){
  _catalogModel = catalogModel;
  }


  get catalogModel => _catalogModel;
}