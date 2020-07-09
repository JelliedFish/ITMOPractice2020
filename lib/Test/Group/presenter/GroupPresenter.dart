




import 'package:flutterapp/Test/Group/model/GroupModel.dart';
import 'package:flutterapp/Test/Group/view/GroupView.dart';

class GroupPresenter {
  var _groupView;
  var _groupModel;
  var _testPresenter;

  get groupView => _groupView;

  set groupView(value) {
    _groupView = value;
  }

  GroupPresenter(this._testPresenter) {
    _groupModel = new GroupModel(this);
    _groupView = new GroupView(this);
  }

  get groupModel => _groupModel;

  set groupModel(value) {
    _groupModel = value;
  }

  get testPresenter => _testPresenter;

  set testPresenter(value) {
    _testPresenter = value;
  }
}