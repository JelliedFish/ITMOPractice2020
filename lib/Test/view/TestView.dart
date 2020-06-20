import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/Test/presenter/TestPresenter.dart';

class TestView extends StatelessWidget {
  var _testPresenter;

  TestView(TestPresenter testPresenter) {
    _testPresenter = testPresenter;
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
                )
              ],
            ),
          ]),
    );
  }

  Swiper createSwipeLayout(){
    return new Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: Container(
            child: Text(
              'Задание ${index+1}'
            ),
            width: 250,
            height: 400,
          ),
        );
      },
      itemCount: 12,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    ]));
  }
}
