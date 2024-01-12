part of 'form_bloc.dart';

enum FormStatus {
  initial,
  valid,
  invalid,
  submitting,
  success,
  failure,
}

class FormState extends Equatable {
  const FormState({
    required this.name,
    required this.email,
    required this.errorMsg,
  });

  final String name;
  final String email;
  final String errorMsg;

  const FormState.initial()
      : name = '',
        email = '',
        errorMsg = '';

  FormState copyWith({
    String? name,
    String? email,
    String? errorMsg,
  }) {
    return FormState(
      name: name ?? this.name,
      email: email ?? this.email,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [name, email, errorMsg];
}
