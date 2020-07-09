




import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Statistics/StatisticsPeople/presenter/StatisticsPeoplePresenter.dart';
import 'package:flutterapp/Test/EvenWeek/Timetable/presenter/TimtablePresenter.dart';
import 'package:flutterapp/Test/Group/presenter/GroupPresenter.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/model/TimetableModel.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/presenter/TimetablePresenter.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StatisticsPeopleView extends StatefulWidget{
  var _statisticsPeoplePresenter;

  StatisticsPeopleView(this._statisticsPeoplePresenter);

  @override
  StatisticsPeopleViewState createState() => StatisticsPeopleViewState(_statisticsPeoplePresenter);

}
//

class StatisticsPeopleViewState extends State<StatisticsPeopleView> {
  var _statisticsPeoplePresenter;


  StatisticsPeopleViewState(this._statisticsPeoplePresenter);




  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: _statisticsPeoplePresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd, title: Text("Статистика по студентам")),
        body: new Column(
          children: <Widget>[

            new Expanded(
                child: StreamBuilder(
                    stream: Firestore.instance.collection("Students").orderBy("name").orderBy("lastname").snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder
                          (
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, int index) {
                              String text = snapshot.data.documents[index]["name"];
                              text+= " ";
                              text+=snapshot.data.documents[index]["lastname"];
                              _statisticsPeoplePresenter.statisticsPresenter.mainPresenter.mainPresenterModel.id = snapshot.data.documents[index].documentID;

                              return createContainer(text,_statisticsPeoplePresenter.statisticsPresenter.mainPresenter.mainPresenterModel.id, _statisticsPeoplePresenter, context);
                            }
                        );
                      }
                      else {
                        return Container(child: Center(child: SizedBox(
                          child: CircularProgressIndicator(
                                  backgroundColor: _statisticsPeoplePresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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


Future<Widget> createDialog(context, id, StatisticsPeoplePresenter statisticsPeoplePresenter) async {

  String group_id;
  var n = statisticsPeoplePresenter.statisticsPresenter.mainPresenter.mainPresenterModel.students_visits = await Firestore.instance.collection("Students").document(id).get()
      .then((document) {
        group_id = document.data["group_id"];
        return document.data["visits"] ;
      });

  var m = await Firestore.instance.collection("Groups").document(group_id).get()
      .then((document) {
    return document.data["visits"] ;
  });

  return AlertDialog(
    backgroundColor: Colors.white,
    title: Text("Процент посещения: "+
        "${((n / m) * 100).toInt()}" +"%",
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

Widget createContainer(String text, id,  StatisticsPeoplePresenter statisticsPeoplePresenter,BuildContext context){
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

                      future: createDialog(context,id,statisticsPeoplePresenter),
                      builder: (context, AsyncSnapshot<Widget> snapshot){
                        Widget children;
                        if (snapshot.hasData){
                          children = snapshot.data;
                        }
                        else {
                          children =
                              Center(child:SizedBox(
                                child: CircularProgressIndicator(
                                  backgroundColor: statisticsPeoplePresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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
          },),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ statisticsPeoplePresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorStart, statisticsPeoplePresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
            ),
            color: statisticsPeoplePresenter.statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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