class Student {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? school;
  String? studentId;
  String? dob;
  String? form;

  Student({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.school,
    this.studentId,
    this.dob,
    this.form,
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
      form: json['form'] as String?,
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
    data['form'] = form;
    return data;
  }
}
