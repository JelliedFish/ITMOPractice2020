




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Test/Subject/model/SubjectModel.dart';
import 'package:flutterapp/Test/Subject/presenter/SubjectPresenter.dart';

class SubjectView extends StatefulWidget{
  var _subjectPresenter;
  var _subjectModel;

  SubjectView(SubjectPresenter subjectPresenter,SubjectModel subjectModel ) {
    _subjectPresenter = subjectPresenter;
    _subjectModel = subjectModel;
  }

  @override
  SubjectViewState createState() => SubjectViewState(_subjectPresenter,_subjectModel);



}

class SubjectViewState extends State<SubjectView> {
 var _subjectPresenter;
 var _subjectModel;

 var _dayTimetablePresenter;
 TextEditingController _titleController;
 TextEditingController _teacherName;
 TextEditingController _textBook;
 TextEditingController _textBookRef;
 TextEditingController _description;
 TextEditingController _homework;
 TextEditingController  _zoomRef;
 SubjectViewState(SubjectPresenter subjectPresenter, SubjectModel subjectModel) {
   _subjectPresenter = subjectPresenter;
   _subjectModel = subjectModel;
 }


 @override
 void initState() {
   super.initState();
   _titleController = TextEditingController();
   _teacherName = TextEditingController();
   _textBook = TextEditingController();
   _textBookRef = TextEditingController();
   _description = TextEditingController();
   _homework = TextEditingController();
   _zoomRef = TextEditingController();

 }

 @override
 void dispose() {
   _titleController.dispose();
   _teacherName.dispose();
   _textBook.dispose();
   _textBookRef.dispose();
   _description.dispose();
   _homework.dispose();
   _zoomRef.dispose();
   super.dispose();
 }

 @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: _subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd, title: Text("Описание")),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                new Expanded(child: Row(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: _subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
                          ),
                          onPressed: () {
                            _showMyDialog(context);
                          },
                        )
                    )
                  ],
                ),
                  flex: 1,),
              ],
            ),

   new Expanded(child:
            Container(
                padding: EdgeInsets.only(top: 20),
                child: ListView.separated(

                  itemCount: 3,
                  padding: EdgeInsets.only(top: 20,left: 12,right: 12,bottom: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return  Container(
                      height: 48,
                      child: FlatButton
                        (
                          shape:  RoundedRectangleBorder( borderRadius: new BorderRadius.circular(20.0)),
                          color: Colors.transparent,
                          child:
                          Text(whatTheData(index), style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                          onPressed:  (){
                            var info =  "It's an info";
                            showDialog(context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context){
                                  return dataWidget(context, index,_subjectModel);
                                }
                            );
                          }
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [ _subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorStart, _subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd]
                        ),
                        color:  _subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
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
            ),
     flex: 9)],
        ) );
  }


 Future<void> _showMyDialog(BuildContext context) async {
   return showDialog<void>(
     context: context,
     barrierDismissible: false, // user must tap button!
     builder: (BuildContext context) {
       return AlertDialog(
         title: Text('Создание занятия'),
         content: SingleChildScrollView(
           child: ListBody(
             children: <Widget>[
               TextField(
                 controller: _teacherName,
                 decoration: InputDecoration(//
                   border: OutlineInputBorder(),
                   labelText: 'ФИО преподавателя',
                 ),
               ),
               TextField(
                 controller: _textBook,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Название учебника',
                 ),
               ),
               TextField(
                 controller: _textBookRef,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Ссылка на учебник',
                 ),
               ),
               TextField(
                 controller: _description,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Описание занятия',
                 ),
               ),
               TextField(
                 controller: _homework,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Домашнее задание',
                 ),
               ),
               TextField(
                 controller: _zoomRef,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Ссылка на Zoom',
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
               _addItem();
               Navigator.of(context).pop();
             },
           ),
         ],
       );
     },
   );
 }

 void _addItem(){
   setState(() {

          _subjectModel.titleController = _titleController.text;
          _subjectModel.teacherName =  _teacherName.text;
          _subjectModel.textBook = _textBook.text;
           _subjectModel.textBookRef =_textBookRef.text;
          _subjectModel.description = _description.text;
          _subjectModel.homework = _homework.text;
          _subjectModel.zoomRef = _zoomRef.text;
   });
 }

}


String whatTheData(int index){

  switch(index){

    case 0:
      return "Домашнее задание";

    case 1:
      return "Описание занятия";

    case 2:
      return "Ссылка на Zoom";

  }

}


Widget dataWidget (BuildContext context , int index, SubjectModel subjectModel) {
  switch (index) {
    case 0:
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Дамашнее задание:"),
        content: Text(
            subjectModel.homework,
            textAlign: TextAlign.center),
        actions: <Widget>[
          FlatButton(
            child: Text('OK', style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    case 1:
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Описание занятия:"),
        content: Text(
            "Имя преподавателя: "+subjectModel.teacherName+"\n" +
                "Тема занятия: "+subjectModel.titleController+"\n"+
                "Описание: "+subjectModel.description+"\n"+
                "Учебник: "+subjectModel.textBook+"\n"+
                "Ссылка на учебник: "+subjectModel.textBookRef+"\n",

            textAlign: TextAlign.center),
        actions: <Widget>[
          FlatButton(
            child: Text('OK', style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );

    case 2:
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Ссылка на Zoom:"),
        content: Text(
            subjectModel.zoomRef,
            textAlign: TextAlign.center),
        actions: <Widget>[
          FlatButton(
            child: Text('OK', style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}


