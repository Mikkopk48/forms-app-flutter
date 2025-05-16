import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class IncrementEvent extends CounterEvent {
  final int value;
  const IncrementEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class DecrementEvent extends CounterEvent {
  final int value;
  const DecrementEvent(this.value);

  @override
  List<Object?> get props => [value];
}
