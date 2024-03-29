import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_app_klass/data/repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepositroy authRepositroy})
      : _authRepositroy = authRepositroy,
        super(AuthState.unknown()) {
    _usersubscription = _authRepositroy.user
        .listen((user) => add(AuthUserChanged(user: user!)));
  }
  final AuthRepositroy _authRepositroy;
  StreamSubscription<auth.User?>? _usersubscription;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthUserChanged) {
      yield* _mapAuthUserChangedToState(event);
    } else if (event is AuthLogoutRequested) {
      yield* await _authRepositroy.logOut();
    }
  }

  @override
  Future<void> close() {
    _usersubscription?.cancel();
    return super.close();
  }

  Stream<AuthState> _mapAuthUserChangedToState(AuthUserChanged event) async* {
    yield event.user != null
        ? AuthState.authenticated(user: event.user)
        : AuthState.unauthenticated();
  }
}
