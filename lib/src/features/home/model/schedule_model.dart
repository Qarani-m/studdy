import 'package:flutter/material.dart';

class Task {
  String? title;
  String? note;
  String? start;
  String? end;
  int? bgColor;
  String? date;
  int? id;
  int? isComplete;

  Task({
    this.date,
    this.id,
    this.title,
    this.note,
    this.start,
    this.end,
    this.bgColor,
    this.isComplete
  });


   @override
  String toString() {
    return 'Task{id: $id, date: $date, title: $title, note: $note, start: $start, end: $end, bgColor: $bgColor, isComplete: $isComplete}';
  }
  Task.fromJson(Map<String ,dynamic>json){
     id= json["id"];
    title = json["title"];
     note= json["note"];
     start= json["start"];
     end= json["end"];
     bgColor= json["bgColor"];
     date= json["date"];
     isComplete= json["isComplete"];

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']=id;
    data['title']=title;
    data['note']=note;
    data['start']=start;
    data['end']=end;
    data['bgColor']=bgColor;
    data['date']=date;
    data['isComplete']=isComplete;
    return data;
  }
}
