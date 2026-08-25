// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChangePasswordState {

 Password get oldPassword; Password get newPassword; Option<Either<ChangePasswordFailure, Unit>> get changeFailureOrSuccess; bool get isChanging;
/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordStateCopyWith<ChangePasswordState> get copyWith => _$ChangePasswordStateCopyWithImpl<ChangePasswordState>(this as ChangePasswordState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordState&&(identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword)&&(identical(other.changeFailureOrSuccess, changeFailureOrSuccess) || other.changeFailureOrSuccess == changeFailureOrSuccess)&&(identical(other.isChanging, isChanging) || other.isChanging == isChanging));
}


@override
int get hashCode => Object.hash(runtimeType,oldPassword,newPassword,changeFailureOrSuccess,isChanging);

@override
String toString() {
  return 'ChangePasswordState(oldPassword: $oldPassword, newPassword: $newPassword, changeFailureOrSuccess: $changeFailureOrSuccess, isChanging: $isChanging)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordStateCopyWith<$Res>  {
  factory $ChangePasswordStateCopyWith(ChangePasswordState value, $Res Function(ChangePasswordState) _then) = _$ChangePasswordStateCopyWithImpl;
@useResult
$Res call({
 Password oldPassword, Password newPassword, Option<Either<ChangePasswordFailure, Unit>> changeFailureOrSuccess, bool isChanging
});




}
/// @nodoc
class _$ChangePasswordStateCopyWithImpl<$Res>
    implements $ChangePasswordStateCopyWith<$Res> {
  _$ChangePasswordStateCopyWithImpl(this._self, this._then);

  final ChangePasswordState _self;
  final $Res Function(ChangePasswordState) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? oldPassword = null,Object? newPassword = null,Object? changeFailureOrSuccess = null,Object? isChanging = null,}) {
  return _then(_self.copyWith(
oldPassword: null == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as Password,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as Password,changeFailureOrSuccess: null == changeFailureOrSuccess ? _self.changeFailureOrSuccess : changeFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<ChangePasswordFailure, Unit>>,isChanging: null == isChanging ? _self.isChanging : isChanging // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangePasswordState].
extension ChangePasswordStatePatterns on ChangePasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangePasswordState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangePasswordState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangePasswordState value)  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangePasswordState value)?  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Password oldPassword,  Password newPassword,  Option<Either<ChangePasswordFailure, Unit>> changeFailureOrSuccess,  bool isChanging)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangePasswordState() when $default != null:
return $default(_that.oldPassword,_that.newPassword,_that.changeFailureOrSuccess,_that.isChanging);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Password oldPassword,  Password newPassword,  Option<Either<ChangePasswordFailure, Unit>> changeFailureOrSuccess,  bool isChanging)  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordState():
return $default(_that.oldPassword,_that.newPassword,_that.changeFailureOrSuccess,_that.isChanging);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Password oldPassword,  Password newPassword,  Option<Either<ChangePasswordFailure, Unit>> changeFailureOrSuccess,  bool isChanging)?  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordState() when $default != null:
return $default(_that.oldPassword,_that.newPassword,_that.changeFailureOrSuccess,_that.isChanging);case _:
  return null;

}
}

}

/// @nodoc


class _ChangePasswordState extends ChangePasswordState {
  const _ChangePasswordState({this.oldPassword = const Password.pure(), this.newPassword = const Password.pure(), this.changeFailureOrSuccess = const None(), this.isChanging = false}): super._();
  

@override@JsonKey() final  Password oldPassword;
@override@JsonKey() final  Password newPassword;
@override@JsonKey() final  Option<Either<ChangePasswordFailure, Unit>> changeFailureOrSuccess;
@override@JsonKey() final  bool isChanging;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordStateCopyWith<_ChangePasswordState> get copyWith => __$ChangePasswordStateCopyWithImpl<_ChangePasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePasswordState&&(identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword)&&(identical(other.changeFailureOrSuccess, changeFailureOrSuccess) || other.changeFailureOrSuccess == changeFailureOrSuccess)&&(identical(other.isChanging, isChanging) || other.isChanging == isChanging));
}


@override
int get hashCode => Object.hash(runtimeType,oldPassword,newPassword,changeFailureOrSuccess,isChanging);

@override
String toString() {
  return 'ChangePasswordState(oldPassword: $oldPassword, newPassword: $newPassword, changeFailureOrSuccess: $changeFailureOrSuccess, isChanging: $isChanging)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordStateCopyWith<$Res> implements $ChangePasswordStateCopyWith<$Res> {
  factory _$ChangePasswordStateCopyWith(_ChangePasswordState value, $Res Function(_ChangePasswordState) _then) = __$ChangePasswordStateCopyWithImpl;
@override @useResult
$Res call({
 Password oldPassword, Password newPassword, Option<Either<ChangePasswordFailure, Unit>> changeFailureOrSuccess, bool isChanging
});




}
/// @nodoc
class __$ChangePasswordStateCopyWithImpl<$Res>
    implements _$ChangePasswordStateCopyWith<$Res> {
  __$ChangePasswordStateCopyWithImpl(this._self, this._then);

  final _ChangePasswordState _self;
  final $Res Function(_ChangePasswordState) _then;

/// Create a copy of ChangePasswordState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? oldPassword = null,Object? newPassword = null,Object? changeFailureOrSuccess = null,Object? isChanging = null,}) {
  return _then(_ChangePasswordState(
oldPassword: null == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as Password,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as Password,changeFailureOrSuccess: null == changeFailureOrSuccess ? _self.changeFailureOrSuccess : changeFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<ChangePasswordFailure, Unit>>,isChanging: null == isChanging ? _self.isChanging : isChanging // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
