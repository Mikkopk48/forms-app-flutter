import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presenation/blocs/cubit_counter/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: context.read<CounterCubit>().reset,
            icon: const Icon(Icons.change_circle_outlined),
          ),
        ],
        title: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text('transaction count: ${state.transactionCount}');
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text(
              '${state.counter}',
              style: const TextStyle(fontSize: 32),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Text('+3'),
            onPressed: () => context.read<CounterCubit>().increaseBy(3),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Text('+2'),
            onPressed: () => context.read<CounterCubit>().increaseBy(2),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            child: const Text('+1'),
            onPressed: () => context.read<CounterCubit>().increaseBy(1),
          ),
        ],
      ),
    );
  }
}
