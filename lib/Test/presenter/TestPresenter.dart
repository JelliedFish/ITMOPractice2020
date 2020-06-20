
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/MainPresenter/MainPresenter.dart';
import 'package:flutterapp/Test/view/TestView.dart';

class TestPresenter{
  var _testView;
  var _mainPresenter;

  get testView => _testView;
  get mainPresenter => _mainPresenter;

  TestPresenter(MainPresenter mainPresenter){
    _testView = TestView(this);
    _mainPresenter = mainPresenter;
  }

  void goBack(BuildContext context){
    Navigator.pop(context);
  }

}