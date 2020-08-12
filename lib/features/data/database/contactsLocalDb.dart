import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';

import '../models/contact.dart';
import '../models/contactArray.dart';

abstract class ContactsLocalDb {
  void saveContacts(ContactArrayModel contacts);
  Future<ContactArrayModel> loadContacts();
  addContact(ContactModel contact);
  updateContact(ContactModel contact);
  deleteContact(ContactModel contact);
  FutureOr<ContactArrayModel> searchContact(String keyword, String filter);
}

const String key = 'ContactsLocalStorage';

class ContactsLocalDbImpl extends ContactsLocalDb {
  final LocalStorage localStorage;

  ContactsLocalDbImpl({@required this.localStorage});

  void saveContacts(ContactArrayModel contacts) {
    localStorage.setItem(key, contacts.toJsonEncodable());
  }

  Future<ContactArrayModel> loadContacts() async {
    await localStorage.ready;
    final jsonMap = localStorage.getItem(key);
    if (jsonMap != null) {
      return Future.value(ContactArrayModel.fromJsonEncodable(jsonMap));
    } else {
      return Future.value(ContactArrayModel(<ContactModel>[]));
    }
  }

  addContact(ContactModel contact) async {
    final ContactArrayModel contactArrayModel = await loadContacts();
    contactArrayModel.contactArray.add(contact);

    saveContacts(contactArrayModel);
  }

  deleteContact(ContactModel contact) async {
    final ContactArrayModel contactArrayModel = await loadContacts();
    final updatedArray = contactArrayModel.contactArray
        .where((contactModel) => contactModel.id != contact.id)
        .toList();
    saveContacts(ContactArrayModel(updatedArray));
  }

  updateContact(ContactModel contact) async {
    final ContactArrayModel contactArrayModel = await loadContacts();

    final updatedArray = contactArrayModel.contactArray
        .map((contactModel) =>
            contact.id == contactModel.id ? contact : contactModel)
        .toList();

    saveContacts(ContactArrayModel(updatedArray));
  }

  FutureOr<ContactArrayModel> searchContact(
      String keyWord, String filter) async {
    final ContactArrayModel contactArrayModel = await loadContacts();

    bool filterBy(ContactModel contact, dynamic filter) {
      return filter.toString().toLowerCase().contains(keyWord.toLowerCase());
    }

    switch (filter) {
      case "Name":
        return ContactArrayModel(contactArrayModel.contactArray
            .where((contactModel) => filterBy(contactModel, contactModel.name))
            .toList());
        break;
      case "Email":
        return ContactArrayModel(contactArrayModel.contactArray
            .where((contactModel) => filterBy(contactModel, contactModel.email))
            .toList());
        break;
      case "Number":
        return ContactArrayModel(contactArrayModel.contactArray
            .where(
                (contactModel) => filterBy(contactModel, contactModel.number))
            .toList());
        break;
      case "All":
        return ContactArrayModel(contactArrayModel.contactArray
            .where((contactModel) =>
                filterBy(contactModel, contactModel.name) ||
                filterBy(contactModel, contactModel.email) ||
                filterBy(contactModel, contactModel.number))
            .toList());
        break;
    }
  }
}
