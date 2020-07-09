




import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Test/Subject/model/SubjectModel.dart';
import 'package:flutterapp/Test/Subject/presenter/SubjectPresenter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;



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

 TextEditingController _titleController;
 TextEditingController _date;
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
   _subjectPresenter.subjectModel.setData();
   _titleController = TextEditingController();
   _date = TextEditingController();
   _textBook = TextEditingController();
   _textBookRef = TextEditingController();
   _description = TextEditingController();
   _homework = TextEditingController();
   _zoomRef = TextEditingController();

 }

 @override
 void dispose() {
   _titleController.dispose();
   _date.dispose();
   _textBook.dispose();
   _textBookRef.dispose();
   _description.dispose();
   _homework.dispose();
   _zoomRef.dispose();
   super.dispose();
 }

 Widget createIconButton(){
   if(_subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.teacher) {
     return Container(
         alignment: Alignment.centerRight,
         child: IconButton(
           icon: Icon(
             Icons.edit,
             color: _subjectPresenter.testPresenter.mainPresenter
                 .mainPresenterModel.themeColorEnd,
           ),
           onPressed: () {
             _showMyDialog(context);
           },
         )
     );
   }
   else {
     return Container(color: Colors.transparent);
   }
 }
 @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(backgroundColor: _subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd, title: Text("Описание" +" "+ _subjectPresenter.subjectModel.subject)),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                new Expanded(child: Row(
                  children: <Widget>[
                    createIconButton()
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
                            showDialog(context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context){
                                  return  FutureBuilder<Widget>(

                                    future: dataWidget(context, index,_subjectModel),
                                    builder: (context, AsyncSnapshot<Widget> snapshot){
                                      Widget children;
                                      if (snapshot.hasData){
                                        children = snapshot.data;
                                      }
                                      else {
                                          children =
                                      Center(child:SizedBox(
                                      child: CircularProgressIndicator(
                                        backgroundColor: _subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
                                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                      width: 60,
                                      height: 60,
                                      ));
                                      }
                                      return children;
                                    }
                                  );
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

   _date..text = _subjectPresenter.subjectModel.date;
   _textBook..text = _subjectPresenter.subjectModel.textBook;
   _textBookRef..text = _subjectPresenter.subjectModel.textBookRef;
   _description..text = _subjectPresenter.subjectModel.description;
   _homework..text = _subjectPresenter.subjectModel.homework;
   _zoomRef..text = _subjectPresenter.subjectModel.zoomRef;

   return showDialog<void>(
     context: context,
     barrierDismissible: false, // user must tap button!
     builder: (BuildContext context) {
       return AlertDialog(
         title: Text('Редактирование занятия'),
         content: SingleChildScrollView(
           child: ListBody(
             children: <Widget>[
               TextField(
                 controller: _date,
                 decoration: InputDecoration(//
                   border: OutlineInputBorder(),
                   hintText: 'Время занятия',
                 ),
               ),
               TextField(
                 controller: _textBook,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Название учебника',
                 ),
               ),
               TextField(
                 controller: _textBookRef,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Ссылка на учебник',
                 ),
               ),
               TextField(
                 controller: _description,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Описание занятия',
                 ),
               ),
               TextField(
                 controller: _homework,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Домашнее задание',
                 ),
               ),
               TextField(

                 controller: _zoomRef,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   hintText: 'Ссылка на Zoom',
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

 void _addItem() async {
   setState(() {
      _subjectPresenter.subjectModel.setDataDB(context, _date.text , _textBook.text, _textBookRef.text, _description.text, _homework.text, _zoomRef.text);
      _subjectModel.titleController = _titleController.text;
   });
 }

}



Widget createDescription(text){

      return
        Container(
            padding: EdgeInsets.only(top:10),
            child :
        Container(
        color: Colors.indigo,
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          FlatButton
        (
          color: Colors.indigo ,
          child: Container(padding: EdgeInsets.only(top:8,bottom: 8),
          child :  Text(text, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),


        ),
  ]
  )));
}


Widget createDescriptionBookLink(text,link, SubjectModel subjectModel){

  return

    Container(
        padding: EdgeInsets.only(),
        child :
        Container(
            color: Colors.indigo,
            child:
            FlatButton
              (
              color: Colors.indigo ,
              child: Container(padding: EdgeInsets.only(top:8,bottom: 8),
                  child :  new RichText(
                    text: new TextSpan(
                      children: [
                        new TextSpan(
                          text:
                          'Ссылка на ресурс',
                          style: new TextStyle(
                              color: Colors
                                  .white,
                              fontSize: 15),
                          recognizer:
                          new TapGestureRecognizer()
                            ..onTap =
                                () async {
                              try {
                                launch(
                                    link
                                );
                              }
                              catch(exception){
                                FlutterToast.showToast(
                                    msg: "Ссылка не работает !",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.indigo,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }
                            },
                        ),
                      ],
                    ),
                  )

              ) ,

            )));
}


Widget createDescriptionZoomLink(text,link, SubjectModel subjectModel){

  return

    Container(
        padding: EdgeInsets.only(),
        child :
        Container(
            color: Colors.indigo,
            child:
                  FlatButton
                    (
                    color: Colors.indigo ,
                    child: Container(padding: EdgeInsets.only(top:8,bottom: 8),
                      child :  new RichText(
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text:
                              'Ссылка на ресурс',
                              style: new TextStyle(
                                  color: Colors
                                      .white,
                                  fontSize: 15),
                              recognizer:
                              new TapGestureRecognizer()
                                ..onTap =
                                    () async {
                                try {
                                  launch(
                                      link
                                  );
                                }
                                catch(exception){
                                  FlutterToast.showToast(
                                      msg: "Ссылка не работает !",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.indigo,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  );
                                }
                                  subjectModel.setVisits();
                                    },
                            ),
                          ],
                        ),
                      )

                  ) ,

            )));
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



Future<Widget> dataWidget (BuildContext context , int index, SubjectModel subjectModel) async {
  await subjectModel.setData();

  switch (index) {
    case 0:
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Домашнее задание:"),
        content:
            createDescription("Домашнее заданиие: \n\n"+subjectModel.homework),
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
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              createDescription("Имя преподавателя: \n\n"+subjectModel.teacherName),
              createDescription("Описание: \n\n"+subjectModel.description),
              createDescription("Учебник: \n\n"+subjectModel.textBook),
              createDescriptionBookLink("Ссылка на учебник: \n\n"+subjectModel.textBookRef,subjectModel.textBookRef, subjectModel),
              createDescription("Время начала: \n\n"+subjectModel.date),
            ],
          ),
        ),
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
        content:
            createDescriptionZoomLink("Ссылка на урок: \n\n"+ subjectModel.zoomRef, subjectModel.textBookRef, subjectModel),
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


