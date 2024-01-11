// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on<CounterIncrementBtnPressed>((event, emit) {
      emit(CounterChanged(state.counter + 1));
    });
    on<CounterDecrementBtnPressed>((event, emit) {
      emit(CounterChanged(state.counter - 1));
    });
  }

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    print(change);
  }
}

void main() async {
  final bloc = CounterBloc();

  print(bloc.state.counter);

  bloc.add(const CounterIncrementBtnPressed());
  await Future.delayed(const Duration(seconds: 0));
  print(bloc.state.counter);
  bloc.add(const CounterIncrementBtnPressed());
  await Future.delayed(const Duration(seconds: 0));
  print(bloc.state.counter);
  bloc.add(const CounterIncrementBtnPressed());
  await Future.delayed(const Duration(seconds: 0));
  print(bloc.state.counter);

  bloc.close();
}
