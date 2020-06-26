import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/MainPresenter/MainPresenter.dart';
import 'package:flutterapp/Test/view/TestView.dart';

class TestPresenter{
  var _testView;
  var _mainPresenter;

  get testView => _testView;
  get mainPresenter => _mainPresenter;

  TestPresenter(MainPresenter mainPresenter){
    _testView = TestView(this, 45, 0);
    _mainPresenter = mainPresenter;
  }

  void goToSignature(BuildContext context){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => _mainPresenter.signaturePresenter.signatureView),
    );
  }

  void goBack(BuildContext context){
    Navigator.pop(context);
  }

}