import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/tasks/model/TaskModel.dart';
import 'package:flutterapp/Catalog/tasks/presenter/TasksPresenter.dart';
import 'package:flutterapp/Catalog/variants/view/Item.dart';

class TasksView extends StatelessWidget{

  var _tasksPresenter;
  var _taskModel;
  TextEditingController _addGroupController = new TextEditingController();

  TasksView(TasksPresenter _tasksPresenter, TaskModel taskModel){
    _taskModel = taskModel;
    this._tasksPresenter = _tasksPresenter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
        height: 48,
        width: 200,
        child: FlatButton
        (
        shape:  RoundedRectangleBorder( borderRadius: new BorderRadius.circular(20.0)),
    color: Colors.indigo,
    child:
    Text("Добавить группу", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
    onPressed:  (){
   _showMyDialog(context);
    }
    ),)
    ));
  }


  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!

      child:  StreamBuilder(
        stream: Firestore.instance.collection("Groups").snapshots(),
        builder: (context, snapshot) {
        return AlertDialog(
          title: Text('Создание группы'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _addGroupController,
                  decoration: InputDecoration(//
                    border: OutlineInputBorder(),
                    labelText: 'Номер группы',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Подтвердить'),
              onPressed: () {
                Firestore.instance.collection("Groups").add(
                    {"group_name" : "${_addGroupController.text}",
                    "visits":1}
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ));
  }

  void _addItem(){
    _taskModel.catalogModel.groups.add(_addGroupController.text);
  }
}