import 'package:uuid/uuid.dart';

import '../../domain/entity/contactEntity.dart';

class ContactModel extends Contact {
  ContactModel({name, email, number, id})
      : super(name: name, email: email, number: number, id: id ??= Uuid().v4());

  Map<String, dynamic> toJsonEncodable() =>
      {"name": name, "email": email, "number": number, "id": id};

  factory ContactModel.fromJsonEncodable(jsonMap) {
    return ContactModel(
        name: jsonMap["name"],
        email: jsonMap["email"],
        number: jsonMap["number"],
        id: jsonMap["id"]);
  }
}
