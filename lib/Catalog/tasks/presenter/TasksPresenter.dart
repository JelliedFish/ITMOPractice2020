import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/Catalog/tasks/model/TaskModel.dart';
import 'package:flutterapp/Catalog/tasks/view/TasksView.dart';

class TasksPresenter{

  var _tasksView;
  var _tasksModel;

  get tasksView => _tasksView;

  TasksPresenter(CatalogPresenter catalogPresenter){
    _tasksModel = new TaskModel(catalogPresenter.catalogModel);
    _tasksView = new TasksView(this, _tasksModel);
  }

  get tasksModel => _tasksModel;

  set tasksModel(value) {
    _tasksModel = value;
  }
}