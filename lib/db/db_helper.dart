import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  //create a singelton for DBhelper
  DBHelper._privateConstructor();
  static final DBHelper instance=DBHelper._privateConstructor();
  factory DBHelper(){
    return DBHelper._privateConstructor();
  }
  
  static Database? _database;

  //can get database with DBHelper.instance.database
   Future<Database> get database async{
    if(_database!=null)return _database!;
    _database=await _createDB(); 
    return _database!;
  } 
  //create database if null else return it
   Future<Database> _createDB()async{
    String dbDirectory=await getDatabasesPath();
    final dbPath=join(dbDirectory,"taskManager.db");
    return await openDatabase(dbPath,version: 1 );
  }
  //check if table existed or not 
  Future<bool> tableExisted(String tableName)async{
    final result = await _database!.rawQuery(
      "SELECT name FROM sqlite_master WHERE type='table' AND name=?",
      [tableName],
    );
    return result.isNotEmpty;
  }
}