import 'package:studdy/src/features/courses/models/review_model.dart';
import 'package:studdy/src/features/home/model/lessons_model.dart';

class CourseModel {
  String? courseId;
  String? courseName;
  String? tutorId;
  String? aboutCourse;
  String? lessonCount;
  String? studentCount;
  String? language;
  String? level;
  String? price;
  String? thumbNailUrl;
  List<LessonModel>? lessons;
  List<ReviewModel>? reviews;

  CourseModel({
    this.courseId,
    this.courseName,
    this.tutorId,
    this.aboutCourse,
    this.lessonCount,
    this.studentCount,
    this.language,
    this.level,
    this.price,
    this.thumbNailUrl,
    this.lessons,
    this.reviews,
  });
}

