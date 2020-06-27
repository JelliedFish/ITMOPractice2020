

import 'package:flutterapp/MainPresenter/MainPresenter.dart';
import 'package:flutterapp/Statistics/view/StatisticsView.dart';

class StatisticsPresenter {

  var _statisticsView;
  var _mainPresenter;

  get mainPresenter => _mainPresenter;

  get statisticsView => _statisticsView;

  StatisticsPresenter(MainPresenter mainPresenter){
    _mainPresenter = mainPresenter;
    _statisticsView = StatisticsView(this);
  }

}