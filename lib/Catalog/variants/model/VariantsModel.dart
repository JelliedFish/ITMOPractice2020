import 'dart:convert';

import 'package:flutterapp/Statistics/presenter/StatisticsPresenter.dart';


class VariantModel {

  int id;
  //List <String> text_of_tasks = new List<String>(12);
  //List <String> image_links = new List<String>(12);

  int number;
  int visited;
  int right_answers;
  VariantModel(
      this.id, this.number,this.visited,this.right_answers);


  VariantModel clientFromJson(String str) {
    final jsonData = json.decode(str);
    return VariantModel.fromJson(jsonData);
  }

  String clientToJson(VariantModel data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }


  factory VariantModel.fromJson(Map<String, dynamic> json){
    return new VariantModel(
        json["id"],
        json["number"],
        json["visited"],
        json["right_answers"]
    );
  }

  Map<String, dynamic> toJson() {

  return{
  'id': id,
  /*'text_of_tasks': [text_of_tasks[0],
  text_of_tasks[1],
  text_of_tasks[2],
  text_of_tasks[3],
  text_of_tasks[4],
  text_of_tasks[5],
  text_of_tasks[6],
  text_of_tasks[7],
  text_of_tasks[8],
  text_of_tasks[9],
  text_of_tasks[10],
  text_of_tasks[11],
  ],
  'image_links': [image_links[0],
  image_links[1],
  image_links[2],
  image_links[3],
  image_links[4],
  image_links[5],
  image_links[6],
  image_links[7],
  image_links[8],
  image_links[9],
  image_links[10],
  image_links[11],
  ],*/
  'number': number,
  'visited': visited,
  'right_answers': right_answers
  };
  }
}