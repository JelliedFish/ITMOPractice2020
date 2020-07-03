
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Test/EvenWeek/Timetable/presenter/TimtablePresenter.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/presenter/TimetablePresenter.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';

class OddTimetableView extends StatefulWidget{
  var _info;

  get info => _info;
  var  _oddWeekPresenter;
  var _timetablePresenter;

  OddTimetableView(String info, OddWeekPresenter oddWeekPresenter, OddTimetablePresenter timetablePresenter){
    _info = info;
    _oddWeekPresenter = oddWeekPresenter;
    _timetablePresenter = timetablePresenter;
  }

  @override
  OddTimetableViewState createState() => OddTimetableViewState(_info, _oddWeekPresenter);

  get evenWeekPresenter => _oddWeekPresenter;

  get timetablePresenter => _timetablePresenter;
}
//

class OddTimetableViewState extends State<OddTimetableView> {
  var _info;
  var  _oddWeekPresenter;


  OddTimetableViewState(this._info, this._oddWeekPresenter);

  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: _oddWeekPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd),
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