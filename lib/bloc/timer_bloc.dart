import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_1/ticker.dart';

part './timer_event.dart';
part './timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    on<OnTimerStarted>(_onTimerStarted);
    on<OnTimeTicker>(_onTimeTicker);
    on<OnTimerPlay>(_onTimerPlay);
    on<OnTimerPause>(_onTimerPause);
    on<OnTimerReset>(_onTimerReset);
  }

  final Ticker _ticker;
  static const int _duration = 60;

  StreamSubscription<int>? _streamSubscription;

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  void _onTimerStarted(OnTimerStarted event, Emitter<TimerState> emit) {
    emit(TimerInitial(event.duration));
    _streamSubscription?.cancel();
    _streamSubscription = _ticker.tick(event.duration).listen((duration) {
      add(OnTimeTicker(duration: duration));
    });
  }

  void _onTimeTicker(OnTimeTicker event, Emitter<TimerState> emit) {
    emit(
        event.duration > 0 ? TimerInProgress(event.duration) : TimerComplete());
  }

  void _onTimerPlay(OnTimerPlay event, Emitter<TimerState> emit) {
    if (state is TimerPause) {
      _streamSubscription?.resume();
      emit(TimerInProgress(state.duration));
    }
  }

  void _onTimerPause(OnTimerPause event, Emitter<TimerState> emit) {
    if (state is TimerInProgress) {
      _streamSubscription?.pause();
      emit(TimerPause(state.duration));
    }
  }

  void _onTimerReset(OnTimerReset event, Emitter<TimerState> emit) {
    _streamSubscription?.cancel();
    emit(TimerInitial(_duration));
  }
}
