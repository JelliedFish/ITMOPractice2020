


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
      padding: EdgeInsets.only(top: 20),
      child: ListView.separated(

        itemCount: _theoryPresenter.mainPresenter.mainPresenterModel.amountOfTasks,
        padding: EdgeInsets.only(top: 20,left: 12,right: 12,bottom: 10),
        itemBuilder: (BuildContext context, int index) {
          return  Container(
            height: 48,
            child: FlatButton(
              shape:  RoundedRectangleBorder( borderRadius: new BorderRadius.circular(20.0)),
              color: Colors.transparent,
              child: Text("${index+1} Задание", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> TaskInfo(index,_theoryPresenter))
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
              color: _theoryPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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