
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/variants/model/VariantsModel.dart';
import 'package:flutterapp/Catalog/variants/presenter/VariantsPresenter.dart';
import 'package:flutterapp/Catalog/variants/view/Item.dart';

class VariantsView extends StatelessWidget{

  var _variantsPresenter;
  var _variantsModel;

  VariantsView(VariantsPresenter _variantsPresenter, VariantsModel variantsModel){
    _variantsModel = variantsModel;
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
        children: createWidgets()
      ),
    );
  }


  List<Widget> createWidgets(){
    List<Widget> widgets = [];
    for (var text in _variantsModel.catalogModel.groups){
      widgets.add(new Item(text, _variantsPresenter.catalogPresenter.mainPresenter.mainPresenterModel.themeColorEnd, _variantsPresenter.catalogPresenter));
    }
    return widgets;
  }
}