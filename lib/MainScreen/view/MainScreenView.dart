import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';



class MainScreenView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomePage(),
    );
  }
}


var math = FlatButton(
  textColor: Colors.white,

  onPressed: () {
    /*...*/
  },
  child: Text(
    "Математика",
    style: TextStyle(fontSize: 27.0),
  ),
);

var russian = FlatButton(
  textColor: Colors.white,

  onPressed: () {

  },
    child: Text(
    "Русский",
    style: TextStyle(fontSize: 27.0),
  ),
);

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
      return Scaffold(

//
          body: Container(

                decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.deepPurple,Colors.redAccent])),
            child: Center(
              child : Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [math,russian],
              ),
            ),
              ),
          ),
          );
  }
}






