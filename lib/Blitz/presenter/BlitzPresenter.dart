import 'package:flutterapp/Blitz/view/BlitzView.dart';

class BlitzPresenter {

  var _blitzView;

  get blitzView => _blitzView;

  BlitzPresenter(){
    _blitzView = BlitzView(this);
  }

}