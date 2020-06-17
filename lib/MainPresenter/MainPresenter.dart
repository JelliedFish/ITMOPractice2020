import 'package:flutterapp/Blitz/presenter/BlitzPresenter.dart';
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/MainPresenter/view/MainPresenterView.dart';
import 'package:flutterapp/MainScreen/presenter/MainScreenPresenter.dart';
import 'package:flutterapp/Statistics/presenter/StatisticsPresenter.dart';
import 'package:flutterapp/Statistics/view/StatisticsView.dart';
import 'package:flutterapp/Theory/presenter/TheoryPresenter.dart';

import 'model/MainPresenterModel.dart';

class MainPresenter{

  var _mainScreenPresenter;
  var _catalogPresenter;
  var _theoryPresenter;
  var _blitzPresenter;
  var _statisticsPresenter;

  var _mainPresenterView;
  var _mainPresenterModel;

  get mainPresenterModel => _mainPresenterModel;
  get mainPresenterView => _mainPresenterView;
  get mainScreenPresenter => _mainScreenPresenter;
  get catalogPresenter => _catalogPresenter;
  get theoryPresenter => _theoryPresenter;
  get blitzPresenter => _blitzPresenter;
  get statisticsPresenter => _statisticsPresenter;


  MainPresenter(){
    _mainPresenterModel = MainPresenterModel(this);
    _mainPresenterView = MainPresenterView(this);
    _mainScreenPresenter = MainScreenPresenter(this);
    _catalogPresenter = CatalogPresenter(this);
    _theoryPresenter = TheoryPresenter(this);
    _blitzPresenter = BlitzPresenter();
    _statisticsPresenter = StatisticsPresenter();
  }


}


void main(){
  var mainPresenter = MainPresenter();
}