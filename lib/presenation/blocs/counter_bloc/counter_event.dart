part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncresed extends CounterEvent {
  final int value;
  const CounterIncresed(this.value);
}
