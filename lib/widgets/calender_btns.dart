import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/app_color.dart';
import 'package:task_manager/providers/date_provider.dart';
import 'package:task_manager/widgets/calendar_dialogue.dart';

class CalenderBtns extends StatelessWidget {
  const CalenderBtns({super.key});

  @override
  Widget build(BuildContext context) {
    final  provider=Provider.of<DateProvider>(context,listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: (){
          provider.setDate(DateTime.now());
        }, icon: Icon(Icons.location_pin,size:35,color: AppColor.iconColor,)),
        IconButton(
          onPressed: ()async{
            final choosenDate=await getDateFromCalendar(context);
            if(choosenDate!=null){
              provider.setDate(choosenDate);
            }
          },
           icon: Icon(Icons.calendar_month,size:35,color: AppColor.iconColor,),),
      ],
    );
  }
}