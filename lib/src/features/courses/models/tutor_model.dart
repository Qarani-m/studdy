
class TutorModel {
  String? tutorId;
  String? tutorName;
  String? tutorNickName;
  String? tutorAbout;
  String? tutorStudentCount;
  String? tutorImageUrl;
  List<String>? tutorCourses;
  List<String>? reviews;

  TutorModel({

    this.tutorId,
    this.tutorName,
    this.tutorNickName,
    this.tutorAbout,
    this.tutorStudentCount,
    this.tutorImageUrl,
    this.tutorCourses,
    this.reviews,
  });
}




class ExperienceModel{
  String? title;
  String? startYear;
  String? endYear;
  List<String>? pointers;
  String? tutorId;


  ExperienceModel({
    this.endYear,
    this.pointers,
    this.startYear,
    this.title,
    this.tutorId,
  });
}
