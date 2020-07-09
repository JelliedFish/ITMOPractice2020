import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/MainPresenter/MainPresenter.dart';
import 'package:flutterapp/Test/EvenWeek/presenter/EvenWeekPresenter.dart';
import 'package:flutterapp/Test/Group/presenter/GroupPresenter.dart';
import 'package:flutterapp/Test/OddWeek/presenter/OddWeekPresenter.dart';
import 'package:flutterapp/Test/Subject/presenter/SubjectPresenter.dart';
import 'package:flutterapp/Test/model/TestModel.dart';
import 'package:flutterapp/Test/view/TestView.dart';

class TestPresenter{
  var _testView;
  var _mainPresenter;
  var _evenWeekPresenter;
  var _oddWeekPresenter;
  var _subjectPresenter;
  var _groupPresenter;
  var _testModel;


  get subjectPresenter => _subjectPresenter;

  get evenWeekPresenter => _evenWeekPresenter;

  get testView => _testView;
  get mainPresenter => _mainPresenter;

  TestPresenter(MainPresenter mainPresenter){
    _testView = TestView(this);
    _testModel = TestModel(this);
    _mainPresenter = mainPresenter;
    _oddWeekPresenter = OddWeekPresenter(this);
    _evenWeekPresenter = EvenWeekPresenter(this);
    _subjectPresenter = SubjectPresenter(this);
    _groupPresenter = GroupPresenter(this);
  }

  void goToSignature(BuildContext context){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => _mainPresenter.signaturePresenter.signatureView),
    );
  }

  void goBack(BuildContext context){
    Navigator.pop(context);
  }

  get oddWeekPresenter => _oddWeekPresenter;

  get groupPresenter => _groupPresenter;

  set groupPresenter(value) {
    _groupPresenter = value;
  }

  get testModel => _testModel;

  set testModel(value) {
    _testModel = value;
  }
}