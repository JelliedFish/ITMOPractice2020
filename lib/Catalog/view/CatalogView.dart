import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/Catalog/view/VariantItem.dart';
import 'package:flutterapp/liquid_progress_indicator/liquid_progress_indicator.dart';


class CatalogView extends StatelessWidget{
  var _catalogPresenter;
  var _state;

  set state(value) {
    _state = value;
  }




  CatalogView(CatalogPresenter catalogPresenter) {
    this._catalogPresenter = catalogPresenter;
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



