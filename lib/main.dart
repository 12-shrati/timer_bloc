import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_1/ticker.dart';
import 'package:timer_1/timer_export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => TimerBloc(ticker: Ticker()))
    ],
      child: MaterialApp(
        home: TimerView(),
      ),
    );
  }
}
