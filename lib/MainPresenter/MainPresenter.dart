import 'package:flutterapp/Blitz/presenter/BlitzPresenter.dart';
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/MainPresenter/view/MainPresenterView.dart';
import 'package:flutterapp/MainScreen/presenter/MainScreenPresenter.dart';
import 'package:flutterapp/Statistics/presenter/StatisticsPresenter.dart';
import 'package:flutterapp/Statistics/view/StatisticsView.dart';
import 'package:flutterapp/Theory/presenter/TheoryPresenter.dart';

class MainPresenter{

  var _mainScreenPresenter;
  var _catalogPresenter;
  var _theoryPresenter;
  var _blitzPresenter;
  var _statisticsPresenter;

  var _mainPresenterView;

  get mainPresenterView => _mainPresenterView;
  get mainScreenPresenter => _mainScreenPresenter;
  get catalogPresenter => _catalogPresenter;
  get theoryPresenter => _theoryPresenter;
  get blitzPresenter => _blitzPresenter;
  get statisticsPresenter => _statisticsPresenter;


  MainPresenter(){
    _mainScreenPresenter = MainScreenPresenter(this);
    _catalogPresenter = CatalogPresenter();
    _theoryPresenter = TheoryPresenter();
    _blitzPresenter = BlitzPresenter();
    _statisticsPresenter = StatisticsPresenter();
    _mainPresenterView = MainPresenterView(this);
  }


}


void main(){
  var mainPresenter = MainPresenter();
}