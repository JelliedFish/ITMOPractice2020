





import 'package:flutterapp/Test/EvenWeek/Timetable/view/TimetableView.dart';
import 'package:flutterapp/Test/EvenWeek/presenter/EvenWeekPresenter.dart';

class EvenTimetablePresenter{

  var _timetableView;

  get timetableView => _timetableView;
  var _evenWeekPresenter;

  get evenWeekPresenter => _evenWeekPresenter;

  EvenTimetablePresenter(EvenWeekPresenter evenWeekPresenter, String info){
    _evenWeekPresenter = evenWeekPresenter;
    _timetableView = new EvenTimetableView(info, evenWeekPresenter, this);
  }



}