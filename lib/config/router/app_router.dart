import 'package:forms_app/presenation/screens/bloc_counter_screen.dart';
import 'package:forms_app/presenation/screens/cubit_counter_screen.dart';
import 'package:forms_app/presenation/screens/home_screen.dart';
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
);
