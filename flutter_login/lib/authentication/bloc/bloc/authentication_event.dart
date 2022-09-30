part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object?> get props => [status];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
