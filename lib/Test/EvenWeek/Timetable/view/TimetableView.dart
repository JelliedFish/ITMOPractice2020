
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Test/EvenWeek/Timetable/presenter/TimtablePresenter.dart';
import 'package:flutterapp/Test/EvenWeek/presenter/EvenWeekPresenter.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';

class EvenTimetableView extends StatefulWidget{
  var _info;

  get info => _info;
  var  _evenWeekPresenter;
  var _timetablePresenter;

  EvenTimetableView(String info, EvenWeekPresenter evenWeekPresenter, EvenTimetablePresenter timetablePresenter){
    _info = info;
    _evenWeekPresenter = evenWeekPresenter;
    _timetablePresenter = timetablePresenter;
  }

  @override
  TimetableViewState createState() => TimetableViewState(_info, _evenWeekPresenter);

  get evenWeekPresenter => _evenWeekPresenter;

  get timetablePresenter => _timetablePresenter;
}
//

class TimetableViewState extends State<EvenTimetableView> {
  var _info;
  var  _evenWeekPresenter;


  TimetableViewState(this._info, this._evenWeekPresenter);

  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: _evenWeekPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: eCtrl,
              onSubmitted: (text) {
                litems.add(text);
                eCtrl.clear();
                setState(() {});
              },
            ),
            new Expanded(
                child: new ListView.builder
                  (
                    itemCount: litems.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return new Text(litems[Index]);
                    }
                )
            )
          ],
        )
    );
  }

}