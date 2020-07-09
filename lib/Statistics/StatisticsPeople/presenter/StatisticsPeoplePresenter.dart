



import 'package:flutterapp/Statistics/StatisticsPeople/view/StatisticsPeopleView.dart';

class StatisticsPeoplePresenter {
  var _statisticsPeopleView;
  var _statisticsPresenter;

  get statisticsPeopleView => _statisticsPeopleView;

  get statisticsPresenter => _statisticsPresenter;

  set statisticsPresenter(value) {
    _statisticsPresenter = value;
  }

  set statisticsPeopleView(value) {
    _statisticsPeopleView = value;
  }

  StatisticsPeoplePresenter(this._statisticsPresenter) {
    _statisticsPeopleView = StatisticsPeopleView(this);
  }


}