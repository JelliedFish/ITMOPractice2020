


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/tasks/model/ProfilMathTaskModel.dart';
import 'package:flutterapp/Catalog/variants/model/ProfilMathVariantsModel.dart';
import 'package:flutterapp/DataBase/DataBase.dart';
import 'package:flutterapp/Test/EvenWeek/presenter/EvenWeekPresenter.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';
import 'package:flutterapp/Test/presenter/TestPresenter.dart';
import 'package:flutterapp/Theory/model/ProfilMathTheoryModel.dart';
import 'package:flutterapp/Theory/presenter/TheoryPresenter.dart';

class OddWeekView extends StatelessWidget {

  var _mainPresenter;

  get mainPresenter => _mainPresenter;
  var  _oddWeekPresenter;

  OddWeekView(OddWeekPresenter oddWeekPresenter){
    _oddWeekPresenter = oddWeekPresenter;
    _mainPresenter = oddWeekPresenter.mainPresenter;;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body: Container(
            padding: EdgeInsets.only(top: 20),
            child: ListView.separated(

              itemCount: 7,
              padding: EdgeInsets.only(top: 20,left: 12,right: 12,bottom: 10),
              itemBuilder: (BuildContext context, int index) {
                return  Container(
                  height: 48,
                  child: FlatButton
                    (
                    shape:  RoundedRectangleBorder( borderRadius: new BorderRadius.circular(20.0)),
                    color: Colors.transparent,
                    child:
                    Text(whatTheDay(index), style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                    onPressed:  (){
                      TheoryModel tm = new TheoryModel(index+1, "It's a theory of ${index+1} task ! ");
                      var info =  "It's an info";
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> TaskInfo( info,_oddWeekPresenter))
                      );

                    },

                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [ _oddWeekPresenter.mainPresenter.mainPresenterModel.themeColorStart, _oddWeekPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
                    ),
                    color: _oddWeekPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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
              },

              separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent, height: 20),
            )
        ));
  }
}

class TaskInfo extends StatefulWidget{
  var _info;
  var  _oddWeekPresenter;

  TaskInfo(String info, OddWeekPresenter oddWeekPresenter){
    _info = info;
    _oddWeekPresenter = oddWeekPresenter;
  }

  @override
  _TaskInfo createState() => _TaskInfo(_info, _oddWeekPresenter);
}
//

class _TaskInfo extends State<TaskInfo> {
  var _info;
  var  _oddWeekPresenter;


  _TaskInfo(this._info, this._oddWeekPresenter);

  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(),
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

String whatTheDay(int index){
  switch(index){

    case 0:
      return "Понедельник";
      break;

    case 1:
      return "Вторник";
      break;


    case 2:
      return "Среда";
      break;


    case 3:
      return "Четверг";
      break;


    case 4:
      return "Пятница";
      break;


    case 5:
      return "Суббота";
      break;


    case 6:
      return "Воскресение";
      break;

  }
}