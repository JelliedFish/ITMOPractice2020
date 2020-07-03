

import 'package:flutterapp/Test/EvenWeek/view/EvenWeekView.dart';
import 'package:flutterapp/Test/presenter/TestPresenter.dart';

class EvenWeekPresenter {

  var _evenWeekView;
  var _testPresenter;
  var _mainPresenter;

  get mainPresenter => _mainPresenter;

  get evenWeekView => _evenWeekView;
  get testPresenter => _testPresenter;


  EvenWeekPresenter(TestPresenter testPresenter) {
      _evenWeekView = new EvenWeekView(this);
      _testPresenter = testPresenter;
      _mainPresenter = testPresenter.mainPresenter;
    }

}