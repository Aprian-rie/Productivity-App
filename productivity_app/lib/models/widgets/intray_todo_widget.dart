// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:productivity_app/models/global.dart';

class IntrayTodo extends StatelessWidget {
  int selectedOption = 1;
  final String title;
  final String keyValue;
  IntrayTodo({this.keyValue = "key", required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
        key: Key(keyValue),
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          color: redColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Radio<int>(
                value: 1,
                groupValue: selectedOption,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.black.withOpacity(.32);
                  }
                  return Colors.black;
                }),
                onChanged: (value) {}),
            Column(
              children: <Widget>[
                Text(
                  title,
                  style: darkTodoTitle,
                )
              ],
            )
          ],
        ),
      );
  }
}
