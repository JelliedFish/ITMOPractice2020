import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Catalog/presenter/CatalogPresenter.dart';
import 'package:flutterapp/Catalog/view/VariantItem.dart';
import 'package:flutterapp/Test/presenter/TestPresenter.dart';
import 'package:flutterapp/liquid_progress_indicator/liquid_progress_indicator.dart';

class TestView extends StatefulWidget {
  var _testPresenter;

  TestView(TestPresenter testPresenter) {
    this._testPresenter = testPresenter;
  }

  @override
  State<StatefulWidget> createState() => TestViewState(_testPresenter);
}

class TestViewState extends State<TestView> {
  var _testPresenter;
  List<bool> _isSelected;
  int _fIndex = 0;
  var fragments = new List<Widget>(2);

  TestViewState(TestPresenter testPresenter){

    _testPresenter = testPresenter;
    fragments[0] = this._testPresenter.variantsPresenter.variantsView;
    fragments[1] = this._testPresenter.tasksPresenter.tasksView;
  }

  @override
  void initState() {
    _isSelected = [true, false];
    super.initState();
  }

  Container createFirstElement(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: IconButton(
                    color: _testPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
                    icon: Icon(Icons.highlight_off),
                    iconSize: 30,
                    onPressed: () {
                      this._testPresenter.goBack(context);
                    },
                  ),
                  padding: EdgeInsets.only(left: 15),
                )
              ],
            ),
              ],
            ),
    );
  }

  Widget createSecondElement() {
    return Container(
        padding: EdgeInsets.only(top: 30),
        child:
        Container(

          child: ToggleButtons(
            borderRadius: BorderRadius.all(Radius.circular(80)),
            borderColor: Colors.white70,
            fillColor: _testPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
            selectedColor: Colors.white,
            children: <Widget>[
              Container(

                  width: 150,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Четная',
                          style: TextStyle(fontSize: 20),
                        ),
                      ))),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Нечетная',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                _fIndex = index;
                for (int buttonIndex = 0;
                buttonIndex < _isSelected.length;
                buttonIndex++) {
                  if (buttonIndex == index) {
                    _isSelected[buttonIndex] = true;
                  } else {
                    _isSelected[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: _isSelected,
          ),
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        new Expanded(child: createFirstElement(context), flex: 3),
        new Expanded(child: createSecondElement(), flex: 4),
        new Expanded(child: fragments[_fIndex], flex: 22)
      ]),
    );
  }
}
