import 'package:flutter/material.dart';
import 'package:task_manager/app_color.dart';
import 'package:task_manager/widgets/new_task_form.dart';

Future<DateTime?> getDateFromCalendar(BuildContext context)async{
  return showDatePicker(context: context,
  firstDate:DateTime.now(),
  lastDate: DateTime.now().add(Duration(days: 365*10),
  ),
  );
} 
void addTaskDialogue(BuildContext context){
  showDialog(context: context, builder: (context) {
    return  Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height/1.5,
          color: AppColor.dayNameColor,
          child: Column(
            children: [
                Text("New Task",style: TextStyle(fontSize: 24, color: Colors.white),),
                Divider(),
                NewTaskForm()
            ]
            
            
          ),
        ),
      );

  },); 
}