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
          new Item(0.75, "1", Color.fromRGBO(239, 87, 83, 1)),
          new Item(0.34, "2", Color.fromRGBO(131, 34, 167, 1)),
          new Item(0.34, "3", Color.fromRGBO(131, 34, 167, 1)),
          new Item(0.75, "4", Color.fromRGBO(239, 87, 83, 1)),
          new Item(0.34, "5", Color.fromRGBO(131, 34, 167, 1)),
          new Item(0.34, "6", Color.fromRGBO(131, 34, 167, 1)),
          new Item(0.75, "7", Color.fromRGBO(239, 87, 83, 1)),
          new Item(0.34, "8", Color.fromRGBO(131, 34, 167, 1)),
          new Item(0.34, "9", Color.fromRGBO(131, 34, 167, 1)),
          new Item(0.75, "10", Color.fromRGBO(239, 87, 83, 1)),
          new Item(0.34, "11", Color.fromRGBO(131, 34, 167, 1)),
          new Item(0.34, "12", Color.fromRGBO(131, 34, 167, 1)),
        ],
      ),
    );
  }
}