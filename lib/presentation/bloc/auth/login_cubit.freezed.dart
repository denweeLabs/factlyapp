// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

 Email get email; Password get password; bool get authInProgress; bool get resetPassInProgress; Option<Either<LoginFailure, LoginResult>> get failureOrSuccess; Option<Either<ChangePasswordFailure, Unit>> get resetPassFailureOrSuccess;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.authInProgress, authInProgress) || other.authInProgress == authInProgress)&&(identical(other.resetPassInProgress, resetPassInProgress) || other.resetPassInProgress == resetPassInProgress)&&(identical(other.failureOrSuccess, failureOrSuccess) || other.failureOrSuccess == failureOrSuccess)&&(identical(other.resetPassFailureOrSuccess, resetPassFailureOrSuccess) || other.resetPassFailureOrSuccess == resetPassFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,authInProgress,resetPassInProgress,failureOrSuccess,resetPassFailureOrSuccess);

@override
String toString() {
  return 'LoginState(email: $email, password: $password, authInProgress: $authInProgress, resetPassInProgress: $resetPassInProgress, failureOrSuccess: $failureOrSuccess, resetPassFailureOrSuccess: $resetPassFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 Email email, Password password, bool authInProgress, bool resetPassInProgress, Option<Either<LoginFailure, LoginResult>> failureOrSuccess, Option<Either<ChangePasswordFailure, Unit>> resetPassFailureOrSuccess
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? authInProgress = null,Object? resetPassInProgress = null,Object? failureOrSuccess = null,Object? resetPassFailureOrSuccess = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,authInProgress: null == authInProgress ? _self.authInProgress : authInProgress // ignore: cast_nullable_to_non_nullable
as bool,resetPassInProgress: null == resetPassInProgress ? _self.resetPassInProgress : resetPassInProgress // ignore: cast_nullable_to_non_nullable
as bool,failureOrSuccess: null == failureOrSuccess ? _self.failureOrSuccess : failureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<LoginFailure, LoginResult>>,resetPassFailureOrSuccess: null == resetPassFailureOrSuccess ? _self.resetPassFailureOrSuccess : resetPassFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<ChangePasswordFailure, Unit>>,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginState value)  $default,){
final _that = this;
switch (_that) {
case _LoginState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Email email,  Password password,  bool authInProgress,  bool resetPassInProgress,  Option<Either<LoginFailure, LoginResult>> failureOrSuccess,  Option<Either<ChangePasswordFailure, Unit>> resetPassFailureOrSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.email,_that.password,_that.authInProgress,_that.resetPassInProgress,_that.failureOrSuccess,_that.resetPassFailureOrSuccess);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Email email,  Password password,  bool authInProgress,  bool resetPassInProgress,  Option<Either<LoginFailure, LoginResult>> failureOrSuccess,  Option<Either<ChangePasswordFailure, Unit>> resetPassFailureOrSuccess)  $default,) {final _that = this;
switch (_that) {
case _LoginState():
return $default(_that.email,_that.password,_that.authInProgress,_that.resetPassInProgress,_that.failureOrSuccess,_that.resetPassFailureOrSuccess);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Email email,  Password password,  bool authInProgress,  bool resetPassInProgress,  Option<Either<LoginFailure, LoginResult>> failureOrSuccess,  Option<Either<ChangePasswordFailure, Unit>> resetPassFailureOrSuccess)?  $default,) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.email,_that.password,_that.authInProgress,_that.resetPassInProgress,_that.failureOrSuccess,_that.resetPassFailureOrSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _LoginState extends LoginState {
  const _LoginState({this.email = const Email.pure(), this.password = const Password.pure(), this.authInProgress = false, this.resetPassInProgress = false, this.failureOrSuccess = const None(), this.resetPassFailureOrSuccess = const None()}): super._();
  

@override@JsonKey() final  Email email;
@override@JsonKey() final  Password password;
@override@JsonKey() final  bool authInProgress;
@override@JsonKey() final  bool resetPassInProgress;
@override@JsonKey() final  Option<Either<LoginFailure, LoginResult>> failureOrSuccess;
@override@JsonKey() final  Option<Either<ChangePasswordFailure, Unit>> resetPassFailureOrSuccess;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.authInProgress, authInProgress) || other.authInProgress == authInProgress)&&(identical(other.resetPassInProgress, resetPassInProgress) || other.resetPassInProgress == resetPassInProgress)&&(identical(other.failureOrSuccess, failureOrSuccess) || other.failureOrSuccess == failureOrSuccess)&&(identical(other.resetPassFailureOrSuccess, resetPassFailureOrSuccess) || other.resetPassFailureOrSuccess == resetPassFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,authInProgress,resetPassInProgress,failureOrSuccess,resetPassFailureOrSuccess);

@override
String toString() {
  return 'LoginState(email: $email, password: $password, authInProgress: $authInProgress, resetPassInProgress: $resetPassInProgress, failureOrSuccess: $failureOrSuccess, resetPassFailureOrSuccess: $resetPassFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 Email email, Password password, bool authInProgress, bool resetPassInProgress, Option<Either<LoginFailure, LoginResult>> failureOrSuccess, Option<Either<ChangePasswordFailure, Unit>> resetPassFailureOrSuccess
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? authInProgress = null,Object? resetPassInProgress = null,Object? failureOrSuccess = null,Object? resetPassFailureOrSuccess = null,}) {
  return _then(_LoginState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as Password,authInProgress: null == authInProgress ? _self.authInProgress : authInProgress // ignore: cast_nullable_to_non_nullable
as bool,resetPassInProgress: null == resetPassInProgress ? _self.resetPassInProgress : resetPassInProgress // ignore: cast_nullable_to_non_nullable
as bool,failureOrSuccess: null == failureOrSuccess ? _self.failureOrSuccess : failureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<LoginFailure, LoginResult>>,resetPassFailureOrSuccess: null == resetPassFailureOrSuccess ? _self.resetPassFailureOrSuccess : resetPassFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<ChangePasswordFailure, Unit>>,
  ));
}


}

// dart format on
