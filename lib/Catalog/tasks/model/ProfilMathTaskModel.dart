import 'dart:convert';

import 'package:flutterapp/Statistics/presenter/StatisticsPresenter.dart';


class TaskModel {

  int id;
  String text;
  String image_link;
  int visited;
  int right_answer;
  TaskModel(
      this.id, this.text, this.image_link, this.visited,this.right_answer);


  TaskModel clientFromJson(String str) {
    final jsonData = json.decode(str);
    return TaskModel.fromJson(jsonData);
  }

  String clientToJson(TaskModel data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }


  factory TaskModel.fromJson(Map<String, dynamic> json){

    return new TaskModel(
        json["id"],
        json["text"],
        json["image_link"],
        json["visited"],
        json["right_answers"]
    );
  }


  Map<String, dynamic> toJson() {

    return{
      'id': id,
      'text': text,
      'image_link': image_link,
      'visited': visited,
      'right_answer': right_answer
    };
  }
}