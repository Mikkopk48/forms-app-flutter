import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Cubit')),
      body: Center(child: Text(context.watch()>)),
      floatingActionButton: Column(
        children: [
          FloatingActionButton(child: Text('+3'), onPressed: () {}),
          FloatingActionButton(child: Text('+2'), onPressed: () {}),
          FloatingActionButton(child: Text('+1'), onPressed: () {}),
        ],
      ),
    );
  }
}
