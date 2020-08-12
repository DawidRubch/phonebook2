import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';
import 'widgets/addButton.dart';
import 'widgets/appBarTextField.dart';
import 'widgets/colors.dart';
import 'widgets/contactsListView.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final filterMenu = ["All", "Name", "Email", "Number"];
  String filterChoice = "All";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
                onSelected: (String filter) {
                  setState(() {
                    filterChoice = filter;
                  });
                },
                icon: Icon(Icons.menu, color: lightPink),
                itemBuilder: (context) => filterMenu
                    .map((filter) => PopupMenuItem(
                          value: filter,
                          child: Text(
                            filter,
                            style: TextStyle(color: lightPink),
                          ),
                        ))
                    .toList())
          ],
          backgroundColor: Colors.white,
          title: AppBarTextField(filterChoice),
          leading: Icon(
            Icons.search,
            color: lightPink,
          ),
        ),
        body: BlocBuilder<ContactBloC, ContactState>(
          builder: (context, state) {
            if (state is ContactLoadingProgress) {
              return Center(
                child: CircularProgressIndicator(backgroundColor: lightPink),
              );
            } else if (state is ContactLoadSuccess) {
              return ContactsListView(state.contacts.contactArray);
            } else if (state is ContactLoadError) {
              return ErrorMessage();
            }
          },
        ),
        floatingActionButton: AddButton(),
        backgroundColor: Color(0xffEBE4E4),
      ),
    );
  }
}

class ErrorMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Something went wrong',
      style: TextStyle(color: darkRed, fontSize: 30),
    ));
  }
}
