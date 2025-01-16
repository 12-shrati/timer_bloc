part of "./timer_bloc.dart";

sealed class TimerEvent extends Equatable {}

class OnTimerStarted extends TimerEvent {
  OnTimerStarted({required this.duration});
  final int duration;
  @override
  List<Object?> get props => [];
}

class OnTimerPlay extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class OnTimerPause extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class OnTimerResumed extends TimerEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class OnTimerReset extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class OnTimeTicker extends TimerEvent {
  final int duration;
  OnTimeTicker({required this.duration});
  @override
  List<Object?> get props => [];
}
