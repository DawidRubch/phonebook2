import 'package:phonebook2/features/data/models/contact.dart';
import 'package:phonebook2/features/data/models/contactArray.dart';

final ContactModel tContactModel = ContactModel(
    name: 'Dawid', email: 'dawidek33131@gmail.com', number: 3333333);

final ContactArrayModel tContactsArray = ContactArrayModel([
  ContactModel(
      name: 'Dawid', email: 'dawidek33131@gmail.com', number: 535480759),
  ContactModel(name: 'Tomek', email: 'tomek33131@gmail.com', number: 665770260)
]);

final ContactArrayModel editedContactsArray = ContactArrayModel([
  ContactModel(
      name: 'Dawid',
      email: 'dawidek33131@gmail.com',
      number: 535480759,
      id: tContactsArray.contactArray[0].id),
  ContactModel(
      name: 'Tomek',
      email: 'tomek33131@gmail.com',
      number: 665770260,
      id: tContactsArray.contactArray[1].id)
]);

final ContactArrayModel tContactsArray2 = ContactArrayModel([
  ContactModel(
      name: 'Dawid',
      email: 'dawidek33131@gmail.com',
      number: 535480759,
      id: tContactsArray.contactArray[0].id),
  ContactModel(
      name: 'Tomek',
      email: 'tomek33131@gmail.com',
      number: 665770260,
      id: tContactsArray.contactArray[1].id),
  ContactModel(
      name: 'Dawid',
      email: 'dawidek33131@gmail.com',
      number: 3333333,
      id: tContactModel.id)
]);

final ContactArrayModel tSearchContactArray = ContactArrayModel([
  ContactModel(
    name: 'Dawid',
    email: 'dawidek33131@gmail.com',
    number: 535480759,
  ),
  ContactModel(
    name: 'Tomek',
    email: 'dawid@gmail.com',
    number: 665770260,
  ),
  ContactModel(
    name: 'Wladek',
    email: 'dawidek33131@gmail.com',
    number: 'dawid',
  )
]);

final ContactArrayModel tSearchContactArrayWithFirstEl =
    ContactArrayModel([tSearchContactArray.contactArray[0]]);

final List<Map<String, dynamic>> exampleMap = [
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

final List<Map<String, dynamic>> exampleMap2 = [
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
  },
  {
    "name": tContactModel.name,
    "email": tContactModel.email,
    "number": tContactModel.number,
    "id": tContactModel.id
  }
];

final List<Map<String, dynamic>> searchMap = [
  {
    "name": tSearchContactArray.contactArray[0].name,
    "email": tSearchContactArray.contactArray[0].email,
    "number": tSearchContactArray.contactArray[0].number,
    "id": tSearchContactArray.contactArray[0].id
  },
  {
    "name": tSearchContactArray.contactArray[1].name,
    "email": tSearchContactArray.contactArray[1].email,
    "number": tSearchContactArray.contactArray[1].number,
    "id": tSearchContactArray.contactArray[1].id
  },
  {
    "name": tSearchContactArray.contactArray[2].name,
    "email": tSearchContactArray.contactArray[2].email,
    "number": tSearchContactArray.contactArray[2].number,
    "id": tSearchContactArray.contactArray[2].id
  }
];
