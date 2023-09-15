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

class LessonModel {
  String? lessonId;
  String? lessonTitle;
  List<LessonUnit>? units;

  LessonModel({
    this.lessonId,
    this.lessonTitle,
    this.units,
  });
}

class LessonUnit {
  String? unitId;
  String? unitNumber;
  String? unitDuration;
  String? unitVideoUrl;
  String? unitNotes;

  LessonUnit({
    this.unitId,
    this.unitNumber,
    this.unitDuration,
    this.unitVideoUrl,
    this.unitNotes,
  });
}

class ReviewModel {
  String? reviewId;
  String? imageUrl;
  String? reviewerName;
  String? timePassed;
  String? reviewContent;
  String? starCount;
  String? tutorId;
  String? courseId;

  ReviewModel({
    this.reviewId,
    this.imageUrl,
    this.reviewerName,
    this.timePassed,
    this.reviewContent,
    this.starCount,
    this.tutorId,
    this.courseId,
  });
}

class TutorModel {
  String? tutorId;
  String? tutorName;
  String? tutorNickName;
  String? tutorAbout;
  String? tutorStudentCount;
  List<CourseModel>? tutorCourses;
  List<ReviewModel>? reviews;

  TutorModel({
    this.tutorId,
    this.tutorName,
    this.tutorNickName,
    this.tutorAbout,
    this.tutorStudentCount,
    this.tutorCourses,
    this.reviews,
  });
}
