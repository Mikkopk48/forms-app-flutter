import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forms_app/presenation/blocs/counter_bloc/counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterEvent>((event, emit) {
      emit(
        state.copyWith(
          counter: state.counter + event.value,
          transactionCount: state.transactionCount + 1,
        ),
      );
    });
  }
}
