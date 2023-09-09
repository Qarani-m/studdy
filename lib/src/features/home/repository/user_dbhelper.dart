import 'package:sqflite/sqflite.dart';
import 'package:studdy/src/features/home/model/student_model.dart';


class UserDbHelper{
  static  Database? db;
    static const int version = 1;
  static const String tableName = "student";
static const String CREATE_TABLE = '''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      email TEXT,
      phone TEXT,
      school TEXT,
      studentid TEXT,
      dob TEXT,
      form TEXT
    )
  ''';
    static Future<void> initDb()async{
    if(db!=null){
      print("already on user");
      return;
    }
    try{
      String path = await getDatabasesPath()+"student.db";

      db = await openDatabase(
        path,
        version: version,
        onCreate: (db,version){
          print("creating a new one user");
          return db.execute(
            CREATE_TABLE
          );
        }
      );

    }catch(e){

      print(e);
    }
  }



 static Future<int> insert(Student? model)async{
  print("hit---->");
    await db?.delete(tableName);
    return await db?.insert(tableName, model!.toJson())??0;
  }

  static Future<List<Student>> getUser() async {
  await initDb();
  List<Map<String, dynamic>> taskMaps = await db!.query(tableName);
  return taskMaps.map((data) => Student.fromJson(data)).toList();
}





  
}