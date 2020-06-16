


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Theory/presenter/TheoryPresenter.dart';

class TheoryView extends StatelessWidget {

  var  _theoryPresenter;

  TheoryView(TheoryPresenter theoryPresenter){
    _theoryPresenter = theoryPresenter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
    child: Center(
     child: Text("It is the Theory"),
    )));
  }
}