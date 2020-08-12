import 'package:flutter_test/flutter_test.dart';
import 'package:phonebook2/features/data/models/contact.dart';
import 'package:phonebook2/features/data/models/contactArray.dart';
import 'package:phonebook2/features/domain/entity/contactArrayEntity.dart';

main() {
  final ContactArrayModel tContactsArray = ContactArrayModel(<ContactModel>[
    ContactModel(
        name: 'Dawid', email: 'dawidek33131@gmail.com', number: 535480759),
    ContactModel(
        name: 'Tomek', email: 'tomek33131@gmail.com', number: 665770260)
  ]);

  final dynamic exampleMap = [
    {
      "name": tContactsArray.contactArray[0].name,
      "email": tContactsArray.contactArray[0].email,
      "number": tContactsArray.contactArray[0].number,
      "id": tContactsArray.contactArray[0].id
    },
    {
      "name": tContactsArray.contactArray[1].name,
      "email": tContactsArray.contactArray[1].email,
      "number": tContactsArray.contactArray[1].number,
      "id": tContactsArray.contactArray[1].id
    }
  ];

  test('should be a subclass of ContactArray', () {
    expect(tContactsArray, isA<ContactArray>());
  });
  group('toJsonEncodable', () {
    test('should return a json Map Array', () {
      final result = tContactsArray.toJsonEncodable();
      expect(exampleMap, result);
    });
  });

  group('fromJsonEncodable', () {
    test('should return a ContactArrayModel from json Map Array', () {
      final result = ContactArrayModel.fromJsonEncodable(exampleMap);

      expect(result, tContactsArray);
    });
  });
}
