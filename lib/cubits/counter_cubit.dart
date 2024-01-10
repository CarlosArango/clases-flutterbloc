import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  // Método para incrementar el contador
  void increment() {
    emit(state + 1);
  }

  // Método para decrementar el contador
  void decrement() {
    emit(state == 0 ? 0 : state - 1);
  }
}
