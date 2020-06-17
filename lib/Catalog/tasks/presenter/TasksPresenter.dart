import 'package:flutterapp/Catalog/tasks/view/TasksView.dart';

class TasksPresenter{

  var _tasksView;

  get tasksView => _tasksView;

  TasksPresenter(){
    _tasksView = new TasksView(this);
  }

}