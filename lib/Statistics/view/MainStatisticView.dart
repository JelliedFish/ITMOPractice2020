

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Statistics/presenter/StatisticsPresenter.dart';

class MainStatisticView extends StatelessWidget {

  var _statisticsPresenter;

  MainStatisticView(StatisticsPresenter statisticsPresenter) {
    _statisticsPresenter = statisticsPresenter;
  }

  @override
  build(BuildContext context){
    return Scaffold(


        body:
            Center(
              child:
        Container(
            padding: EdgeInsets.only(top: 250),
            child: ListView.separated(

              itemCount: 2,
              padding: EdgeInsets.only(top: 20,left: 12,right: 12,bottom: 10),
              itemBuilder: (BuildContext context, int index) {
                return  Container(
                  height: 48,
                  child: FlatButton
                    (
                      shape:  RoundedRectangleBorder( borderRadius: new BorderRadius.circular(20.0)),
                      color: Colors.transparent,
                      child:
                      Text(whatTheData(index), style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),

                    onPressed: (){
                        whereToGo(index, context);
                    },

                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [ _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorStart, _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
                    ),
                    color:  _statisticsPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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
        ),

    ));
  }

  String whatTheData(int index){

    switch(index){

      case 0:
        return "По студентам";

      case 1:
        return "По группам";

    }

  }

  void whereToGo(index, context){

    switch(index){

      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => _statisticsPresenter.statisticsPeoplePresenter.statisticsPeopleView));
        break;

      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => _statisticsPresenter.statisticsGroupPresenter.statisticsGroupView));
        break;

      case 2:

      case 3:

    }

  }


}
