
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Test/EvenWeek/Timetable/presenter/TimtablePresenter.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/model/TimetableModel.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/presenter/TimetablePresenter.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';

class OddTimetableView extends StatefulWidget{
  var _info;

  get info => _info;
  var  _oddWeekPresenter;
  var _timetablePresenter;
  var _timetableModel;

  OddTimetableView(String info, OddWeekPresenter oddWeekPresenter, OddTimetablePresenter timetablePresenter, OddTimetableModel oddTimetableModel){
    _info = info;
    _oddWeekPresenter = oddWeekPresenter;
    _timetablePresenter = timetablePresenter;
    _timetableModel = oddTimetableModel;
  }

  @override
  OddTimetableViewState createState() => OddTimetableViewState(_info, _oddWeekPresenter, _timetablePresenter, _timetableModel);

  get evenWeekPresenter => _oddWeekPresenter;

  get timetablePresenter => _timetablePresenter;
}
//

class OddTimetableViewState extends State<OddTimetableView> {
  var _info;
  List<Container> litems = [];
  final TextEditingController eCtrl = new TextEditingController();
  get info => _info;
  var  _oddWeekPresenter;
  var _timetablePresenter;
  var _timetableModel;
  List<Container> _subjects = [];




  @override
  void initState() {
    for (var text in _timetableModel.subjects){
      litems.add(createContainer(text, _oddWeekPresenter, context, _timetableModel));
    }
    super.initState();
  }

  OddTimetableViewState(String info, OddWeekPresenter oddWeekPresenter, OddTimetablePresenter timetablePresenter, OddTimetableModel oddTimetableModel){
    _info = info;
    _oddWeekPresenter = oddWeekPresenter;
    _timetablePresenter = timetablePresenter;
    _timetableModel = oddTimetableModel;
  }

  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: _oddWeekPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd, title: Text("Предметы")),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: eCtrl,
              onSubmitted: (text) {
                litems.add(createContainer(text, _oddWeekPresenter, context, _timetableModel));
                _timetableModel.subjects.add(text);
                eCtrl.clear();
                setState(() {});
              },
            ),
            new Expanded(
                child: new ListView.builder
                  (
                    itemCount: litems.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return litems[index];
                    }
                )
            )
          ],
        )
    );
  }

}

Widget createContainer(String text, OddWeekPresenter oddWeekPresenter,BuildContext context, OddTimetableModel timetableModel){
  return

    Container(
      height: 48,
      child: FlatButton
        (
        shape:  RoundedRectangleBorder( borderRadius: new BorderRadius.circular(20.0)),
        color: Colors.transparent,
        child:
        Text(text, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
        onPressed:  (){
          oddWeekPresenter.testPresenter.subjectPresenter.subjectModel.subject = text;
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> oddWeekPresenter.testPresenter.subjectPresenter.subjectView)
          );

        },

      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ oddWeekPresenter.mainPresenter.mainPresenterModel.themeColorStart, oddWeekPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
        ),
        color: oddWeekPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),


    );
}