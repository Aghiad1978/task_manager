import 'package:flutter/material.dart';

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

  @override
  void didUpdateWidget(covariant InfiniteListView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.chooseDate != widget.chooseDate) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _jumpToDate();
      });
    }
  }

  void _jumpToDate() {
    final double _initialPosition = _middle * 72 - 160;
    if (_controller.hasClients) {
      _controller.jumpTo(_initialPosition);
    }
  }
    @override
  Widget build(BuildContext context) {
    DateTime today=widget.chooseDate;
    return Container(
      height: 65,
      child: ListView.builder(
        itemCount: maxItems,
        controller: _controller,
        itemExtent: 72.0,
        scrollDirection:Axis.horizontal,
        itemBuilder:(context, index) {
          DateTime date=today.add( Duration(days:index-_middle));
          return Container(
           decoration: BoxDecoration(
            border: Border.all(
                color:index-_middle==0?Colors.red :Colors.transparent, // border color
                width: 2.0,         // border thickness
    ),
    borderRadius: BorderRadius.circular(2), // optional: rounded corners
  ),
            child: Column(children: [
            Text(days[date.weekday],style: TextStyle(color: Colors.red),),
            Text("${date.day}/${date.month}"),
            Text("${date.year}")
          ],));
        }, ),
    );
  }
}