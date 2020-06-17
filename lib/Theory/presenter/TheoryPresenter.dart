



import 'package:flutterapp/MainPresenter/MainPresenter.dart';
import 'package:flutterapp/Theory/view/TheoryView.dart';

class TheoryPresenter {

  var _theoryView;
  var _mainPresenter;

  get mainPresenter => _mainPresenter;

  get theoryView => _theoryView;

  TheoryPresenter(MainPresenter mainPresenter){
    _mainPresenter = mainPresenter;
    _theoryView = TheoryView(this);
  }

}