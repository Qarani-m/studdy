import 'package:sqflite/sqflite.dart';
import 'package:studdy/src/features/home/model/schedule_model.dart';

class DbHelper {
  static Database? db;
  static const int version = 1;
  static const String tableName = "tasks";
static const String CREATE_TABLE = '''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date TEXT,
      title TEXT,
      note TEXT,
      start TEXT,
      end TEXT,
      bgColor INTEGER,
      isComplete INTEGER
    )
  ''';




  static Future<void> initDb()async{
    if(db!=null){
      print("already on");
      return;
    }
    try{
      String path = await getDatabasesPath()+"tasks.db";

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


  static Future<int> insert(ScheduleModel? model)async{
    print("inserting shiet");
    return await db?.insert(tableName, model!.toJson())??0;

  }

 static Future <List<Map<String ,dynamic>>> query()async{
  print("Query called");
  return await db!.query(tableName);
 }

static Future<List<ScheduleModel>> getTasks() async {
  await initDb();
  print("Query called");
  List<Map<String, dynamic>> taskMaps = await db!.query(tableName);
  return taskMaps.map((data) => ScheduleModel.fromJson(data)).toList();
}

static deleteTask(int id)async{
   await db?.delete(tableName, where: "id=?",whereArgs: [id] );
}

  
}