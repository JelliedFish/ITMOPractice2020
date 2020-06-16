

import 'package:flutterapp/Statistics/view/StatisticsView.dart';

class StatisticsPresenter {

  var _statisticsView;

  get statisticsView => _statisticsView;

  StatisticsPresenter(){
    _statisticsView = StatisticsView(this);
  }

}