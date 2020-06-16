



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Blitz/presenter/BlitzPresenter.dart';

class BlitzView extends StatelessWidget {

  var  _blitzPresenter;

  BlitzView(BlitzPresenter blitzPresenter){
    _blitzPresenter = blitzPresenter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: Center(
         child:  Text("It is the Blitz"),
    )));
  }
}