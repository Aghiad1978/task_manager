import 'package:flutter/material.dart';

Future<DateTime?> getDateFromCalendar(BuildContext context)async{
  return showDatePicker(context: context,
  firstDate:DateTime.now(),
  lastDate: DateTime.now().add(Duration(days: 365*8),
  ),
  );
} 