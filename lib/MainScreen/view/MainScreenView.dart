import 'package:flutter/material.dart';
import 'package:flutterapp/MainScreen/presenter/MainScreenPresenter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';



class MainScreenView extends StatelessWidget {
  var _mainScreenPresenter;

  MainScreenView.presenter(MainScreenPresenter mainScreenPresenter){
    this._mainScreenPresenter = mainScreenPresenter;
  }
  MainScreenView(){}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomePage(_mainScreenPresenter),
    );
  }
}





class HomePage extends MainScreenView {


  HomePage(MainScreenPresenter mainScreenPresenter){
    this._mainScreenPresenter = mainScreenPresenter;
  }

  @override
  Widget build(BuildContext context){
      return Scaffold(

//
          body: Container(

                decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.redAccent,Colors.indigo])),
            child: Center(
              child : Container(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [FlatButton(
                textColor: Colors.white,

                onPressed: () {
                  _mainScreenPresenter.goToCatalogRussian(context);
                },
                child: Text(
                  "Студент",
                  style: TextStyle(fontSize: 27.0),
                ),
              )
                ,FlatButton(
                    textColor: Colors.white,

                    onPressed: () {
                        _mainScreenPresenter.goToCatalogMath(context);
                    },
                    child: Text(
                      "Преподаватель",
                      style: TextStyle(fontSize: 27.0),
                    ),
                  )],
              ),
            ),
              ),
          ),
          );
  }
}






