import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final name;
  final email;
  final number;
  final id;

  Contact({this.name, this.email, this.number, this.id})
      : super([name, email, number, id]);
}
