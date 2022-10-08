part of 'timer_bloc.dart';

@immutable
abstract class TimerState extends Equatable {
  const TimerState(this.duration);

  final int duration;

  @override
  List<Object?> get props => [duration];

  @override
  String toString() => '$runtimeType { duration: $duration }';
}

class TimerInitial extends TimerState {
  const TimerInitial(super.duration);
}

class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
