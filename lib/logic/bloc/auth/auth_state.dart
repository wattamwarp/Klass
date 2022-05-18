part of 'auth_bloc.dart';

enum AuthStatus { unkwown, authenticated, unauthenticated }

// ignore: must_be_immutable
class AuthState extends Equatable {
  AuthState({this.user, this.status = AuthStatus.unkwown});
  factory AuthState.unknown() => AuthState();

  factory AuthState.authenticated({required auth.User user}) {
    return AuthState(user: user, status: AuthStatus.authenticated);
  }

  factory AuthState.unauthenticated() =>
      AuthState(status: AuthStatus.unauthenticated);

  final auth.User? user;
  AuthStatus status;

  @override
  List<Object> get props => [user!, status];
}
