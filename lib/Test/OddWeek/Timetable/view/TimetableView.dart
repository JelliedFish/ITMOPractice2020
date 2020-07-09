
import 'package:cloud_firestore/cloud_firestore.dart';
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
  var _oddWeekPresenter;
  var _timetablePresenter;
  var _timetableModel;
  List<Container> _subjects = [];


  OddTimetableViewState(String info, OddWeekPresenter oddWeekPresenter,
      OddTimetablePresenter timetablePresenter,
      OddTimetableModel oddTimetableModel) {
    _info = info;
    _oddWeekPresenter = oddWeekPresenter;
    _timetablePresenter = timetablePresenter;
    _timetableModel = oddTimetableModel;
  }


  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: _oddWeekPresenter.testPresenter.mainPresenter
                .mainPresenterModel.themeColorEnd, title: Text("Предметы")),
        body: createColumn()
    );
  }


  Widget createColumn() {
    if (_timetablePresenter.oddWeekPresenter.mainPresenter.mainPresenterModel
        .teacher) {
      return new Column(
        children: <Widget>[
          new TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Введите предмет, чтобы добавить',
            ),
            controller: eCtrl,
            onSubmitted: (text) {
              Firestore.instance.collection("Lessons").add(
                  {"title": "${text}",
                    "day_of_week": "${info}",
                    "group_id": "${_oddWeekPresenter.testPresenter.mainPresenter.mainPresenterModel.group_id}",
                    "hometask": "",
                    "index": "",
                    "teacher_id": "",
                    "textbook": "",
                    "textbook_ref": "",
                    "theme": "",
                    "time": "",
                    "week": "odd",
                    "zoom_link": ""});

              _oddWeekPresenter.testPresenter.testModel.week = "odd";
              eCtrl.clear();
              setState(() {});
            },
          ),
          new Expanded(

              child: StreamBuilder(
                  stream: Firestore.instance.collection("Lessons").where(
                      "day_of_week", isEqualTo: info).where("week", isEqualTo: "odd")
                      .where("group_id",
                      isEqualTo:  _oddWeekPresenter.testPresenter.mainPresenter.mainPresenterModel.group_id)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return  ListView.builder
                      (
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (_, index) {
                          if (_oddWeekPresenter.mainPresenter.mainPresenterModel.teacher){
                            return Container(
                              child :
                              Dismissible(
                                  key: UniqueKey(),
                                  background: Container(color: Colors.red),
                                  onDismissed: (direction) {
                                    Firestore.instance.collection("Lessons").document(snapshot.data.documents[index].documentID).delete();
                                  },
                                  child: createContainer("${snapshot.data.documents[index]["title"]}",
                                      _oddWeekPresenter, _)

                              ),
                            );}
                          else {
                            return
                              createContainer("${snapshot.data.documents[index]["title"]}",
                                  _oddWeekPresenter, _);
                          };
                        });
                  }))
        ],
      );
    }
    else {
      return StreamBuilder(
          stream: Firestore.instance.collection("Lessons").where(
              "day_of_week", isEqualTo: info).where("week", isEqualTo: "odd")
              .where("group_id",
              isEqualTo: _oddWeekPresenter.testPresenter.mainPresenter.mainPresenterModel.group_id)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return new ListView.builder
              (
                itemCount: snapshot.data.documents.length,
                itemBuilder: (_, index) {
                  return createContainer(
                      "${snapshot.data.documents[index]["title"]}",
                      _oddWeekPresenter, _);
                }
            );
          });
    }
  }
}


Widget createContainer(String text, OddWeekPresenter oddWeekPresenter,BuildContext context){
  return


  Container(
      width: 500,

      padding: EdgeInsets.only(top: 10),
      child:
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


    ));
}