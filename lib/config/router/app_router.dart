import 'package:flutter/material.dart';
import 'package:forms_app/presention/screens/bloc_counter_screen.dart';
import 'package:forms_app/presention/screens/cubit_counter_screen.dart';
import 'package:forms_app/presention/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterScreen(),
    ),
    GoRoute(
      path: '/counter-bloc',
      builder: (context, state) => const BlocCounterScreen(),
    ),
  ],
  errorBuilder:
      (context, state) =>
          Scaffold(body: Center(child: Text('Routing error: ${state.error}'))),
);
