import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/tasks/presenter/TasksPresenter.dart';
import 'package:flutterapp/Catalog/variants/view/Item.dart';

class TasksView extends StatelessWidget{

  var _tasksPresenter;

  TasksView(TasksPresenter _tasksPresenter){
    this._tasksPresenter = _tasksPresenter;
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

        ],
      ),
    );
  }
}