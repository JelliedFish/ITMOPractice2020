
import 'package:cloud_firestore/cloud_firestore.dart';
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
        child: StreamBuilder(
          stream: Firestore.instance.collection("Groups").snapshots(),
          builder: (context, snapshot){
            if (!snapshot.hasData) return const Text('Loading...');
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (_, index){
                  return Center(
                      child: GestureDetector(

                        onLongPress: (){
                          Firestore.instance.collection("Groups").document(snapshot.data.documents[index].documentID).delete();
                        },
                          onTap: () {
                            _variantsPresenter.catalogPresenter.setGroupId(snapshot.data.documents[index].documentID);
                            _variantsPresenter.catalogPresenter.mainPresenter.mainPresenterModel.visits = snapshot.data.documents[index]["visits"];
                            _variantsPresenter.catalogPresenter.mainPresenter.mainPresenterModel.group_id = snapshot.data.documents[index].documentID;
                            _variantsPresenter.catalogPresenter.goToTest(context);
                          },
                          child: Container(
                              height: 100,
                              width: 100,
                              child: Card(
                                  color:  _variantsPresenter.catalogPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(child: Text(
                                    "${snapshot.data.documents[index]["group_name"]}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))))));
                });
          },
        )
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