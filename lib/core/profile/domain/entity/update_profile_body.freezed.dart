// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateProfileBody {

 Option<Username> get name; Email get email;
/// Create a copy of UpdateProfileBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileBodyCopyWith<UpdateProfileBody> get copyWith => _$UpdateProfileBodyCopyWithImpl<UpdateProfileBody>(this as UpdateProfileBody, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileBody&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'UpdateProfileBody(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileBodyCopyWith<$Res>  {
  factory $UpdateProfileBodyCopyWith(UpdateProfileBody value, $Res Function(UpdateProfileBody) _then) = _$UpdateProfileBodyCopyWithImpl;
@useResult
$Res call({
 Option<Username> name, Email email
});




}
/// @nodoc
class _$UpdateProfileBodyCopyWithImpl<$Res>
    implements $UpdateProfileBodyCopyWith<$Res> {
  _$UpdateProfileBodyCopyWithImpl(this._self, this._then);

  final UpdateProfileBody _self;
  final $Res Function(UpdateProfileBody) _then;

/// Create a copy of UpdateProfileBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Option<Username>,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProfileBody].
extension UpdateProfileBodyPatterns on UpdateProfileBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileBody value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileBody value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Option<Username> name,  Email email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileBody() when $default != null:
return $default(_that.name,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Option<Username> name,  Email email)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileBody():
return $default(_that.name,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Option<Username> name,  Email email)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileBody() when $default != null:
return $default(_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateProfileBody implements UpdateProfileBody {
  const _UpdateProfileBody({required this.name, required this.email});
  

@override final  Option<Username> name;
@override final  Email email;

/// Create a copy of UpdateProfileBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileBodyCopyWith<_UpdateProfileBody> get copyWith => __$UpdateProfileBodyCopyWithImpl<_UpdateProfileBody>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileBody&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode => Object.hash(runtimeType,name,email);

@override
String toString() {
  return 'UpdateProfileBody(name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileBodyCopyWith<$Res> implements $UpdateProfileBodyCopyWith<$Res> {
  factory _$UpdateProfileBodyCopyWith(_UpdateProfileBody value, $Res Function(_UpdateProfileBody) _then) = __$UpdateProfileBodyCopyWithImpl;
@override @useResult
$Res call({
 Option<Username> name, Email email
});




}
/// @nodoc
class __$UpdateProfileBodyCopyWithImpl<$Res>
    implements _$UpdateProfileBodyCopyWith<$Res> {
  __$UpdateProfileBodyCopyWithImpl(this._self, this._then);

  final _UpdateProfileBody _self;
  final $Res Function(_UpdateProfileBody) _then;

/// Create a copy of UpdateProfileBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,}) {
  return _then(_UpdateProfileBody(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Option<Username>,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,
  ));
}


}

// dart format on
