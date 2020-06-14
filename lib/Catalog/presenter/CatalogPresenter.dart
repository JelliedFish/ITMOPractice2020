

import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/view/CatalogView.dart';

class CatalogPresenter{
   var _catalogView;


  CatalogPresenter(){

    _catalogView = CatalogView(this);
  }

  get catalogView => _catalogView;


  Text mathOrRussian(String s){

    switch (s) {
      case "Russian":
        {
          return Text("Это каталог Русского");
        }
        break;

      case "Math":
        {
          return Text("Это каталог Математики");
        }
        break;

      default:
        {
          return Text("Ошибка, не выбран каталог");
        }
    }
  }

}