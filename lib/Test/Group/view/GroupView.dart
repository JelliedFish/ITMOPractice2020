
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Test/EvenWeek/Timetable/presenter/TimtablePresenter.dart';
import 'package:flutterapp/Test/Group/presenter/GroupPresenter.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/model/TimetableModel.dart';
import 'package:flutterapp/Test/OddWeek/Timetable/presenter/TimetablePresenter.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';
import 'package:fluttertoast/fluttertoast.dart';
////
class GroupView extends StatefulWidget{
  var _groupPresenter;

  GroupView(this._groupPresenter);

  @override
  GroupViewState createState() => GroupViewState(_groupPresenter);

}
//

class GroupViewState extends State<GroupView> {
  var _groupPresenter;


  GroupViewState(this._groupPresenter);

  final TextEditingController eCtrl = new TextEditingController();






  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: _groupPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd, title: Text("Студенты")),
        body: new Column(
          children: <Widget>[
            new TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Введите Имя Фамилию, чтобы добавить',
              ),
              controller: eCtrl,
              onSubmitted: (text) {

                List<String> myList = text.split(" ");
                var name = myList[0];
                var lastname = myList[1];
                addStudent(name, lastname);
                eCtrl.clear();
                setState(() {});
              }),
            new Expanded(
                child: StreamBuilder(
        stream: Firestore.instance.collection("Students").where("group_id", isEqualTo: _groupPresenter.testPresenter.mainPresenter.mainPresenterModel.group_id).snapshots(),
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             return  ListView.builder
               (
                 itemCount: snapshot.data.documents.length,
                 itemBuilder: (_, index) {
                   if (_groupPresenter.testPresenter.mainPresenter.mainPresenterModel.teacher){
                     return Container(
                       child :
                       Dismissible(
                           key: UniqueKey(),
                           background: Container(color: Colors.red),
                           onDismissed: (direction) {
                             Firestore.instance.collection("Student").document(snapshot.data.documents[index].documentID).delete();
                           },
                           child: createContainer("${snapshot.data.documents[index]["name"]} ${snapshot.data.documents[index]["lastname"]}",
                               _groupPresenter, _)

                       ),
                     );}
                   else {
                     return
                       createContainer("${snapshot.data.documents[index]["name"]} ${snapshot.data.documents[index]["lastname"]}",
                           _groupPresenter, _);
                   }
                 });
           }
           else {
             return Container(child: Center(child: SizedBox(
               child: CircularProgressIndicator(),
               width: 60,
               height: 60,
             ),));
           }
         }
                ))
          ],
        )
    );
  }
  Future<void> addStudent(name, lastname) async {
    var state = false;
    try  {
      await Firestore.instance.collection("Students").where(
          "name", isEqualTo: name).where(
          "lastname", isEqualTo: lastname)
          .getDocuments()
          .then(
              (value)
          {
            if (value.documents.length != 0){
              state = true;
            }
          });
      if (!state) {
        await Firestore.instance.collection("Students").add(
            {"name": "${name}",
              "lastname": "${lastname}",
              "visits": 0,
              "group_id": "${_groupPresenter.testPresenter
                  .mainPresenter.mainPresenterModel.group_id}"});
      }
      else {
        FlutterToast.showToast(
            msg: "Этот студент уже в группе !",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
    catch(exception){
      FlutterToast.showToast(
          msg: "Неверный формат ввода !",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  }


Widget createContainer(String text, GroupPresenter groupPresenter,BuildContext context){
  return

    Container(
        width: 500,

        padding: EdgeInsets.only(top: 10),
  child:
    Container(
      height: 48,
      child: FlatButton
        (
        shape:  RoundedRectangleBorder( borderRadius: new BorderRadius.circular(20.0)),
        color: Colors.transparent,
        child:
        Text(text, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)
      )),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ groupPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorStart, groupPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
        ),
        color: groupPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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
    )

    );
}