part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ContactLoaded extends ContactEvent {}

class ContactAdded extends ContactEvent {
  final ContactModel contact;

  ContactAdded(this.contact);

  @override
  List<Object> get props => [contact];
}

class ContactUpdated extends ContactEvent {
  final ContactModel contact;

  ContactUpdated(this.contact);

  @override
  List<Object> get props => [contact];
}

class ContactDeleted extends ContactEvent {
  final ContactModel contact;

  ContactDeleted(this.contact);

  @override
  List<Object> get props => [contact];
}

class SearchContactsArray extends ContactEvent {
  final String keyword;
  final String filter;

  SearchContactsArray(this.keyword, this.filter);

  @override
  List<Object> get props => [keyword, filter];
}
