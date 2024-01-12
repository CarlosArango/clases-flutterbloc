import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormState> {
  FormBloc() : super(const FormState.initial()) {
    on((event, emit) => null);
    on<FormNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<FormEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
  }

  @override
  void onChange(Change<FormState> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onTransition(Transition<FormEvent, FormState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
