import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counter: 5));
  void increseBy(int value) {
    // state.counter = 10;
    emit(
      state.copyWith(
        counter: state.counter + value,
        transactionCount: state.transactionCount + value, //!= state.counter,
      ),
    );
  }

  void reset() {
    emit(
      state.copyWith(
        counter: 0,
        // transactionCount: state.transactionCount + 1, //!= state.counter,
      ),
    );
  }
}
