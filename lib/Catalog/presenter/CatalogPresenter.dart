import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/model/CatalogModel.dart';
import 'package:flutterapp/Catalog/tasks/presenter/TasksPresenter.dart';
import 'package:flutterapp/Catalog/variants/presenter/VariantsPresenter.dart';
import 'package:flutterapp/Catalog/view/CatalogView.dart';
import 'package:flutterapp/MainPresenter/MainPresenter.dart';

class CatalogPresenter {
  var _variantsPresenter;
  var _tasksPresenter;
  var _mainPresenter;

  get mainPresenter => _mainPresenter;
  var _catalogView;
  var _catalogModel;
  var _state;

  get catalogModel => _catalogModel;

  get variantsPresenter => _variantsPresenter;

  get tasksPresenter => _tasksPresenter;

  set state(value) {
    _state = value;
  }

  CatalogPresenter(MainPresenter mainPresenter) {
    _mainPresenter = mainPresenter;
    _catalogView = CatalogView(this);
    _catalogModel = CatalogModel(this);
    _variantsPresenter = VariantsPresenter(this);
    _tasksPresenter = TasksPresenter(this);
  }

  get catalogView => _catalogView;

//TODO: You can create method which has returned Widget and it is based on _state

  void loadCatalogModel() {
    switch (_state) {
      case "Student":
        {
          _mainPresenter.mainPresenterModel.themeColorEnd = Colors.indigo;
          _mainPresenter.mainPresenterModel.themeColorStart = Colors.indigo;
          _mainPresenter.mainPresenterModel.amountOfTasks = 26;
        }
        break;

      case "Teacher":
        {
          _mainPresenter.mainPresenterModel.themeColorEnd = Colors.redAccent;
          _mainPresenter.mainPresenterModel.themeColorStart = Colors.redAccent;
          _mainPresenter.mainPresenterModel.amountOfTasks = 12;
        }
        break;

      default:
        {
          _catalogModel._color = Colors.redAccent;
        }
    }
  }

  void goToTest(BuildContext context){
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => _mainPresenter.testPresenter.testView),
    );
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
