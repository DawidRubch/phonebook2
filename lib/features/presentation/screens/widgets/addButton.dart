import 'package:flutter/material.dart';

import '../AddEdit.dart';
import 'colors.dart';

//Add button on HomePage
class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddEditPage(true, null)));
      },
      child: Icon(
        Icons.add,
      ),
      backgroundColor: lightPink,
    );
  }
}
