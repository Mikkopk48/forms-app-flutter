import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 5));
  void increaseBy(int value) {
    // state.counter = 10;
    emit(
      state.copyWith(
        counter: state.counter + value,
        transactionCount: state.transactionCount + 1, //!= state.counter,
      ),
    );
  }

  void reset() {
    emit(
      state.copyWith(
        counter: 0,
        // transactionCount: 0, // Opcional según el comportamiento deseado
      ),
    );
  }
}
