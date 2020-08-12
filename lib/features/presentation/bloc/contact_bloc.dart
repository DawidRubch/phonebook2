import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/database/contactsLocalDb.dart';
import '../../data/models/contact.dart';
import '../../data/models/contactArray.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloC extends Bloc<ContactEvent, ContactState> {
  ContactState get initialState => ContactLoadingProgress();
  final ContactsLocalDbImpl contactsLocalDbImpl;

  ContactBloC({@required this.contactsLocalDbImpl})
      : super(ContactLoadingProgress());

  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    if (event is ContactLoaded) {
      try {
        final ContactArrayModel contactsArray =
            await contactsLocalDbImpl.loadContacts();
        yield ContactLoadSuccess(contactsArray);
      } catch (_) {
        yield ContactLoadError();
      }
    } else if (event is ContactAdded) {
      if (state is ContactLoadSuccess) {
        contactsLocalDbImpl.addContact(event.contact);
        yield* _mapLoadedToState();
      }
    } else if (event is ContactUpdated) {
      if (state is ContactLoadSuccess) {
        contactsLocalDbImpl.updateContact(event.contact);
        yield* _mapLoadedToState();
      }
    } else if (event is ContactDeleted) {
      if (state is ContactLoadSuccess) {
        contactsLocalDbImpl.deleteContact(event.contact);
        yield* _mapLoadedToState();
      }
    } else if (event is SearchContactsArray) {
      if (state is ContactLoadSuccess) {
        final ContactArrayModel searchedArray = await contactsLocalDbImpl
            .searchContact(event.keyword, event.filter);
        yield ContactLoadSuccess(searchedArray);
      }
    }
  }

  Stream<ContactState> _mapLoadedToState() async* {
    final ContactArrayModel contactsArray =
        await contactsLocalDbImpl.loadContacts();
    yield ContactLoadSuccess(contactsArray);
  }
}
