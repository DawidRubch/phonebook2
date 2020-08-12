import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:phonebook2/features/data/database/contactsLocalDb.dart';
import 'package:phonebook2/features/data/models/contact.dart';
import 'package:phonebook2/features/data/models/contactArray.dart';
import 'package:phonebook2/features/error/error.dart';
import 'package:phonebook2/features/presentation/bloc/contact_bloc.dart';

class MockContactsLocalDbImpl extends Mock implements ContactsLocalDbImpl {}

void main() {
  MockContactsLocalDbImpl mockContactsLocalDbImpl;
  setUp(() {
    mockContactsLocalDbImpl = MockContactsLocalDbImpl();
  });
  final tContactArray = ContactArrayModel(<ContactModel>[
    ContactModel(
        name: "Dawid", email: "dawidek33131@gmail.com", number: 535480759)
  ]);
  group('ContactLoaded', () {
    blocTest(
      '''should emit
       [ContactInitial(),ContactLoadingProgress(),ContactLoadSuccess(tContactArray)], if  
       successfull''',
      expect: [ContactLoadingProgress(), ContactLoadSuccess(tContactArray)],
      build: () async {
        when(mockContactsLocalDbImpl.loadContacts())
            .thenAnswer((_) async => tContactArray);
        return ContactBloC(contactsLocalDbImpl: mockContactsLocalDbImpl);
      },
      act: (bloc) => bloc.add(ContactLoaded()),
      skip: 0,
    );

    blocTest(
        '''should emit
       [ContactInitial(),ContactLoadingProgress(),ContactLoadError(), if unsucessfull] 
       
    ''',
        build: () async {
          when(mockContactsLocalDbImpl.loadContacts())
              .thenThrow((_) async => LoadError());
          return ContactBloC(contactsLocalDbImpl: mockContactsLocalDbImpl);
        },
        expect: [
          ContactLoadingProgress(),
          ContactLoadError(),
        ],
        skip: 0,
        act: (bloc) => bloc.add(ContactLoaded()));
  });
}
