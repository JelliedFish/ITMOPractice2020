import 'dart:convert';

import 'package:flutterapp/Statistics/presenter/StatisticsPresenter.dart';


class TheoryModel {

  int id;
  String text;

  TheoryModel(
      this.id, this.text);


  TheoryModel clientFromJson(String str) {
    final jsonData = json.decode(str);
    return TheoryModel.fromJson(jsonData);
  }

  String clientToJson(TheoryModel data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }


  factory TheoryModel.fromJson(Map<String, dynamic> json){

    return new TheoryModel(
        json["id"],
        json["text"],
    );
  }


  Map<String, dynamic> toJson() {

    return{
      'id': id,
      'text': text,
    };
  }
}