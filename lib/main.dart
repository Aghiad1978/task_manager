import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/app_color.dart';
import 'package:task_manager/providers/date_provider.dart';
import 'package:task_manager/widgets/calender_btns.dart';
import 'package:task_manager/widgets/dialogues.dart';
import 'package:task_manager/widgets/infinite_list_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DateProvider>(create: (context) => DateProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(), // <- Your main widget
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backGroundColor,
        body: Column(children: [
          SizedBox(height:40),
          Consumer<DateProvider>(builder:(context, provider, child) {
          return  InfiniteListView(chooseDate: provider.choosenDate)  ;
          },),
           
          CalenderBtns(),
        ],),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addTaskDialogue(context);
        },
        backgroundColor: AppColor.floatBtnColor,
        child: Icon(Icons.app_registration,color: Colors.white,),
      ),
     
    );
  }
}
