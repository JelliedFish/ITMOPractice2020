


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/tasks/model/TaskModel.dart';
import 'package:flutterapp/Catalog/variants/model/VariantsModel.dart';
import 'package:flutterapp/Test/EvenWeek/Timetable/presenter/TimtablePresenter.dart';
import 'package:flutterapp/Test/EvenWeek/presenter/EvenWeekPresenter.dart';
import 'package:flutterapp/Theory/model/ProfilMathTheoryModel.dart';
import 'package:flutterapp/Theory/presenter/TheoryPresenter.dart';

class EvenWeekView extends StatelessWidget {

  var _mainPresenter;

  get mainPresenter => _mainPresenter;
  var  _evenWeekPresenter;

  EvenWeekView(EvenWeekPresenter evenWeekPresenter){
    _evenWeekPresenter = evenWeekPresenter;
    _mainPresenter = evenWeekPresenter.mainPresenter;
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
                      String info = whatTheDay(index);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> EvenTimetablePresenter(_evenWeekPresenter,info).timetableView
                      ));

                    },

                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [ _evenWeekPresenter.mainPresenter.mainPresenterModel.themeColorStart, _evenWeekPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
                    ),
                    color: _evenWeekPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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