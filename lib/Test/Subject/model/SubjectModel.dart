


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SubjectModel
{

  var _subject;
  var _subjectPresenter;
  int _visits;
  

  get subject => _subject;

  set subject(value) {
    _subject = value;
  }

  var  _titleController;
  var _date;
  var _teacherName;
  var _textBook;
  var _textBookRef;
  var _description;
  var _homework;
  var _zoomRef;

  get zoomRef => _zoomRef;

  set zoomRef(value) {
    if (value != "") {
      _zoomRef = value;
    }
  }

  set titleController(value) {
    if (value != "") {
      _titleController = value;
    }
  }

  SubjectModel(this._titleController, this._teacherName, this._textBook,
      this._textBookRef, this._description, this._homework, this._zoomRef);


  SubjectModel.empty(String subject, this._subjectPresenter) {
    _subject = subject;
    _titleController = "Тема не задана";
    _teacherName = "ФИО неизвестно";
    _textBook = "Учебика нет";
    _textBookRef = "Ссылки на учебник нет";
    _description = "Описание отсутствует";
    _homework = "Домашнее задание отсутствует";
    _zoomRef = "Ссылка на Zoom не задана";
    date = "Дата неизвестна";
   }

  get homework => _homework;

  get description => _description;

  get textBookRef => _textBookRef;

  get textBook => _textBook;

  get teacherName => _teacherName;

  get titleController => _titleController;

  set teacherName(value) {
    if (value != "") {
      _teacherName = value;
    }
  }

  set homework(value) {
    if (value != "") {
      _homework = value;
    }
  }

  set description(value) {
    if (value != "") {
      _description = value;
    }
  }

  set textBookRef(value) {
    if (value != "") {
      _textBookRef = value;
    }
  }

  
  Future<void> setData() async {


    _titleController = "Тема не задана";
    _teacherName = "ФИО неизвестно";
    _textBook = "Учебика нет";
    _textBookRef = "Ссылки на учебник нет";
    _description = "Описание отсутствует";
    _homework = "Домашнее задание отсутствует";
    _zoomRef = "Ссылка на Zoom не задана";
    date = "Дата неизвестна";

        await Firestore.instance.collection("Lessons").where(
            "day_of_week", isEqualTo: _subjectPresenter.testPresenter.testModel.dayOfTheWeek).where("week", isEqualTo: _subjectPresenter.testPresenter.testModel.week)
            .where("group_id",
            isEqualTo: _subjectPresenter.testPresenter.testModel.group).where("title", isEqualTo: subject )
            .getDocuments().then((querySnapshot) {
          querySnapshot.documents.forEach((result) {
            homework = result["hometask"];
            description = result["theme"];
            textBook = result["textbook"];
            textBookRef = result["textbook_ref"];
            zoomRef = result["zoom_link"];
            teacherName = result["teacher_id"];
            date = result["time"];

          });

        });





         await Firestore.instance.collection("Teachers").document(teacherName).get()
            .then((document) {
              try {
                _teacherName = document.data["name"];
                _teacherName+= " ";
                _teacherName+= document.data["lastname"];
              }
              catch (exception){
                _teacherName = "ФИО неизвестно";
              }
        });
}


  Future<void> setDataDB(BuildContext context, var date, var textBook, var textBookRef, var description, var homework, var zoomRef) async {


       await Firestore.instance.collection("Lessons").where(
            "day_of_week", isEqualTo: _subjectPresenter.testPresenter.testModel.dayOfTheWeek).where("week", isEqualTo: _subjectPresenter.testPresenter.testModel.week)
            .where("group_id",
            isEqualTo: _subjectPresenter.testPresenter.testModel.group).where("title", isEqualTo: subject ).getDocuments().then((value) {
            try {
             Firestore.instance
                 .collection('Lessons')
                 .document(value.documents[0].documentID)
                 .updateData( {
               "hometask": "${homework}",
               "index": "",
               "date": "${date}",
               "textbook": "${textBook}",
               "textbook_ref": "${textBookRef}",
               "theme": "${description}",
               "time": "",
               "zoom_link": "${zoomRef}" });
            } catch (e) {
             print(e.toString());
           }
         });

  }


  Future<void> setVisits() async {

    if (_subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.teacher) {

      _visits = await Firestore.instance.collection("Groups").document(_subjectPresenter.testPresenter.testModel.group).get()
          .then((document) {
        return document.data["visits"] ;
      });

      _visits++;
      await Firestore.instance.collection("Groups").document(_subjectPresenter.testPresenter.testModel.group).updateData({"visits": _visits});

    }
    else {

      _visits = await Firestore.instance.collection("Students").document(_subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.id).get()
          .then((document) {
        return document.data["visits"] ;
      });

      _visits++;
      await Firestore.instance.collection("Students").document(_subjectPresenter.testPresenter.mainPresenter.mainPresenterModel.id).updateData({"visits": _visits});
    }
  }


  
  set textBook(value) {
    if (value != "") {
      _textBook = value;
    }
  }

  get subjectPresenter => _subjectPresenter;

  set subjectPresenter(value) {
    _subjectPresenter = value;
  }

  get date => _date;

  set date(value) {
    if (value != "") {
      _date = value;
    }
  }

  get visits => _visits;

  set visits(value) {
    _visits = value;
  }
}