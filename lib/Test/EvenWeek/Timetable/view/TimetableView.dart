
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Test/EvenWeek/Timetable/model/TimetableModel.dart';
import 'package:flutterapp/Test/EvenWeek/Timetable/presenter/TimtablePresenter.dart';
import 'package:flutterapp/Test/EvenWeek/presenter/EvenWeekPresenter.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/model/TimetableModel.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';

class EvenTimetableView extends StatefulWidget{
  var _info;

  get info => _info;
  var  _evenWeekPresenter;
  var _timetablePresenter;
  var _timetableModel;

  EvenTimetableView(String info, EvenWeekPresenter evenWeekPresenter, EvenTimetablePresenter timetablePresenter, EvenTimetableModel evenTimetableModel){
    _info = info;
    _evenWeekPresenter = evenWeekPresenter;
    _timetablePresenter = timetablePresenter;
    _timetableModel = evenTimetableModel;
  }

  @override
  TimetableViewState createState() => TimetableViewState(_info, _evenWeekPresenter,_timetablePresenter,_timetableModel);

  get evenWeekPresenter => _evenWeekPresenter;

  get timetablePresenter => _timetablePresenter;
}
//

class TimetableViewState extends State<EvenTimetableView> {
  var _info;

  get info => _info;
  var  _evenWeekPresenter;
  var _timetablePresenter;
  var _timetableModel;
  List<Container> litems = [];
  final TextEditingController eCtrl = new TextEditingController();




  @override
  void initState() {
    for (var text in _timetableModel.subjects){
      litems.add(createContainer(text, _evenWeekPresenter, context, _timetableModel));
    }
    super.initState();
  }

  TimetableViewState(String info, EvenWeekPresenter evenWeekPresenter, EvenTimetablePresenter timetablePresenter, EvenTimetableModel evenTimetableModel){
    _info = info;
    _evenWeekPresenter = evenWeekPresenter;
    _timetablePresenter = timetablePresenter;
    _timetableModel = evenTimetableModel;

  }


  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: _evenWeekPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd, title: Text("Предметы")),
        body: new Column(
          children: <Widget>[
            new TextField(
              controller: eCtrl,
              onSubmitted: (text) {
                litems.add(createContainer(text, _evenWeekPresenter,context,_timetableModel));
                eCtrl.clear();
                setState(() {});
              },
            ),
            new Expanded(
                child: new ListView.builder
                  (
                    itemCount: litems.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return litems[Index];
                    }
                )
            )
          ],
        )
    );
  }

}


Widget createContainer(String text, EvenWeekPresenter evenWeekPresenter,BuildContext context, EvenTimetableModel timetableModel){
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
          evenWeekPresenter.testPresenter.subjectPresenter.subjectModel.subject = text;
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> evenWeekPresenter.testPresenter.subjectPresenter.subjectView)
          );

        },

      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ evenWeekPresenter.mainPresenter.mainPresenterModel.themeColorStart, evenWeekPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
        ),
        color: evenWeekPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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