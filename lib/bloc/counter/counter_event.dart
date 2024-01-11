part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();
  @override
  List<Object?> get props => [];
}

class CounterIncrementBtnPressed extends CounterEvent {
  const CounterIncrementBtnPressed();
}

class CounterDecrementBtnPressed extends CounterEvent {
  const CounterDecrementBtnPressed();
}
