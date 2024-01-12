part of 'counter_bloc.dart';

// implements vs extends
sealed class CounterState {
  final int counter;
  const CounterState(this.counter);
}

class CounterInitial extends CounterState {
  const CounterInitial(super.counter);
}

class CounterChanging extends CounterState {
  const CounterChanging(super.counter);
}

class CounterChanged extends CounterState {
  const CounterChanged(super.counter);
}
