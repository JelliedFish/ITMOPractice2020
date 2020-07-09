
import 'package:cloud_firestore/cloud_firestore.dart';
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
  var _evenWeekPresenter;
  var _timetablePresenter;
  var _timetableModel;
  List<Container> litems = [];


  final TextEditingController eCtrl = new TextEditingController();



  TimetableViewState(String info, EvenWeekPresenter evenWeekPresenter,
      EvenTimetablePresenter timetablePresenter,
      EvenTimetableModel evenTimetableModel) {
    _info = info;
    _evenWeekPresenter = evenWeekPresenter;
    _timetablePresenter = timetablePresenter;
    _timetableModel = evenTimetableModel;
  }


  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
            backgroundColor: _evenWeekPresenter.testPresenter.mainPresenter
                .mainPresenterModel.themeColorEnd, title: Text("Предметы")),
        body: createColumn()
    );
  }

  Widget createColumn() {
    if (_timetablePresenter.evenWeekPresenter.mainPresenter.mainPresenterModel
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
                  {"title" : "${text}",
                   "day_of_week" : "${info}",
                    "group_id": "${ _evenWeekPresenter.testPresenter.mainPresenter.mainPresenterModel.group_id}",
                  "hometask" : "",
                  "index": "",
                  "teacher_id": "${_evenWeekPresenter.mainPresenter.mainPresenterModel.teacher_id}",
                  "textbook": "",
                  "textbook_ref": "",
                  "theme": "",
                  "time": "",
                  "week" : "even",
                  "zoom_link" : ""});


              _evenWeekPresenter.testPresenter.testModel.week = "even";
              eCtrl.clear();
              setState(() {});
            },
          ),
          new Expanded(
              child: StreamBuilder(
                  stream: Firestore.instance.collection("Lessons").where(
                      "day_of_week", isEqualTo: info).where("week", isEqualTo: "even")
                      .where("group_id",
                      isEqualTo: _evenWeekPresenter.testPresenter.mainPresenter.mainPresenterModel.group_id)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text('Loading...');
                    return  ListView.builder
                      (
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (_, index) {
                          if (_evenWeekPresenter.mainPresenter.mainPresenterModel.teacher){
                          return Container(
                              child :
                           Dismissible(
                              key: UniqueKey(),
                              background: Container(color: Colors.red),
                              onDismissed: (direction) {
                                Firestore.instance.collection("Lessons").document(snapshot.data.documents[index].documentID).delete();
                              },
                        child: createContainer("${snapshot.data.documents[index]["title"]}",
                             _evenWeekPresenter, _)

                           ),
                          );}
                        else {
                          return
                            createContainer("${snapshot.data.documents[index]["title"]}",
                                _evenWeekPresenter, _);
                        };
                        });
                        }
                  ))
        ],
      );
    }
    else {
      return StreamBuilder(
          stream: Firestore.instance.collection("Lessons").where(
              "day_of_week", isEqualTo: info).where("week", isEqualTo: "even")
              .where("group_id",
              isEqualTo: _evenWeekPresenter.testPresenter.mainPresenter.mainPresenterModel.group_id)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return new ListView.builder
              (
                itemCount: snapshot.data.documents.length,
                itemBuilder: (_, index) {
                  return createContainer(
                      "${snapshot.data.documents[index]["title"]}",
                      _evenWeekPresenter, _);
                }
            );
          });
    }
  }
}



Widget createContainer(String text, EvenWeekPresenter evenWeekPresenter,BuildContext context){
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


    ));
}