

import 'package:flutterapp/MainPresenter/MainPresenter.dart';
import 'package:flutterapp/Statistics/StatisticsGroup/presenter/StatisticsGroupPresenter.dart';
import 'package:flutterapp/Statistics/StatisticsPeople/presenter/StatisticsPeoplePresenter.dart';
import 'package:flutterapp/Statistics/view/MainStatisticView.dart';
import 'package:flutterapp/Statistics/view/StatisticsView.dart';

class StatisticsPresenter {

  var _statisticsView;
  var _statisticsPeoplePresenter;
  var _statisticsGroupPresenter;
  var _mainPresenter;

  get mainPresenter => _mainPresenter;

  get statisticsView => _statisticsView;

  StatisticsPresenter(MainPresenter mainPresenter){
    _mainPresenter = mainPresenter;
    _statisticsView = MainStatisticView(this);
    _statisticsPeoplePresenter = StatisticsPeoplePresenter(this);
    _statisticsGroupPresenter = StatisticsGroupPresenter(this);
  }

  get statisticsPeoplePresenter => _statisticsPeoplePresenter;

  set statisticsPeoplePresenter(value) {
    _statisticsPeoplePresenter = value;
  }

  get statisticsGroupPresenter => _statisticsGroupPresenter;

  set statisticsGroupPresenter(value) {
    _statisticsGroupPresenter = value;
  }
}