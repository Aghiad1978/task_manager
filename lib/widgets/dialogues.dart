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
        child: Container(
          height: MediaQuery.of(context).size.height/1.5,
          color: Colors.white,
          child: Column(
            children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: AppColor.dayNameColor,
                  child: Text("New Task",textAlign: TextAlign.center,
                  style: 
                  TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    ),),
                ),
                NewTaskForm()
            ]     
          ),
        ),
      );

  },); 
}