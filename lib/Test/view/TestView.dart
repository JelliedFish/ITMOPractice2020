import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/Test/presenter/TestPresenter.dart';
import 'package:flutterapp/assets/ege_helper_icons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TestView extends StatefulWidget {
  var _testPresenter;
  int _hours;
  int _seconds;

  TestView(this._testPresenter, this._hours, this._seconds);

  @override
  State<StatefulWidget> createState() =>
      _TestViewState(_testPresenter, _hours, _seconds);
}

class _TestViewState extends State<TestView> {
  var _testPresenter;
  PanelController _pc = new PanelController();
  int _hours;
  int _seconds;
  Timer _timer;

  _TestViewState(this._testPresenter, this._hours, this._seconds);

  void _startTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else if (_hours > 0) {
          _hours--;
          _seconds = 59;
        } else {
          _timer.cancel();
        }
      });
    });
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
                    color: _testPresenter
                        .mainPresenter.mainPresenterModel.themeColor,
                    icon: Icon(Icons.highlight_off),
                    iconSize: 30,
                    onPressed: () {
                      this._testPresenter.goBack(context);
                    },
                  ),
                  padding: EdgeInsets.only(left: 5),
                ),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _testPresenter
                          .mainPresenter.mainPresenterModel.themeColor,
                    ),
                  ),
                  child: Center(child: Text('$_hours : $_seconds')),
                ),
                Container(
                  width: 40,
                  height: 40,
                  child: InkWell(
                    onTap: () {},
                  ),
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage('assets/images/logo.png')),
                  ),
                )
              ],
            ),
          ]),
    );
  }

  Swiper createSwipeLayout() {
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          child: Column(
            children: <Widget>[
              new Expanded(
                child: createTaskCard(),
                flex: 7,
              ),
              new Expanded(
                child: createAnswerCard(),
                flex: 2,
              ),
            ],
          ),
        );
      },
      itemCount: 12,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    );
  }

  Card createTaskCard() {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              'На диаграмме показан средний балл участников 10 стран в тестировании учащихся 4-го класса, по естествознанию в 2007 году (по 1000-балльной шкале). По данным диаграммы найдите число стран, в которых средний балл участников выше, чем в Венгрии.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          ),
          Container(
              child: const Image(
                  image:
                      NetworkImage('https://ege.sdamgia.ru/get_file?id=37577')),
              margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0))
        ],
      ),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
    );
  }

  Widget createAnswerCard() {
    return Card(
      child: new Row(children: <Widget>[
        new Expanded(
          child: IconButton(
            onPressed: () {
              _testPresenter.goToSignature(context);
            },
            icon: Icon(
              EgeHelper.pencil,
              color: _testPresenter.mainPresenter.mainPresenterModel.themeColor,
            ),
          ),
          flex: 2,
        ),
        new Expanded(
          child: Container(
            child: Center(
                child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Ответ',
                  hintText: 'Введите ответ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            )),
          ),
          flex: 8,
        ),
        new Expanded(
          child: IconButton(
            onPressed: () {
              _pc.open();
            },
            icon: Icon(
              EgeHelper.question_circle_o,
              color: _testPresenter.mainPresenter.mainPresenterModel.themeColor,
            ),
          ),
          flex: 2,
        )
      ]),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
    );
  }

  Widget _floatingPanel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]),
      child: Center(
        child: Text("This is the SlidingUpPanel when open"),
      ),
    );
  }

  Widget createTest(BuildContext context) {
    return SlidingUpPanel(
      controller: _pc,
      body: Column(children: <Widget>[
        new Expanded(
          child: createFirstElement(context),
          flex: 1,
        ),
        new Expanded(
          child: Container(
            child: Center(
              child: createSwipeLayout(),
            ),
          ),
          flex: 9,
        ),
      ]),
      panel: _floatingPanel(),
      minHeight: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    _startTimer();
    Widget test = createTest(context);
    return Scaffold(
      body: test,
    );
  }
}
