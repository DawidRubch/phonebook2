import 'package:flutter_test/flutter_test.dart';
import 'package:phonebook2/features/data/models/contact.dart';
import 'package:phonebook2/features/domain/entity/contactEntity.dart';

void main() {
  final tContactModel = ContactModel(
      name: 'Dawid', email: 'dawidek33131@gmail.com', number: 535480759);
  final exampleMap = {
    "name": tContactModel.name,
    "email": tContactModel.email,
    "number": tContactModel.number,
    "id": tContactModel.id
  };

  test('should be a subclass of Contact', () {
    expect(tContactModel, isA<Contact>());
  });

  group('toJsonEncodable', () {
    test('should return a Json map', () {
      final result = tContactModel.toJsonEncodable();

      expect(result, exampleMap);
    });
  });

  group('fromJsonEncodable', () {
    test('should return a ContactModel', () {
      final result = ContactModel.fromJsonEncodable(exampleMap);

      expect(result, tContactModel);
    });
  });
}
