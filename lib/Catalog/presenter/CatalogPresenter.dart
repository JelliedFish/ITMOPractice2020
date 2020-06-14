

import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/view/CatalogView.dart';

class CatalogPresenter{
   var _catalogView;

  CatalogPresenter(){

    _catalogView = CatalogView(this);
  }

  get catalogView => _catalogView;

//You can change the signature of this method : it should be your Widget.
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

  void goBack(BuildContext context){
    Navigator.pop(context);
  }

}