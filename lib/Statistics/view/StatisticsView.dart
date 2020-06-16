


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Statistics/presenter/StatisticsPresenter.dart';

class StatisticsView extends StatelessWidget {

  var  _statisticsPresenter;

  StatisticsView(StatisticsPresenter statisticsPresenter){
    _statisticsPresenter = statisticsPresenter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
         child: Center(
         child:Text("It is the Statistics"),
    )));
  }
}