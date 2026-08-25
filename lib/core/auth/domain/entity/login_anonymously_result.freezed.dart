// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_anonymously_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginAnonymouslyResult {

 String get userId; Profile get profile; UserPreferences get preferences; UserStatistics get statistics;
/// Create a copy of LoginAnonymouslyResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginAnonymouslyResultCopyWith<LoginAnonymouslyResult> get copyWith => _$LoginAnonymouslyResultCopyWithImpl<LoginAnonymouslyResult>(this as LoginAnonymouslyResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginAnonymouslyResult&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.statistics, statistics) || other.statistics == statistics));
}


@override
int get hashCode => Object.hash(runtimeType,userId,profile,preferences,statistics);

@override
String toString() {
  return 'LoginAnonymouslyResult(userId: $userId, profile: $profile, preferences: $preferences, statistics: $statistics)';
}


}

/// @nodoc
abstract mixin class $LoginAnonymouslyResultCopyWith<$Res>  {
  factory $LoginAnonymouslyResultCopyWith(LoginAnonymouslyResult value, $Res Function(LoginAnonymouslyResult) _then) = _$LoginAnonymouslyResultCopyWithImpl;
@useResult
$Res call({
 String userId, Profile profile, UserPreferences preferences, UserStatistics statistics
});


$ProfileCopyWith<$Res> get profile;$UserPreferencesCopyWith<$Res> get preferences;$UserStatisticsCopyWith<$Res> get statistics;

}
/// @nodoc
class _$LoginAnonymouslyResultCopyWithImpl<$Res>
    implements $LoginAnonymouslyResultCopyWith<$Res> {
  _$LoginAnonymouslyResultCopyWithImpl(this._self, this._then);

  final LoginAnonymouslyResult _self;
  final $Res Function(LoginAnonymouslyResult) _then;

/// Create a copy of LoginAnonymouslyResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? profile = null,Object? preferences = null,Object? statistics = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,statistics: null == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as UserStatistics,
  ));
}
/// Create a copy of LoginAnonymouslyResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of LoginAnonymouslyResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<$Res> get preferences {
  
  return $UserPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}/// Create a copy of LoginAnonymouslyResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStatisticsCopyWith<$Res> get statistics {
  
  return $UserStatisticsCopyWith<$Res>(_self.statistics, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginAnonymouslyResult].
extension LoginAnonymouslyResultPatterns on LoginAnonymouslyResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginAnonymouslyResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginAnonymouslyResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginAnonymouslyResult value)  $default,){
final _that = this;
switch (_that) {
case _LoginAnonymouslyResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginAnonymouslyResult value)?  $default,){
final _that = this;
switch (_that) {
case _LoginAnonymouslyResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  Profile profile,  UserPreferences preferences,  UserStatistics statistics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginAnonymouslyResult() when $default != null:
return $default(_that.userId,_that.profile,_that.preferences,_that.statistics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  Profile profile,  UserPreferences preferences,  UserStatistics statistics)  $default,) {final _that = this;
switch (_that) {
case _LoginAnonymouslyResult():
return $default(_that.userId,_that.profile,_that.preferences,_that.statistics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  Profile profile,  UserPreferences preferences,  UserStatistics statistics)?  $default,) {final _that = this;
switch (_that) {
case _LoginAnonymouslyResult() when $default != null:
return $default(_that.userId,_that.profile,_that.preferences,_that.statistics);case _:
  return null;

}
}

}

/// @nodoc


class _LoginAnonymouslyResult implements LoginAnonymouslyResult {
  const _LoginAnonymouslyResult({required this.userId, required this.profile, required this.preferences, required this.statistics});
  

@override final  String userId;
@override final  Profile profile;
@override final  UserPreferences preferences;
@override final  UserStatistics statistics;

/// Create a copy of LoginAnonymouslyResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginAnonymouslyResultCopyWith<_LoginAnonymouslyResult> get copyWith => __$LoginAnonymouslyResultCopyWithImpl<_LoginAnonymouslyResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginAnonymouslyResult&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.statistics, statistics) || other.statistics == statistics));
}


@override
int get hashCode => Object.hash(runtimeType,userId,profile,preferences,statistics);

@override
String toString() {
  return 'LoginAnonymouslyResult(userId: $userId, profile: $profile, preferences: $preferences, statistics: $statistics)';
}


}

/// @nodoc
abstract mixin class _$LoginAnonymouslyResultCopyWith<$Res> implements $LoginAnonymouslyResultCopyWith<$Res> {
  factory _$LoginAnonymouslyResultCopyWith(_LoginAnonymouslyResult value, $Res Function(_LoginAnonymouslyResult) _then) = __$LoginAnonymouslyResultCopyWithImpl;
@override @useResult
$Res call({
 String userId, Profile profile, UserPreferences preferences, UserStatistics statistics
});


@override $ProfileCopyWith<$Res> get profile;@override $UserPreferencesCopyWith<$Res> get preferences;@override $UserStatisticsCopyWith<$Res> get statistics;

}
/// @nodoc
class __$LoginAnonymouslyResultCopyWithImpl<$Res>
    implements _$LoginAnonymouslyResultCopyWith<$Res> {
  __$LoginAnonymouslyResultCopyWithImpl(this._self, this._then);

  final _LoginAnonymouslyResult _self;
  final $Res Function(_LoginAnonymouslyResult) _then;

/// Create a copy of LoginAnonymouslyResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? profile = null,Object? preferences = null,Object? statistics = null,}) {
  return _then(_LoginAnonymouslyResult(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,statistics: null == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as UserStatistics,
  ));
}

/// Create a copy of LoginAnonymouslyResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of LoginAnonymouslyResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<$Res> get preferences {
  
  return $UserPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}/// Create a copy of LoginAnonymouslyResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStatisticsCopyWith<$Res> get statistics {
  
  return $UserStatisticsCopyWith<$Res>(_self.statistics, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}

// dart format on
