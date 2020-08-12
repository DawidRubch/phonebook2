import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact_bloc.dart';
import 'colors.dart';

//Text input with 'search'
class AppBarTextField extends StatelessWidget {
  final String filter;

  AppBarTextField(this.filter);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (keyword) {
        BlocProvider.of<ContactBloC>(context)
            .add(SearchContactsArray(keyword, filter));
      },
      decoration: InputDecoration(
          hintStyle: TextStyle(color: lightPink),
          hintText: 'Search',
          border: InputBorder.none),
    );
  }
}
