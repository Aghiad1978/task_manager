import 'package:flutter/material.dart';

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({super.key});

  @override
  State<NewTaskForm> createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          
        ),
        TextField(),
        TextField(),
      ],
    );
  }
}