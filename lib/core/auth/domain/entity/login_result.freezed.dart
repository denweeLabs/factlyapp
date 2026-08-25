// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginResult {

 String get userId; Profile get profile; UserPreferences get preferences; UserStatistics get statistics; Option<UserSubscription> get activeSubscription; List<UniqueId> get archivedFactIds;
/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResultCopyWith<LoginResult> get copyWith => _$LoginResultCopyWithImpl<LoginResult>(this as LoginResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResult&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.statistics, statistics) || other.statistics == statistics)&&(identical(other.activeSubscription, activeSubscription) || other.activeSubscription == activeSubscription)&&const DeepCollectionEquality().equals(other.archivedFactIds, archivedFactIds));
}


@override
int get hashCode => Object.hash(runtimeType,userId,profile,preferences,statistics,activeSubscription,const DeepCollectionEquality().hash(archivedFactIds));

@override
String toString() {
  return 'LoginResult(userId: $userId, profile: $profile, preferences: $preferences, statistics: $statistics, activeSubscription: $activeSubscription, archivedFactIds: $archivedFactIds)';
}


}

/// @nodoc
abstract mixin class $LoginResultCopyWith<$Res>  {
  factory $LoginResultCopyWith(LoginResult value, $Res Function(LoginResult) _then) = _$LoginResultCopyWithImpl;
@useResult
$Res call({
 String userId, Profile profile, UserPreferences preferences, UserStatistics statistics, Option<UserSubscription> activeSubscription, List<UniqueId> archivedFactIds
});


$ProfileCopyWith<$Res> get profile;$UserPreferencesCopyWith<$Res> get preferences;$UserStatisticsCopyWith<$Res> get statistics;

}
/// @nodoc
class _$LoginResultCopyWithImpl<$Res>
    implements $LoginResultCopyWith<$Res> {
  _$LoginResultCopyWithImpl(this._self, this._then);

  final LoginResult _self;
  final $Res Function(LoginResult) _then;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? profile = null,Object? preferences = null,Object? statistics = null,Object? activeSubscription = null,Object? archivedFactIds = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,statistics: null == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as UserStatistics,activeSubscription: null == activeSubscription ? _self.activeSubscription : activeSubscription // ignore: cast_nullable_to_non_nullable
as Option<UserSubscription>,archivedFactIds: null == archivedFactIds ? _self.archivedFactIds : archivedFactIds // ignore: cast_nullable_to_non_nullable
as List<UniqueId>,
  ));
}
/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<$Res> get preferences {
  
  return $UserPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStatisticsCopyWith<$Res> get statistics {
  
  return $UserStatisticsCopyWith<$Res>(_self.statistics, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResult].
extension LoginResultPatterns on LoginResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResult value)  $default,){
final _that = this;
switch (_that) {
case _LoginResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResult value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  Profile profile,  UserPreferences preferences,  UserStatistics statistics,  Option<UserSubscription> activeSubscription,  List<UniqueId> archivedFactIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
return $default(_that.userId,_that.profile,_that.preferences,_that.statistics,_that.activeSubscription,_that.archivedFactIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  Profile profile,  UserPreferences preferences,  UserStatistics statistics,  Option<UserSubscription> activeSubscription,  List<UniqueId> archivedFactIds)  $default,) {final _that = this;
switch (_that) {
case _LoginResult():
return $default(_that.userId,_that.profile,_that.preferences,_that.statistics,_that.activeSubscription,_that.archivedFactIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  Profile profile,  UserPreferences preferences,  UserStatistics statistics,  Option<UserSubscription> activeSubscription,  List<UniqueId> archivedFactIds)?  $default,) {final _that = this;
switch (_that) {
case _LoginResult() when $default != null:
return $default(_that.userId,_that.profile,_that.preferences,_that.statistics,_that.activeSubscription,_that.archivedFactIds);case _:
  return null;

}
}

}

/// @nodoc


class _LoginResult implements LoginResult {
  const _LoginResult({required this.userId, required this.profile, required this.preferences, required this.statistics, required this.activeSubscription, required final  List<UniqueId> archivedFactIds}): _archivedFactIds = archivedFactIds;
  

@override final  String userId;
@override final  Profile profile;
@override final  UserPreferences preferences;
@override final  UserStatistics statistics;
@override final  Option<UserSubscription> activeSubscription;
 final  List<UniqueId> _archivedFactIds;
@override List<UniqueId> get archivedFactIds {
  if (_archivedFactIds is EqualUnmodifiableListView) return _archivedFactIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_archivedFactIds);
}


/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResultCopyWith<_LoginResult> get copyWith => __$LoginResultCopyWithImpl<_LoginResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResult&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.statistics, statistics) || other.statistics == statistics)&&(identical(other.activeSubscription, activeSubscription) || other.activeSubscription == activeSubscription)&&const DeepCollectionEquality().equals(other._archivedFactIds, _archivedFactIds));
}


@override
int get hashCode => Object.hash(runtimeType,userId,profile,preferences,statistics,activeSubscription,const DeepCollectionEquality().hash(_archivedFactIds));

@override
String toString() {
  return 'LoginResult(userId: $userId, profile: $profile, preferences: $preferences, statistics: $statistics, activeSubscription: $activeSubscription, archivedFactIds: $archivedFactIds)';
}


}

/// @nodoc
abstract mixin class _$LoginResultCopyWith<$Res> implements $LoginResultCopyWith<$Res> {
  factory _$LoginResultCopyWith(_LoginResult value, $Res Function(_LoginResult) _then) = __$LoginResultCopyWithImpl;
@override @useResult
$Res call({
 String userId, Profile profile, UserPreferences preferences, UserStatistics statistics, Option<UserSubscription> activeSubscription, List<UniqueId> archivedFactIds
});


@override $ProfileCopyWith<$Res> get profile;@override $UserPreferencesCopyWith<$Res> get preferences;@override $UserStatisticsCopyWith<$Res> get statistics;

}
/// @nodoc
class __$LoginResultCopyWithImpl<$Res>
    implements _$LoginResultCopyWith<$Res> {
  __$LoginResultCopyWithImpl(this._self, this._then);

  final _LoginResult _self;
  final $Res Function(_LoginResult) _then;

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? profile = null,Object? preferences = null,Object? statistics = null,Object? activeSubscription = null,Object? archivedFactIds = null,}) {
  return _then(_LoginResult(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,statistics: null == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as UserStatistics,activeSubscription: null == activeSubscription ? _self.activeSubscription : activeSubscription // ignore: cast_nullable_to_non_nullable
as Option<UserSubscription>,archivedFactIds: null == archivedFactIds ? _self._archivedFactIds : archivedFactIds // ignore: cast_nullable_to_non_nullable
as List<UniqueId>,
  ));
}

/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of LoginResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<$Res> get preferences {
  
  return $UserPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}/// Create a copy of LoginResult
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
