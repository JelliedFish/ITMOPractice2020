import 'package:flutterapp/Test/OddWeek/view/OddWeekView.dart';
import 'package:flutterapp/Test/presenter/TestPresenter.dart';

class OddWeekPresenter {

  var _oddWeekView;
  var _testPresenter;

  var _mainPresenter;

  get mainPresenter => _mainPresenter;

  get oddWeekView => _oddWeekView;
  get testPresenter => _testPresenter;

  OddWeekPresenter(TestPresenter testPresenter) {
    _oddWeekView = new OddWeekView(this);
    _testPresenter = testPresenter;
    _mainPresenter = testPresenter.mainPresenter;
  }


}