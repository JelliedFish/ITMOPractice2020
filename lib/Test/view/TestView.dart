import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Test/presenter/TestPresenter.dart';

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
    fragments[0] = this._testPresenter.evenWeekPresenter.evenWeekView;
    fragments[1] = this._testPresenter.oddWeekPresenter.oddWeekView;
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: IconButton(
                    color: _testPresenter.mainPresenter.mainPresenterModel.themeColorEnd,
                    icon: Icon(Icons.highlight_off),
                    iconSize: 30,
                    onPressed: () {
                      if (!_testPresenter.mainPresenter.mainPresenterModel.teacher){
                        _testPresenter.mainPresenter.mainPresenterModel.name = null;
                      }
                      this._testPresenter.goBack(context);
                    },
                  ),
                  padding: EdgeInsets.only(left: 15),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[ createGroupButton() ],
            )
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


  Widget createGroupButton (){
    if (_testPresenter.mainPresenter.mainPresenterModel.teacher) {
      return Container(

          padding: EdgeInsets.only(right: 15),
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              Icons.group,
              color: _testPresenter.mainPresenter.mainPresenterModel
                  .themeColorEnd,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) =>
                      _testPresenter.groupPresenter
                          .groupView
                  ));
            },
          )
      );
    }
    else {
      return Container(color: Colors.transparent);
    }
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
