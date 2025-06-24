import 'package:flutter/material.dart';
import 'package:task_manager/app_color.dart';
import 'package:task_manager/models/task.dart';

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({super.key});

  @override
  State<NewTaskForm> createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  Measure _measure=Measure.nothing;
  String _measureName="nothing";
  void setMeasureUnit(Measure? value){
    setState(() {
      _measure=value!;
      _measureName=value.name;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hint: Text("Task Name"),
              border: OutlineInputBorder(),
            ),
          ),
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                 children: [
                  Text("Measurment",style: TextStyle(color: AppColor.dayNameColor),),
                   DropdownButton<Measure>(
                    icon: Icon(Icons.height_rounded),
                    value: _measure,
                    items: Measure.values.map((Measure measure){
                      return DropdownMenuItem<Measure>(
                        value: measure,
                        child:Text(measure.name),
                        );
                    }).toList(),
                    onChanged: (value) {
                      setMeasureUnit(value);
                    },
                   ),
                 ],
               ),
                Column(children: [
                  Text(_measureName,style: TextStyle(color: AppColor.dayNameColor),),
                ],)
             ],
           
           ),
         ),
          TextField(),
        ],
      ),
    );
  }
}