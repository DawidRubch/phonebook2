import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';

import 'features/data/database/contactsLocalDb.dart';
import 'features/presentation/bloc/contact_bloc.dart';
import 'features/presentation/screens/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloC>(
      child: HomePage(),
      create: (context) => ContactBloC(
          contactsLocalDbImpl:
              ContactsLocalDbImpl(localStorage: LocalStorage(key)))
        ..add(ContactLoaded()),
    );
  }
}
