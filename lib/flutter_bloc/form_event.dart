part of 'form_bloc.dart';

class FormEvent extends Equatable {
  const FormEvent();
  @override
  List<Object?> get props => [];
}

class FormNameChanged extends FormEvent {
  const FormNameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [];
}

class FormEmailChanged extends FormEvent {
  const FormEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class FormSubmitted extends FormEvent {
  const FormSubmitted();
}
