

import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/model/CatalogModel.dart';
import 'package:flutterapp/Catalog/tasks/presenter/TasksPresenter.dart';
import 'package:flutterapp/Catalog/variants/presenter/VariantsPresenter.dart';
import 'package:flutterapp/Catalog/view/CatalogView.dart';

class CatalogPresenter {
  var _variantsPresenter;
  var _tasksPresenter;

  var _catalogView;
  var _catalogModel;
  var _state;

  get catalogModel => _catalogModel;
  get variantsPresenter => _variantsPresenter;
  get tasksPresenter => _tasksPresenter;

  set state(value) {
    _state = value;
  }

  CatalogPresenter() {
    _catalogView = CatalogView(this);
    _catalogModel = CatalogModel(this);
    _variantsPresenter = VariantsPresenter();
    _tasksPresenter = TasksPresenter();
  }

  get catalogView => _catalogView;


//TODO: You can create method which has returned Widget and it is based on _state

  void loadColorOfModel() {
    switch (_state) {
      case "Russian":
        {
          _catalogModel.color = Colors.deepPurple;
        }
        break;

      case "Math":
        {
          _catalogModel.color = Colors.redAccent;
        }
        break;

      default: {
    _catalogModel.color = Colors.redAccent;
    }
  }
}


  void goBack(BuildContext context){
    Navigator.pop(context);
  }
}