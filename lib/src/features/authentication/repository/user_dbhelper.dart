// ignore_for_file: empty_catches, avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:studdy/src/features/authentication/models/student_model.dart';
import 'package:path/path.dart';

class UserDbHelper {
  static Database? db;
  static const int version = 2;
  static const String tablename = "Student";

 static const String CREATE_TABLE = '''
    CREATE TABLE $tablename (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT,
      phone TEXT,
      school TEXT,
      courses TEXT,
      studentid TEXT,
      dob TEXT,
      level TEXT
    )
  ''';
  
  static Future<void> initDb()async{
    if(db!=null){
      print("already on");
      return;
    }
    try{
      String path = "${await getDatabasesPath()}${tablename}s.db";
      db = await openDatabase(
        path,
        version: version,
        onCreate: (db,version){
          print("creating a new one");
          return db.execute(
            CREATE_TABLE
          );
        }
      );
    }catch(e){
      print(e);
    }
  }


  static Future<int> insertStudent(Student model) async {
    print("inserting");
    await db!.delete(tablename);
    return await db?.insert(tablename, model.toJson()) ?? 0;
  }
  static Future<List<Student>> getStudentFromLocalDb() async {
  print("Query called");
  List<Map<String, dynamic>> taskMaps = await db!.query(tablename,);
  return taskMaps.map((data) => Student.fromJson(data)).toList();
}
}
