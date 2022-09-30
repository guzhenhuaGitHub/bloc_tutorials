import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'app.dart';
import 'simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ),
  );
}
