class Course {
  int? id;
  String? courseId;
  String? courseName;
  String? price;
  List<Map<String, List>>? lessons;
  String? instructor;
  String? lastUpdated;
  String? level;
  String? aboutCourse;

  Course({
    this.id,
    this.courseId,
    this.courseName,
    this.price,
    this.lessons,
    this.instructor,
    this.lastUpdated,
    this.level,
    this.aboutCourse,
  });

  // toJson method to serialize the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'courseName': courseName,
      'price': price,
      'lessons': lessons,
      'instructor': instructor,
      'lastUpdated': lastUpdated,
      'level': level,
      'aboutCourse': aboutCourse,
    };
  }

  // fromJson factory method to create a Course object from JSON
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as int?,
      courseId: json['courseId'] as String?,
      courseName: json['courseName'] as String?,
      price: json['price'] as String?,
      lessons: json['lessons'] as List<Map<String, List>>?,
      instructor: json['instructor'] as String?,
      lastUpdated: json['lastUpdated'] as String?,
      level: json['level'] as String?,
      aboutCourse: json['aboutCourse'] as String?,
    );
  }
}




