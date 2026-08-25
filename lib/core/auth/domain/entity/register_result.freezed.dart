// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegisterResult {

 String get userId; Profile get profile; UserPreferences get preferences;
/// Create a copy of RegisterResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResultCopyWith<RegisterResult> get copyWith => _$RegisterResultCopyWithImpl<RegisterResult>(this as RegisterResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResult&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.preferences, preferences) || other.preferences == preferences));
}


@override
int get hashCode => Object.hash(runtimeType,userId,profile,preferences);

@override
String toString() {
  return 'RegisterResult(userId: $userId, profile: $profile, preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class $RegisterResultCopyWith<$Res>  {
  factory $RegisterResultCopyWith(RegisterResult value, $Res Function(RegisterResult) _then) = _$RegisterResultCopyWithImpl;
@useResult
$Res call({
 String userId, Profile profile, UserPreferences preferences
});


$ProfileCopyWith<$Res> get profile;$UserPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class _$RegisterResultCopyWithImpl<$Res>
    implements $RegisterResultCopyWith<$Res> {
  _$RegisterResultCopyWithImpl(this._self, this._then);

  final RegisterResult _self;
  final $Res Function(RegisterResult) _then;

/// Create a copy of RegisterResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? profile = null,Object? preferences = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,
  ));
}
/// Create a copy of RegisterResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of RegisterResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<$Res> get preferences {
  
  return $UserPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterResult].
extension RegisterResultPatterns on RegisterResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterResult value)  $default,){
final _that = this;
switch (_that) {
case _RegisterResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterResult value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  Profile profile,  UserPreferences preferences)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterResult() when $default != null:
return $default(_that.userId,_that.profile,_that.preferences);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  Profile profile,  UserPreferences preferences)  $default,) {final _that = this;
switch (_that) {
case _RegisterResult():
return $default(_that.userId,_that.profile,_that.preferences);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  Profile profile,  UserPreferences preferences)?  $default,) {final _that = this;
switch (_that) {
case _RegisterResult() when $default != null:
return $default(_that.userId,_that.profile,_that.preferences);case _:
  return null;

}
}

}

/// @nodoc


class _RegisterResult implements RegisterResult {
  const _RegisterResult({required this.userId, required this.profile, required this.preferences});
  

@override final  String userId;
@override final  Profile profile;
@override final  UserPreferences preferences;

/// Create a copy of RegisterResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterResultCopyWith<_RegisterResult> get copyWith => __$RegisterResultCopyWithImpl<_RegisterResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterResult&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.preferences, preferences) || other.preferences == preferences));
}


@override
int get hashCode => Object.hash(runtimeType,userId,profile,preferences);

@override
String toString() {
  return 'RegisterResult(userId: $userId, profile: $profile, preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class _$RegisterResultCopyWith<$Res> implements $RegisterResultCopyWith<$Res> {
  factory _$RegisterResultCopyWith(_RegisterResult value, $Res Function(_RegisterResult) _then) = __$RegisterResultCopyWithImpl;
@override @useResult
$Res call({
 String userId, Profile profile, UserPreferences preferences
});


@override $ProfileCopyWith<$Res> get profile;@override $UserPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class __$RegisterResultCopyWithImpl<$Res>
    implements _$RegisterResultCopyWith<$Res> {
  __$RegisterResultCopyWithImpl(this._self, this._then);

  final _RegisterResult _self;
  final $Res Function(_RegisterResult) _then;

/// Create a copy of RegisterResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? profile = null,Object? preferences = null,}) {
  return _then(_RegisterResult(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,
  ));
}

/// Create a copy of RegisterResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of RegisterResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<$Res> get preferences {
  
  return $UserPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}

// dart format on
