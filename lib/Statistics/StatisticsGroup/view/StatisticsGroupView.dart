




import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Statistics/StatisticsGroup/presenter/StatisticsGroupPresenter.dart';
import 'package:flutterapp/Statistics/StatisticsPeople/presenter/StatisticsPeoplePresenter.dart';
import 'package:flutterapp/Test/EvenWeek/Timetable/presenter/TimtablePresenter.dart';
import 'package:flutterapp/Test/Group/presenter/GroupPresenter.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/model/TimetableModel.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/presenter/TimetablePresenter.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StatisticsGroupView extends StatefulWidget{
  var _statisticsGroupPresenter;

  StatisticsGroupView(this._statisticsGroupPresenter);

  @override
  StatisticsGroupViewState createState() => StatisticsGroupViewState(_statisticsGroupPresenter);

}
//

class StatisticsGroupViewState extends State<StatisticsGroupView> {
  var _statisticsGroupPresenter;


  StatisticsGroupViewState(this._statisticsGroupPresenter);




  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: _statisticsGroupPresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd, title: Text("Статистика по группам")),
        body: new Column(
          children: <Widget>[

            new Expanded(
                child: StreamBuilder(
                    stream: Firestore.instance.collection("Groups").orderBy("group_name").snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder
                          (
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, int index) {
                              String text = snapshot.data.documents[index]["group_name"];
                              var id = _statisticsGroupPresenter.statisticsPresenter.mainPresenter.mainPresenterModel.group_id = snapshot.data.documents[index].documentID;

                              return createContainer(text,id, _statisticsGroupPresenter, context);
                            }
                        );
                      }
                      else {
                        return Container(child: Center(child: SizedBox(
                          child: CircularProgressIndicator(
                            backgroundColor: _statisticsGroupPresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
                            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                          width: 60,
                          height: 60,
                        ),));
                      }
                    }
                ))
          ],
        )
    );
  }

}

Future<Widget> createDialog(context,id, StatisticsGroupPresenter statisticsGroupPresenter) async {
  String group_id;
  var n =
  statisticsGroupPresenter.statisticsPresenter.mainPresenter.mainPresenterModel
      .visits = await Firestore.instance.collection("Groups").document(id).get()
      .then((document) {
    return document.data["visits"];
  });

  var sum = 0;
  var length = 1;
  await Firestore.instance.collection("Students").where(
      "group_id", isEqualTo: id).getDocuments()
      .then((querySnapshot) {
    length = querySnapshot.documents.length;
    querySnapshot.documents.forEach((result) {
      sum += result.data["visits"];
    });
  });

  if (length == 0) {
    return AlertDialog(
      backgroundColor: Colors.white,

      title: Text("В этой группе нет студентов !",
          textAlign: TextAlign.center),
      actions: <Widget>[
        FlatButton(
          child: Text('OK', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
  else {
    var m = sum / length;
    return AlertDialog(
      backgroundColor: Colors.white,

      title: Text("Процент посещения: " + "${((m / n) * 100).toInt()}" + "%",
          textAlign: TextAlign.center),
      actions: <Widget>[
        FlatButton(
          child: Text('OK', style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}


Widget createContainer(String text, id ,StatisticsGroupPresenter statisticsGroupPresenter,BuildContext context){
  return

    Container(
        padding: EdgeInsets.only(top: 10),
        child:
        Container(
          height: 48,
          child: FlatButton
            (
              shape:  RoundedRectangleBorder( borderRadius: new BorderRadius.circular(20.0)),
              color: Colors.transparent,
              child:
              Text(text, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)
              ),
            onPressed: (){
              showDialog(context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context){
                    return  FutureBuilder<Widget>(

                        future: createDialog(context,id,statisticsGroupPresenter),
                        builder: (context, AsyncSnapshot<Widget> snapshot){
                          Widget children;
                          if (snapshot.hasData){
                            children = snapshot.data;
                          }
                          else {
                            children =
                                Center(child:SizedBox(
                                  child: CircularProgressIndicator(
                                    backgroundColor: statisticsGroupPresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
                                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                  width: 60,
                                  height: 60,
                                ));
                          }
                          return children;
                        }
                    );
                  }
              );
            },
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ statisticsGroupPresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorStart, statisticsGroupPresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
            ),
            color: statisticsGroupPresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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
        )

    );
}