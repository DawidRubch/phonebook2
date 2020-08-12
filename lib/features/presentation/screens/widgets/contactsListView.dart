import 'package:flutter/material.dart';

import '../../../data/models/contact.dart';
import 'contactListTile.dart';

class ContactsListView extends StatelessWidget {
  final contactArray;
  ContactsListView(this.contactArray);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contactArray.length,
        itemBuilder: (context, index) {
          final ContactModel contactsArrayIndex = contactArray[index];

          return ContactListTile(contactsArrayIndex);
        });
  }
}
