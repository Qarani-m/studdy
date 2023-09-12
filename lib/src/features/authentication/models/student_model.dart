import 'dart:convert';

import 'package:studdy/src/features/home/model/courses_model.dart';

class Student {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? school;
  String? courses;
  String? studentId;
  String? level;
  String? dob;

  Student({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.school,
    this.courses,
    this.studentId,
    this.level,
    this.dob,
  });

  factory Student.fromJson(Map<String, dynamic> json) {


    return Student(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      school: json['school'] as String?,
      studentId: json['studentid'] as String?,
      dob: json['dob'] as String?,
      level: json['level'] as String?,
      courses: json['courses'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['school'] = school;
    data['studentid'] = studentId;
    data['dob'] = dob;
    data['level'] = level;
    data['courses']=courses;
    return data;
  }
}
