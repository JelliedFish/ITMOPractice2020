

import 'package:flutterapp/Test/OddWeek/Timetable/model/TimetableModel.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/view/TimetableView.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';

class OddTimetablePresenter{

  var _timetableView;
  var _timetableModel;

  get timetableView => _timetableView;
  var _oddWeekPresenter;

  OddTimetablePresenter(OddWeekPresenter oddWeekPresenter, String info){
    _oddWeekPresenter = oddWeekPresenter;
    _timetableModel = new OddTimetableModel();
    _timetableView = new OddTimetableView(info, oddWeekPresenter, this,_timetableModel);
    _oddWeekPresenter.testPresenter.testModel.dayOfTheWeek = info;
  }

  get timetableModel => _timetableModel;

  set timetableModel(value) {
    _timetableModel = value;
  }

  get oddWeekPresenter => _oddWeekPresenter;

  set oddWeekPresenter(value) {
    _oddWeekPresenter = value;
  }
}