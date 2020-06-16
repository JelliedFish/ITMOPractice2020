

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/Catalog/view/VariantItem.dart';
import 'package:flutterapp/liquid_progress_indicator/liquid_progress_indicator.dart';




class CatalogView extends StatelessWidget{
  var _catalogPresenter;


  Row createFirstElement(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(

            children: <Widget>[Container(
              child: IconButton(
                color: _catalogPresenter.catalogModel.color,
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
              _catalogPresenter.catalogModel.amountOfAnswers,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                 fontSize: 17
              ),

            ),

              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                color: _catalogPresenter.catalogModel.color,
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
            color: _catalogPresenter.catalogModel.color,
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
  @override
  Widget build(BuildContext context){
    var variants = <Widget>[LiquidCircularProgressIndicator(
      value: 0.2,
      valueColor: AlwaysStoppedAnimation(Color(0xFFB0AB)),
      backgroundColor: Color(0xD5D4D3),
      direction: Axis.vertical,
    ), LiquidCircularProgressIndicator(
      value: 0.5,
      valueColor: AlwaysStoppedAnimation(Color(0xFFB0AB)),
      backgroundColor: Color(0xD5D4D3),
      direction: Axis.vertical,
    )];
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[new VariantItem(0.75, Color.fromRGBO(239, 87, 83, 1)),
        new VariantItem(0.34, Color.fromRGBO(131, 34, 167, 1)),
        ],
      ),
    );
  }

  Widget buildGridView(BuildContext context){

    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(100, (index){
          return Center(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }),
      ),
    );
  }


  }





