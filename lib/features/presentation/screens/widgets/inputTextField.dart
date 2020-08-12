import 'package:flutter/material.dart';

import 'colors.dart';

class InputTextField extends StatelessWidget {
  final String name;
  final TextEditingController textEditingController;
  InputTextField(this.name, this.textEditingController);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            labelText: name,
            labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: darkRed),
            focusedBorder:
                UnderlineInputBorder(borderSide: BorderSide(color: lightPink))),
      ),
    );
  }
}
