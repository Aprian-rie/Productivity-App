// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:productivity_app/models/classes/task.dart';
import 'package:productivity_app/models/global.dart';
import 'package:productivity_app/models/widgets/intray_todo_widget.dart';

class IntrayPage extends StatefulWidget {
  const IntrayPage({super.key});

  @override
  State<IntrayPage> createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  List<Task> taskList = [];
  @override
  Widget build(BuildContext context) {
    taskList = getList();
    return Container(
      color: darkGreyColor,
      child: _buildReordableListSimple(context),
      // child: ReorderableListView(
      //   padding: EdgeInsets.only(top: 300),
      //   onReorder: _onReorder,
      //   children: getList(),
      // ),
    );
  }

  Widget _buildListTile(BuildContext context, Task item) {
    return ListTile(
      key: Key(item.taskId),
      title: IntrayTodo(
        title: item.title,),
    );
  }

  Widget _buildReordableListSimple(BuildContext context) {
    return Theme(
          data: ThemeData(
            canvasColor: Colors.transparent
          ),
          child: ReorderableListView(
          padding: EdgeInsets.only(top: 300.0),
          onReorder: ((oldIndex, newIndex) {
            setState(() {
              Task item = taskList[oldIndex];
              taskList.remove(item);
              taskList.insert(newIndex, item);
            });
          }),
          children: taskList
              .map((Task item) => _buildListTile(context, item))
              .toList()),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;

        final Task item = taskList.removeAt(oldIndex);
        taskList.insert(newIndex, item);
      }
    });
  }

  List<Task> getList() {
    for (int i = 0; i < 10; i++) {
      // ignore: prefer_interpolation_to_compose_strings
      taskList.add(Task("My First todo " + i.toString(), false, i.toString()));
    }
    return taskList;
  }
}
