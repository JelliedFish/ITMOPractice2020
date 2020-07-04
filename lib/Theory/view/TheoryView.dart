


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/tasks/model/TaskModel.dart';
import 'package:flutterapp/Catalog/variants/model/VariantsModel.dart';
import 'package:flutterapp/DataBase/DataBase.dart';
import 'package:flutterapp/Theory/model/ProfilMathTheoryModel.dart';
import 'package:flutterapp/Theory/presenter/TheoryPresenter.dart';

class TheoryView extends StatelessWidget {

  var  _theoryPresenter;

  TheoryView(TheoryPresenter theoryPresenter){
    _theoryPresenter = theoryPresenter;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
      padding: EdgeInsets.only(top: 20),
      child: ListView.separated(

        itemCount: _theoryPresenter.mainPresenter.mainPresenterModel.amountOfTasks,
        padding: EdgeInsets.only(top: 20,left: 12,right: 12,bottom: 10),
        itemBuilder: (BuildContext context, int index) {
          return  Container(
            height: 48,
            child: FlatButton
            (
              shape:  RoundedRectangleBorder( borderRadius: new BorderRadius.circular(20.0)),
              color: Colors.transparent,
              child:
              Text("${index+1} Задание", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              onPressed:  (){
                TheoryModel tm = new TheoryModel(index+1, "It's a theory of ${index+1} task ! ");
                DBClient.db.insertTheory(tm);
                  //TaskModel tm = new TaskModel(1, "first_task", "it's image", 1, 1);
                  //DBClient.db.insertTask(tm);
              //VariantModel vm = new VariantModel(1,["Hey","Hey","Hey","Hey","Hey","Hey","Hey","Hey","Hey","Hey","Hey","Hey"],["Hey","Hey","Hey","Hey","Hey","Hey","Hey","Hey","Hey","Hey","Hey","Hey"], 1, 1);
                //DBClient.db.updateVariant(vm);
                var info =  DBClient.db.getTheoryByID(index+1);
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> TaskInfo( info,_theoryPresenter))
                );

              },

            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [ _theoryPresenter.mainPresenter.mainPresenterModel.themeColorStart, _theoryPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
                ),
                color: _theoryPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
            BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
          ],
            ),


          );
        },

        separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent, height: 20),
      )
    ));
  }
}

class TaskInfo extends StatefulWidget{
  var _info;
  var  _theoryPresenter;

  TaskInfo(Future<dynamic> info, TheoryPresenter theoryPresenter){
    _info = info;
    _theoryPresenter = theoryPresenter;
  }

  @override
  _TaskInfo createState() => _TaskInfo(_info, _theoryPresenter);
}


class _TaskInfo extends State<TaskInfo> {
  var _info;
  var  _theoryPresenter;


  //TODO There should be the Widget with theory except 'info'
  _TaskInfo(Future<dynamic> info, TheoryPresenter theoryPresenter){
    _info = getInfo(info);
    _theoryPresenter = theoryPresenter;
  }

  Future<TheoryModel> getInfo(Future<dynamic> info) async {
    return await info;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Center(
        child: FutureBuilder<TheoryModel>(future: _info,
            builder: (BuildContext context, AsyncSnapshot<TheoryModel> snapshot) {
          Widget w;
          if (snapshot.hasData) {
            w = Container(
              decoration: BoxDecoration(
                  color: _theoryPresenter.mainPresenter.mainPresenterModel
                      .themeColorEnd,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: FlatButton(
                child: Text("This is:"+ snapshot.data.text),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
          }
          else {
            w =  SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            );
          }

          return Center(
            child: w,
          );
        })));
  }

}