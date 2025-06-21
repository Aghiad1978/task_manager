  enum Measure{
    time,count
  }
class Task {

  Task({required this.taskName,required this.measure,required this.setValue
  ,required this.dueDate,this.dueTime,this.done=false,this.numberOfSet=1});
  final String taskName;
  final Measure measure;
  final int setValue;
  final DateTime dueDate;
  final DateTime? dueTime;
   bool done;
   int numberOfSet;

}