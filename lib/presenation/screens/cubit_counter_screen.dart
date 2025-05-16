import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presenation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterVeiw(),
    );
  }
}

class _CubitCounterVeiw extends StatelessWidget {
  const _CubitCounterVeiw();

  void incresedCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().incresedBy(value);
  }

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit counter ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            print('Estado cambió');
            return Text("Counter value: ${state.counter}");
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: const Text('+3'),
            onPressed: () => incresedCounterBy(context, 3),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: 2,
            child: const Text('+2'),
            onPressed: () => context.read<CounterCubit>().incresedBy(2),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            heroTag: 3,
            child: const Text('+1'),
            onPressed: () => context.read<CounterCubit>().incresedBy(1),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
