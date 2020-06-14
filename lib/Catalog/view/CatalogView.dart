

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';



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

    return Scaffold(
      body: Center(
        child: _catalogPresenter.mathOrRussian(_state),
      ),
    );
  }


}



