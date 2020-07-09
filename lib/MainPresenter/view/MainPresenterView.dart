

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainPresenterView extends StatefulWidget{
  var _mainPresenter;

  MainPresenterView(this._mainPresenter);

  @override
  _MainPresenterView createState() => _MainPresenterView(_mainPresenter);
}


class _MainPresenterView extends State<MainPresenterView> {
  int _cIndex = 0;
  var _mainPresenter;
  var tabs = new List<Widget>(2);


  _MainPresenterView(mainPresenter) {

    _mainPresenter = mainPresenter;
    tabs[0] = this._mainPresenter.catalogPresenter.catalogView;
    tabs[1] = this._mainPresenter.statisticsPresenter.statisticsView;
  }


  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      body: tabs[_cIndex],
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: _cIndex,
          fixedColor: Colors.indigo,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed ,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_bookmark),
                title: new Text('Расписание')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.timeline),
                title: new Text('Статистика')
            ),
          ],
          onTap: (index){
            _incrementTab(index);
          },
        )
    );
  }
}