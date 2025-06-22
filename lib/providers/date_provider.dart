import 'package:flutter/foundation.dart';

class DateProvider extends ChangeNotifier{
  DateTime choosenDate=DateTime.now();
  void setDate(DateTime date){
    choosenDate=date;
    notifyListeners();
  }

}