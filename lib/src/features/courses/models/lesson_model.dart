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


