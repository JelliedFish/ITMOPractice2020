
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/variants/presenter/VariantsPresenter.dart';
import 'package:flutterapp/Catalog/variants/view/Item.dart';

class VariantsView extends StatelessWidget{

  var _variantsPresenter;

  VariantsView(VariantsPresenter _variantsPresenter){
    this._variantsPresenter = _variantsPresenter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildGridView(context),
    );
  }

  Widget buildGridView(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: GridView.count(
        crossAxisCount: 3,
        children: <Widget>[
          new Item(0.75, "M32031", Color.fromRGBO(239, 87, 83, 1), _variantsPresenter.catalogPresenter),
          new Item(0.34, "M3102", Color.fromRGBO(131, 34, 167, 1), _variantsPresenter.catalogPresenter),
          new Item(0.34, "K2308", Color.fromRGBO(131, 34, 167, 1), _variantsPresenter.catalogPresenter),
          new Item(0.75, "M32031", Color.fromRGBO(239, 87, 83, 1), _variantsPresenter.catalogPresenter),
          new Item(0.34, "M3102", Color.fromRGBO(131, 34, 167, 1), _variantsPresenter.catalogPresenter),
          new Item(0.34, "K2308", Color.fromRGBO(131, 34, 167, 1), _variantsPresenter.catalogPresenter),
          new Item(0.75, "M32031", Color.fromRGBO(239, 87, 83, 1), _variantsPresenter.catalogPresenter),
          new Item(0.34, "M3102", Color.fromRGBO(131, 34, 167, 1), _variantsPresenter.catalogPresenter),
          new Item(0.34, "K2308", Color.fromRGBO(131, 34, 167, 1), _variantsPresenter.catalogPresenter),
          new Item(0.75, "M32031", Color.fromRGBO(239, 87, 83, 1), _variantsPresenter.catalogPresenter),
          new Item(0.34, "M3102", Color.fromRGBO(131, 34, 167, 1), _variantsPresenter.catalogPresenter),
          new Item(0.34, "K2308", Color.fromRGBO(131, 34, 167, 1), _variantsPresenter.catalogPresenter),
          new Item(0.75, "M32031", Color.fromRGBO(239, 87, 83, 1), _variantsPresenter.catalogPresenter),
          new Item(0.34, "M3102", Color.fromRGBO(131, 34, 167, 1), _variantsPresenter.catalogPresenter),
          new Item(0.34, "K2308", Color.fromRGBO(131, 34, 167, 1), _variantsPresenter.catalogPresenter),
        ],
      ),
    );
  }
}