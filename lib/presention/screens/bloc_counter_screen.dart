import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presention/blocs/couter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _CounterCounterView(),
    );
  }
}

class _CounterCounterView extends StatelessWidget {
  const _CounterCounterView();

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().incresedBy(value);
  }

  void resetCounter(BuildContext context) {
    context.read<CounterBloc>().add(CounterReset());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().resetCounter(),
            // context.read<CounterBloc>().add(CounterReset()),
            icon: const Icon(Icons.change_circle_outlined),
          ),
        ],
        title: context.select(
          (CounterBloc counterBloc) =>
              Text('TransactionCount ${counterBloc.state.transactionCount}'),
        ),
      ),

      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text('Counter value: ${counterBloc.state.counter}'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Text('+3'),
            onPressed:
                () => increaseCounterBy(
                  context,
                  3,
                ), //context.read<CounterCubit>().increaseBy(3),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Text('+2'),
            onPressed:
                () => increaseCounterBy(
                  context,
                  2,
                ), // context.read<CounterCubit>().increaseBy(2),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Text('+1'),
            onPressed:
                () => increaseCounterBy(
                  context,
                ), // context.read<CounterCubit>().increaseBy(1),
          ),
        ],
      ),
    );
  }
}
