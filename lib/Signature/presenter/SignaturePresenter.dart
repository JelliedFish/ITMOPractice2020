
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/MainPresenter/MainPresenter.dart';
import 'package:flutterapp/Signature/view/SignatureView.dart';

class SignaturePresenter{
  var _signatureView;
  var _mainPresenter;

  get signatureView => _signatureView;
  get mainPresenter => _mainPresenter;

  SignaturePresenter(MainPresenter  mainPresenter){
    _signatureView = new SignatureView(this);
  }

  void goBack(BuildContext context){
    Navigator.pop(context);
  }
}