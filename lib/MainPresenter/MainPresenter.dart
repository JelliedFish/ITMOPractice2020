

import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/MainScreen/presenter/MainScreenPresenter.dart';

class MainPresenter{

  var _mainScreenPresenter;
  var _catalogPresenter;

  get mainScreenPresenter => _mainScreenPresenter;
  get catalogPresenter => _catalogPresenter;

  MainPresenter(){
    _mainScreenPresenter = MainScreenPresenter(this);
    _catalogPresenter = CatalogPresenter();
  }
}


void main(){
  var mainPresenter = MainPresenter();
}