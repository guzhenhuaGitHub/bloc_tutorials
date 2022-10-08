part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent extends Equatable {
  const TimerEvent();
  @override
  List<Object?> get props => [];
}

class TimerStarted extends TimerEvent {
  TimerStarted({required this.duration});

  final int duration;

  @override
  List<Object?> get props => [duration];
}

class TimerPaused extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent {
  TimerTicked({required this.duration});

  final int duration;

  @override
  List<Object?> get props => [duration];
}
