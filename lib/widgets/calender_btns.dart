import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/date_provider.dart';

class CalenderBtns extends StatelessWidget {
  const CalenderBtns({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: (){
          final  provider=Provider.of<DateProvider>(context,listen: false);
          provider.setDate(DateTime.now());
        }, icon: Icon(Icons.calendar_month)),
        IconButton(onPressed: (){}, icon: Icon(Icons.location_pin))
      ],
    );
  }
}