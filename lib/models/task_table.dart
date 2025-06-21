import 'package:sqflite/sqflite.dart';
import 'package:task_manager/db/db_helper.dart';
import 'package:task_manager/models/task.dart';
import 'package:intl/intl.dart';
class TaskTable {
  static String tableName="task";

  Future<void> createTable()async{
    Database db=await DBHelper.instance.database;
    try {
  //       final String taskName;
  // final Measure measure;
  // final int setValue;
  // final DateTime dueDate;
  // final DateTime? dueTime;
  //  bool done;
  //  int numberOfSet;
    await db.execute("""
    CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        taskName TEXT NOT NULL,
        setValue INTEGER  NOT NULL,
        dueDate TEXT NOT NULL,
        dueTime TEXT,
        done INTEGER  NOT NULL DEFAULT 0,
        numberOfSet INTEGER DEFAULT 0
    )
      """);
    } catch (e) {
      print("Error when creating taskTable $e");
    }
  }
  Future<void> insertTask(Task task)async{
    final db=await DBHelper.instance.database;
    bool existed=await DBHelper.instance.tableExisted(tableName);
    if(!existed){
  //         final String taskName;
  // final Measure measure;
  // final int setValue;
  // final DateTime dueDate;
  // final DateTime? dueTime;
  //  bool done;
  //  int numberOfSet;
     await createTable();
    }
    db.insert(tableName, {"taskName":task.taskName,"measure":task.measure.name,"setValue":task.setValue,"dueDate":DateFormat('EEEE, yyyy-MM-dd').format(task.dueDate),"dueTime":task.dueTime!=null?DateFormat("HH:mm a").format(task.dueTime!):"null",});

  }

}