

import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/model/CatalogModel.dart';
import 'package:flutterapp/Catalog/view/CatalogView.dart';

class CatalogPresenter {
  var _catalogView;
  var _catalogModel;
  var _state;

  get catalogModel => _catalogModel;

  set state(value) {
    _state = value;
  }

  CatalogPresenter() {
    _catalogView = CatalogView(this);
    _catalogModel = CatalogModel(this);
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