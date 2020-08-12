import 'package:phonebook2/features/data/models/contact.dart';
import 'package:phonebook2/features/domain/entity/contactArrayEntity.dart';

class ContactArrayModel extends ContactArray {
  ContactArrayModel(contactArray) : super(contactArray);

  toJsonEncodable() =>
      contactArray.map((contact) => contact.toJsonEncodable()).toList();

  factory ContactArrayModel.fromJsonEncodable(jsonMapArray) {
    final contactsArray = jsonMapArray
        .map((jsonMap) => ContactModel.fromJsonEncodable(jsonMap))
        .toList();
    return ContactArrayModel(contactsArray);
  }
}
