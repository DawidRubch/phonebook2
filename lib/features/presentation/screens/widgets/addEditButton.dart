import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/contact.dart';
import '../../bloc/contact_bloc.dart';
import 'colors.dart';

//The button at the bottom of add or edit page
class AddEditButton extends StatelessWidget {
  final List<TextEditingController> textControllersArray;
  final bool isAdd;
  final ContactModel contactsArrayIndex;

  AddEditButton(this.isAdd, this.textControllersArray, this.contactsArrayIndex);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _onTap(context);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: darkRed),
          width: 200,
          height: 50,
          child: Center(
            child: Text(
              isAdd ? 'Add' : 'Edit',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ));
  }

  _textControllersText(
      List<TextEditingController> textEditingController, int index) {
    return textEditingController[index].text;
  }

  _addEditEvent(BuildContext context, ContactEvent event) {
    BlocProvider.of<ContactBloC>(context).add(event);
  }

  _updatedPropsText(List<TextEditingController> textEditingController,
      int index, dynamic prop) {
    return _textControllersText(textEditingController, index) == ""
        ? prop
        : _textControllersText(textEditingController, index);
  }

  _onTap(context) {
    isAdd
        ? _addEditEvent(
            context,
            ContactAdded(ContactModel(
                name: _textControllersText(textControllersArray, 0),
                email: _textControllersText(textControllersArray, 1),
                number: _textControllersText(textControllersArray, 2))))
        : _addEditEvent(
            context,
            ContactUpdated((ContactModel(
                name: _updatedPropsText(
                    textControllersArray, 0, contactsArrayIndex.name),
                email: _updatedPropsText(
                    textControllersArray, 1, contactsArrayIndex.email),
                number: _updatedPropsText(
                    textControllersArray, 2, contactsArrayIndex.number),
                id: contactsArrayIndex.id))));
    Navigator.pop(context);
  }
}
