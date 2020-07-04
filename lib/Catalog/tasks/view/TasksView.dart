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

      body: Center(
        child: Container(
          padding: EdgeInsets.only() ,
        child :  Container(
          padding: EdgeInsets.only(top: 50),
            child : TextFormField(

              autofocus: false,
            decoration: InputDecoration(
                icon: Icon(Icons.group),
                labelText: 'Введите номер группы'
            ),
          ),
          width: 150,
          height: 70,
        ),
      ))
    );
  }
}