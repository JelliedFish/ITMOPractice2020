


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      padding: EdgeInsets.only(top: 40),
      child: ListView.separated(

        itemCount: _theoryPresenter.mainPresenter.mainPresenterModel.amountOfTasks,
        padding: EdgeInsets.only(top: 20,left: 12,right: 12,bottom: 10),
        itemBuilder: (BuildContext context, int index) {
          return  Container(
            child: FlatButton(
              child: Text("${index+1} Задание"),
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> TaskInfo(index,_theoryPresenter))
                );

              },

            ),
            decoration: BoxDecoration(
                color: _theoryPresenter.mainPresenter.mainPresenterModel.themeColor,
                borderRadius: BorderRadius.circular(12)
            ),


          );
        },

        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )
    ));
  }
}


class TaskInfo extends StatelessWidget {
  var _info;
  var  _theoryPresenter;


  //TODO There should be the Widget with theory except 'info'
  TaskInfo(int info, TheoryPresenter theoryPresenter){
    _info = info;
    _theoryPresenter = theoryPresenter;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Center(
        child:  Container(
          decoration: BoxDecoration(
              color: _theoryPresenter.mainPresenter.mainPresenterModel.themeColor,
              borderRadius: BorderRadius.circular(12)
          ),
        child: FlatButton(
          child: Text("This is: ${_info+1}"),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    ));
  }

}