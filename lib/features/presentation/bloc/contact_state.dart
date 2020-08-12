part of 'contact_bloc.dart';

@immutable
abstract class ContactState extends Equatable {
  @override
  List<Object> get props => [];
}

class ContactLoadingProgress extends ContactState {}

class ContactLoadSuccess extends ContactState {
  final ContactArrayModel contacts;

  ContactLoadSuccess([this.contacts]);

  @override
  List<Object> get props => [contacts];
}

class ContactLoadError extends ContactState {}
