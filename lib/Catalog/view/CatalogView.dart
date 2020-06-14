

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';





class CatalogView extends StatelessWidget{
  var _catalogPresenter;
  var _state;

  set state(value) {
    _state = value;
  }

  Row createFirstElement(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(

            children: <Widget>[Container(
              child: IconButton(
                color: Colors.redAccent,
                icon: Icon(Icons.highlight_off),
                iconSize: 30,
                onPressed: () {
                  this._catalogPresenter.goBack(context);
                },

              ),
              padding: EdgeInsets.only(left: 15),
            )
            ],

          ),
          Row(

            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[Container(child: Text(
              "50 из 600",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                 fontSize: 17
              ),

            ),

              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                border: new Border(),
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    topRight: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0)
                ),
              ),
              width: 100,
              height: 40,
            )
            ],
          ),
        ]);
  }

  Row createSecondElement(){

    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ButtonTheme(
              height: 45,
              minWidth: 120,
              child: FlatButton(
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            textColor: Colors.white,
            color: Colors.redAccent,
            splashColor: Colors.white,
            onPressed: (){

            },
            child: Text("Варианты",
            style: TextStyle(fontSize: 20)
            ),
          )),
    ButtonTheme(
    height: 45,
    minWidth: 120,
    child: FlatButton(
    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
    textColor: Colors.black,
    color: Colors.white24,
    onPressed: (){

    },
    child: Text("По заданиям",
    style: TextStyle(fontSize: 20)
    )
    ))
        ]);
  }



    CatalogView(CatalogPresenter catalogPresenter) {
      this._catalogPresenter = catalogPresenter;
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        body: Column(
            children : <Widget>[

              new Expanded(child: createFirstElement(context),
                  flex: 1),
              new Expanded(child: createSecondElement(),
                  flex: 2)
            ]
        ),
      );
    }


  }





