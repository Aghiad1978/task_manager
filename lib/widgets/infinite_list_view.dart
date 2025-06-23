import 'package:flutter/material.dart';
import 'package:task_manager/app_color.dart';

class InfiniteListView extends StatefulWidget {
  final DateTime chooseDate;
  const InfiniteListView({super.key, required this.chooseDate});

  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  final int _middle = 100000;
  final int maxItems = 200000;
  final ScrollController _controller = ScrollController();
  final days=["","Mon","Tue","Wed","Thu","Fri","Sat","Sun"];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _jumpToDate();
    });
  }



  void _jumpToDate() {
    final double _initialPosition = _middle * 72 - 160;
    if (_controller.hasClients) {
      _controller.jumpTo(_initialPosition);
    }
  }
  @override
  void didUpdateWidget(InfiniteListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.chooseDate != oldWidget.chooseDate) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _jumpToDate();
      });
    }
  }
    @override
  Widget build(BuildContext context) {
    DateTime today=widget.chooseDate;
    return SizedBox(
      height: 85,
      child: ListView.builder(
        itemCount: maxItems,
        controller: _controller,
        itemExtent: 72.0,
        scrollDirection:Axis.horizontal,
        itemBuilder:(context, index) {
          DateTime date=today.add( Duration(days:index-_middle));
          return Container(
           
            child: Card(
              color: index-_middle==0?AppColor.choosenDateColor:Colors.white,
              child: Column(children: [
              Text(days[date.weekday],style: TextStyle(color: AppColor.dayNameColor,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
              Divider(color: AppColor.dayNameColor,),
              Text("${date.day}/${date.month}",style: TextStyle(color: index-_middle==0?Colors.white:Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
              Text("${date.year}",style: TextStyle(color: index-_middle==0?Colors.white:Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1.25))
                        ],),
            ));
        }, ),
    );
  }
}