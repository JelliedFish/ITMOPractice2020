import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/MainScreen/presenter/MainScreenPresenter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';




class MainScreenView extends StatelessWidget {
  var _mainScreenPresenter;



  MainScreenView.presenter(MainScreenPresenter mainScreenPresenter){
    this._mainScreenPresenter = mainScreenPresenter;
  }
  MainScreenView(){}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomePage(_mainScreenPresenter),
    );
  }
}



class HomePage extends StatefulWidget {
  var _mainScreenPresenter;

  HomePage(MainScreenPresenter mainScreenPresenter) {
    this._mainScreenPresenter = mainScreenPresenter;
  }

  @override
  State<StatefulWidget> createState() => HomePageState(_mainScreenPresenter);
}

class HomePageState extends State<HomePage> {

  TextEditingController _addNameController = new TextEditingController();
  TextEditingController _addLastNameController = new TextEditingController();

  var _mainScreenPresenter;

  HomePageState(MainScreenPresenter mainScreenPresenter) {
    this._mainScreenPresenter = mainScreenPresenter;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ Column(

            children: <Widget>[

              new Expanded(
                child: Container(
                    width: 250,
                    height: 250,
                    child: Image(
                      image: AssetImage('assets/ITMO_University.png'),
                    )),
                flex: 6,
              ),

              new Expanded(
                  child: Container(

                      child: new Column(
                          children: [
                            Container(
                              child: Text("Выберите роль: ",
                                style: TextStyle(fontSize: 20.0, color: Colors
                                    .black),),
                            ),

                            Container(
                              height: 10,
                              color: Colors.transparent,),

                            Container(
                                width: 250,
                                height: 40,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          20.0)),
                                  color: Colors.indigo,

                                  onPressed: () {
                                    _showMyDialog(context, 0);
                                  },
                                  child: Text(
                                    "Студент",
                                    style: TextStyle(
                                        fontSize: 23.0, color: Colors.white),
                                  ),
                                )),
                            Container(
                              height: 10,
                              color: Colors.transparent,
                            ),
                            Container(
                              width: 250,
                              height: 40,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(
                                        20.0)),
                                color: const Color(0xffed1244),


                                onPressed: () {
                                  _showMyDialog(context, 1);
                                },
                                child: Text(
                                  "Преподаватель",
                                  style: TextStyle(
                                      fontSize: 23.0, color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                                color: Colors.transparent,
                              height: 10,
                            ),
                            Container(
                              width: 350,
                              height: 20,
                              child: FlatButton(

                                color: Colors.transparent,


                                onPressed: () {
                                  _showMyDialog(context, 2);
                                },
                                child: Text(
                                  "Регистрация для преподавателя",
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ])),
                  flex: 4
              )
            ],

          )
          ]),

    );
  }

  Future<void> _showMyDialog(BuildContext context, index) async {

    switch (index){

      case 0:

    }
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!

        child: AlertDialog(
          title: Text(whatTheText(index), style: TextStyle(fontSize: 20)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: _addNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Имя',
                  ),
                ),

                TextField(
                  controller: _addLastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Фамилия',
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
              onPressed: () async {
                switch (index) {
                  case 0:
                   await Firestore.instance.collection("Students")
                        .where(
                        "name", isEqualTo: _addNameController.text).where(
                        "lastname", isEqualTo: _addLastNameController.text)
                        .getDocuments()
                        .then((querySnapshot) {
                      querySnapshot.documents.forEach((result) {
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.name =
                        result["name"];
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.students_visits =
                        result["visits"];
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.lastname =
                        result["lastname"];
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.group_id = result["group_id"];
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.id = result.documentID;
                      });
                    });

                    if ((  _mainScreenPresenter.mainPresenter.mainPresenterModel.name != null) && (_mainScreenPresenter.mainPresenter.mainPresenterModel.lastname != null)
                        && (_mainScreenPresenter.mainPresenter.mainPresenterModel.id != null) && (_mainScreenPresenter.mainPresenter.mainPresenterModel.group_id != null)) {
                      Navigator.of(context).pop();
                      _mainScreenPresenter.goToCatalogStudent(context, _mainScreenPresenter.mainPresenter.mainPresenterModel.group_id);
                }
                    else {
                      Navigator.of(context).pop();
                      FlutterToast.showToast(
                          msg: "Такого пользователя нет !",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.indigo,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                    break;

                  case 1:
                    await Firestore.instance.collection("Teachers")
                        .where(
                        "name", isEqualTo: _addNameController.text).where(
                        "lastname", isEqualTo: _addLastNameController.text)
                        .getDocuments()
                        .then((querySnapshot) {
                      querySnapshot.documents.forEach((result) {
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.name =
                        result["name"];
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.lastname =
                        result["lastname"];
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.id = result.documentID;
                      });
                    });


                    if (( _mainScreenPresenter.mainPresenter.mainPresenterModel.lastname != null) && ( _mainScreenPresenter.mainPresenter.mainPresenterModel.name != null) &&(_mainScreenPresenter.mainPresenter.mainPresenterModel.id != null)){
                      _mainScreenPresenter.goToCatalogTeacher(context, _mainScreenPresenter.mainPresenter.mainPresenterModel.id);
                      }
                    else {
                      Navigator.of(context).pop();
                      FlutterToast.showToast(
                          msg: "Такого пользователя нет !",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor:const Color(0xffed1244),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }

                    break;

                  case 2:

                    await Firestore.instance.collection("Teachers")
                        .where(
                        "name", isEqualTo: _addNameController.text).where(
                        "lastname", isEqualTo: _addLastNameController.text)
                        .getDocuments()
                        .then((querySnapshot) {
                      querySnapshot.documents.forEach((result) {
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.name =
                        result["name"];
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.lastname =
                        result["lastname"];
                        _mainScreenPresenter.mainPresenter.mainPresenterModel.id = result.documentID;
                      });
                    });


                    if (( _mainScreenPresenter.mainPresenter.mainPresenterModel.lastname == null) || ( _mainScreenPresenter.mainPresenter.mainPresenterModel.name == null) || (_mainScreenPresenter.mainPresenter.mainPresenterModel.id == null)){
                      await Firestore.instance.collection("Teachers").add({"name":"${_addNameController.text}",
                        "lastname":"${_addLastNameController.text}"
                      }
                      );
                      Navigator.of(context).pop();
                      FlutterToast.showToast(
                          msg: "Регистрация прошла успешно!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: const Color(0xffed1244),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                    else {
                      Navigator.of(context).pop();
                      FlutterToast.showToast(
                          msg: "Такой пользователь уже есть!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: const Color(0xffed1244),
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }

                    break;
                }
              },
            ),
          ],
        ));
  }
  
  
  String whatTheText(index){
    switch(index){
      case 0:
          return "Авторизация";
          case 1:
          return "Авторизация";
          case 2:
          return "Регистрация";
    }
  }


}


class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  static const _appTitle = 'Todo List';
  final todos = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_appTitle),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = todos[index];

                  return Dismissible(
                    key: Key('$todo$index'),
                    onDismissed: (direction) => todos.removeAt(index),
                    child: ListTile(title: Text(todo)),
                    background: Container(color: Colors.red),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              todos.add(controller.text);
              controller.clear();
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
