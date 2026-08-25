// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChangePasswordBody {

 Password get oldPassword; Password get newPassword;
/// Create a copy of ChangePasswordBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordBodyCopyWith<ChangePasswordBody> get copyWith => _$ChangePasswordBodyCopyWithImpl<ChangePasswordBody>(this as ChangePasswordBody, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordBody&&(identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,oldPassword,newPassword);

@override
String toString() {
  return 'ChangePasswordBody(oldPassword: $oldPassword, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordBodyCopyWith<$Res>  {
  factory $ChangePasswordBodyCopyWith(ChangePasswordBody value, $Res Function(ChangePasswordBody) _then) = _$ChangePasswordBodyCopyWithImpl;
@useResult
$Res call({
 Password oldPassword, Password newPassword
});




}
/// @nodoc
class _$ChangePasswordBodyCopyWithImpl<$Res>
    implements $ChangePasswordBodyCopyWith<$Res> {
  _$ChangePasswordBodyCopyWithImpl(this._self, this._then);

  final ChangePasswordBody _self;
  final $Res Function(ChangePasswordBody) _then;

/// Create a copy of ChangePasswordBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? oldPassword = null,Object? newPassword = null,}) {
  return _then(_self.copyWith(
oldPassword: null == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as Password,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as Password,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangePasswordBody].
extension ChangePasswordBodyPatterns on ChangePasswordBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangePasswordBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangePasswordBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangePasswordBody value)  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangePasswordBody value)?  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Password oldPassword,  Password newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangePasswordBody() when $default != null:
return $default(_that.oldPassword,_that.newPassword);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Password oldPassword,  Password newPassword)  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordBody():
return $default(_that.oldPassword,_that.newPassword);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Password oldPassword,  Password newPassword)?  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordBody() when $default != null:
return $default(_that.oldPassword,_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc


class _ChangePasswordBody implements ChangePasswordBody {
  const _ChangePasswordBody({required this.oldPassword, required this.newPassword});
  

@override final  Password oldPassword;
@override final  Password newPassword;

/// Create a copy of ChangePasswordBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordBodyCopyWith<_ChangePasswordBody> get copyWith => __$ChangePasswordBodyCopyWithImpl<_ChangePasswordBody>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePasswordBody&&(identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}


@override
int get hashCode => Object.hash(runtimeType,oldPassword,newPassword);

@override
String toString() {
  return 'ChangePasswordBody(oldPassword: $oldPassword, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordBodyCopyWith<$Res> implements $ChangePasswordBodyCopyWith<$Res> {
  factory _$ChangePasswordBodyCopyWith(_ChangePasswordBody value, $Res Function(_ChangePasswordBody) _then) = __$ChangePasswordBodyCopyWithImpl;
@override @useResult
$Res call({
 Password oldPassword, Password newPassword
});




}
/// @nodoc
class __$ChangePasswordBodyCopyWithImpl<$Res>
    implements _$ChangePasswordBodyCopyWith<$Res> {
  __$ChangePasswordBodyCopyWithImpl(this._self, this._then);

  final _ChangePasswordBody _self;
  final $Res Function(_ChangePasswordBody) _then;

/// Create a copy of ChangePasswordBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? oldPassword = null,Object? newPassword = null,}) {
  return _then(_ChangePasswordBody(
oldPassword: null == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as Password,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as Password,
  ));
}


}

// dart format on
