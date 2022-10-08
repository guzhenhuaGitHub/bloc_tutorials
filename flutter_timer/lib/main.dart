import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/simple_bloc_observer.dart';

import 'app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const App());
}
