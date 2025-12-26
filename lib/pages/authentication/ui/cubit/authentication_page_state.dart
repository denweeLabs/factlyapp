part of 'authentication_page_cubit.dart';

@freezed
class AuthenticationPageState with _$AuthenticationPageState {
  const AuthenticationPageState._();
  const factory AuthenticationPageState.initial() = _Initial;
  const factory AuthenticationPageState.success(
      AuthorizationActionResult result) = _Success;
  const factory AuthenticationPageState.popped() = _Popped;

  Option<AuthorizationActionResult> get successResult => maybeWhen(
        success: (result) => some(result),
        orElse: none,
      );

  bool get isPopped => maybeWhen(
        popped: () => true,
        orElse: () => false,
      );
}
