import 'package:flutter_test/flutter_test.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mockito/mockito.dart';

import 'package:phonebook2/features/data/database/contactsLocalDb.dart';
import 'package:phonebook2/features/data/models/contact.dart';
import 'package:phonebook2/features/data/models/contactArray.dart';
import './testing_variables.dart';

class MockLocalStorage extends Mock implements LocalStorage {}

main() {
  ContactsLocalDbImpl localDbImpl;
  MockLocalStorage mockLocalStorage;

  setUp(() {
    mockLocalStorage = MockLocalStorage();
    localDbImpl = ContactsLocalDbImpl(localStorage: mockLocalStorage);
  });

  group("loadContacts", () {
    test('should load Contacts, when there is some data in LocalStorage',
        () async {
      when(mockLocalStorage.getItem(any)).thenReturn(exampleMap);
      final result = await localDbImpl.loadContacts();
      verify(mockLocalStorage.getItem(key));
      expect(result, tContactsArray);
    });

    test('should load an empty Array, when there is no data in LocalStorage',
        () async {
      when(mockLocalStorage.getItem(key)).thenReturn(null);
      final result = await localDbImpl.loadContacts();
      verify(mockLocalStorage.getItem(key));
      expect(result, ContactArrayModel(<ContactModel>[]));
    });
  });
  group('saveContact', () {
    test('should save Contact to the Local Storage', () {
      localDbImpl.saveContacts(tContactsArray);

      verify(mockLocalStorage.setItem(key, tContactsArray.toJsonEncodable()));
    });
  });
  group("addContact", () {
    test("should add Contact to LocalStorage", () async {
      when(mockLocalStorage.getItem(key)).thenReturn(exampleMap);
      await localDbImpl.addContact(tContactModel);

      verify(mockLocalStorage.setItem(key, tContactsArray2.toJsonEncodable()));
    });
  });
  group("deleteContact", () {
    test("should remove Contact from LocalStorage", () async {
      when(mockLocalStorage.getItem(key)).thenReturn(exampleMap2);

      await localDbImpl.deleteContact(tContactModel);

      verify(mockLocalStorage.setItem(key, tContactsArray.toJsonEncodable()));
    });
  });
  group('updateContact', () {
    test('should update one Contact in LocalStorage', () async {
      when(mockLocalStorage.getItem(key)).thenReturn(exampleMap);
      await localDbImpl.updateContact(tContactModel);
      verify(
          mockLocalStorage.setItem(key, editedContactsArray.toJsonEncodable()));
    });
  });

  group('searchContact', () {
    final List<String> filters = ["All", "Name", "Email", "Number"];
    test(
        'should show an updatedArray with only matching words in every property',
        () async {
      final String tKeyWord = "Dawid";
      when(mockLocalStorage.getItem(key)).thenReturn(searchMap);
      final result = await localDbImpl.searchContact(tKeyWord, filters[0]);

      expect(result, tSearchContactArray);
    });

    test('should show an empty Array, when no matching words ', () async {
      final String tKeyWord = "testtesttes123test";
      when(mockLocalStorage.getItem(key)).thenReturn(searchMap);
      final result = await localDbImpl.searchContact(tKeyWord, filters[0]);
      expect(result, ContactArrayModel(<ContactModel>[]));
    });
    test('''should show an Array with one element,
         with matching word only in one property,
         filtered by one property ''', () async {
      final String tKeyWord = "dawid";

      when(mockLocalStorage.getItem(key)).thenReturn(searchMap);

      final result = await localDbImpl.searchContact(tKeyWord, filters[1]);

      expect(result, tSearchContactArrayWithFirstEl);
    });
    test('''should show an emptyArray,
         when no matching words in one property,
         filtered by one property ''', () async {
      final String tKeyWord = "test314152152";

      when(mockLocalStorage.getItem(key)).thenReturn(searchMap);

      final result = await localDbImpl.searchContact(tKeyWord, filters[2]);

      expect(result, ContactArrayModel(<ContactModel>[]));
    });
  });
}
