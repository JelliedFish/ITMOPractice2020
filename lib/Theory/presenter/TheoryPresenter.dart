



import 'package:flutterapp/Theory/view/TheoryView.dart';

class TheoryPresenter {

  var _theoryView;

  get theoryView => _theoryView;

  TheoryPresenter(){
    _theoryView = TheoryView(this);
  }

}