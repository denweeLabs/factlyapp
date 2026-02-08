part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.anonymous() = _Anonymous;
  const factory AuthState.authenticated() = _Authenticated;

  bool get isUnauthenticated =>
      maybeWhen(unauthenticated: () => true, orElse: () => false);

  bool get isAuthenticated =>
      maybeWhen(authenticated: () => true, orElse: () => false);

  bool get isAnonymous =>
      maybeWhen(anonymous: () => true, orElse: () => false);

  bool get isAnonymousOrAuthenticated =>
      maybeWhen(anonymous: () => true, authenticated: () => true, orElse: () => false);
}
