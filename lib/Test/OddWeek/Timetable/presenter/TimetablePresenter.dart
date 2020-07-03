

import 'package:flutterapp/Test/OddWeek/Timetable/view/TimetableView.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';

class OddTimetablePresenter{

  var _timetableView;

  get timetableView => _timetableView;
  var _oddWeekPresenter;

  OddTimetablePresenter(OddWeekPresenter oddWeekPresenter, String info){
    _oddWeekPresenter = oddWeekPresenter;
    _timetableView = new OddTimetableView(info, oddWeekPresenter, this);
  }



}