





import 'package:flutterapp/Test/EvenWeek/Timetable/model/TimetableModel.dart';
import 'package:flutterapp/Test/EvenWeek/Timetable/view/TimetableView.dart';
import 'package:flutterapp/Test/EvenWeek/presenter/EvenWeekPresenter.dart';

class EvenTimetablePresenter{

  var _timetableView;
  var _timetableModel;


  get timetableView => _timetableView;
  var _evenWeekPresenter;

  get evenWeekPresenter => _evenWeekPresenter;

  EvenTimetablePresenter(EvenWeekPresenter evenWeekPresenter, String info){
    _evenWeekPresenter = evenWeekPresenter;
    _timetableModel = new EvenTimetableModel();
    _timetableView = new EvenTimetableView(info, evenWeekPresenter, this,_timetableModel);

  }



}