



import 'package:flutterapp/Statistics/StatisticsGroup/view/StatisticsGroupView.dart';
import 'package:flutterapp/Statistics/StatisticsPeople/view/StatisticsPeopleView.dart';

class StatisticsGroupPresenter {
  var _statisticsGroupView;
  var _statisticsPresenter;

  get statisticsGroupView => _statisticsGroupView;

  get statisticsPresenter => _statisticsPresenter;

  set statisticsPresenter(value) {
    _statisticsPresenter = value;
  }

  set statisticsGroupView(value) {
    _statisticsGroupView = value;
  }

  StatisticsGroupPresenter(this._statisticsPresenter) {
    _statisticsGroupView = StatisticsGroupView(this);
  }


}