

import 'package:flutter/cupertino.dart';
import 'package:flutterapp/MainScreen/view/MainScreenView.dart';

class MainScreenPresenter {
  var mainScreenView;

  MainScreenPresenter(){
    mainScreenView = MainScreenView();
    startMainScreen();
  }

   void startMainScreen() {
    runApp(mainScreenView);
  }

}