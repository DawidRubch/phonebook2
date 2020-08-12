import 'package:flutter/material.dart';

import '../../data/models/contact.dart';
import 'widgets/addEditButton.dart';
import 'widgets/colors.dart';
import 'widgets/inputTextField.dart';

class AddEditPage extends StatelessWidget {
  final TextEditingController textEditingControllerName =
      TextEditingController();
  final TextEditingController textEditingControllerEmail =
      TextEditingController();
  final TextEditingController textEditingControllerNumber =
      TextEditingController();

  final bool isAdd;

  final ContactModel contactsArrayIndex;

  AddEditPage(this.isAdd, this.contactsArrayIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isAdd ? 'Add' : 'Edit'),
        backgroundColor: lightPink,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        InputTextField('Name', textEditingControllerName),
        InputTextField('Email', textEditingControllerEmail),
        InputTextField('Number', textEditingControllerNumber),
        AddEditButton(
          isAdd,
          [
            textEditingControllerName,
            textEditingControllerEmail,
            textEditingControllerNumber
          ],
          contactsArrayIndex,
        )
      ]),
    );
  }
}


