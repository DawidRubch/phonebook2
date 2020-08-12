import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/contact.dart';
import '../../bloc/contact_bloc.dart';
import '../AddEdit.dart';
import 'colors.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile(
    this.contactsArrayIndex,
  );

  final ContactModel contactsArrayIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Dismissible(
          onDismissed: (_) {
            BlocProvider.of<ContactBloC>(context)
                .add(ContactDeleted(contactsArrayIndex));
          },
          key: Key(contactsArrayIndex.id),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
              child: ListTile(
                hoverColor: Colors.white,
                shape: RoundedRectangleBorder(),
                title: Text(contactsArrayIndex.name ?? '',
                    style: TextStyle(fontSize: 30, color: darkRed),
                    overflow: TextOverflow.ellipsis),
                subtitle: Text(
                    '${contactsArrayIndex.email ?? ''}\n${contactsArrayIndex.number ?? ''}'
                    '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, color: darkRed)),
                isThreeLine: true,
                trailing: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddEditPage(
                                  false,
                                  contactsArrayIndex,
                                )));
                  },
                ),
              ))),
    );
  }
}
