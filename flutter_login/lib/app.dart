import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/bloc/bloc/authentication_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'home/view/home_page.dart';
import 'login/view/login_page.dart';
import 'splash/view/splash_page.dart';

class App extends StatelessWidget {
  const App(
      {Key? key,
      required this.authenticationRepository,
      required this.userRepository})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) => RepositoryProvider.value(
        value: authenticationRepository,
        child: BlocProvider(
          create: (_) => AuthenticationBloc(
            authenticationRepository: authenticationRepository,
            userRepository: userRepository,
          ),
          child: const AppView(),
        ),
      );
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: _navigatorKey,
        builder: (context, child) =>
            BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.unknown:
                break;
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil(
                    HomePage.route(), (route) => false);
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil(
                    LoginPage.route(), (route) => false);
                break;
            }
          },
          child: child,
        ),
        onGenerateRoute: (settings) =>  SplashPage.route(),
      );
}
