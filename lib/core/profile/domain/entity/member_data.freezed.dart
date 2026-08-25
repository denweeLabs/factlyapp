// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MemberData {

 Profile get profile; UserStatistics get statistics; UserPreferences get preferences; Option<UserSubscription> get activeSubscription; List<UniqueId> get archivedFactIds;
/// Create a copy of MemberData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberDataCopyWith<MemberData> get copyWith => _$MemberDataCopyWithImpl<MemberData>(this as MemberData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberData&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.statistics, statistics) || other.statistics == statistics)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.activeSubscription, activeSubscription) || other.activeSubscription == activeSubscription)&&const DeepCollectionEquality().equals(other.archivedFactIds, archivedFactIds));
}


@override
int get hashCode => Object.hash(runtimeType,profile,statistics,preferences,activeSubscription,const DeepCollectionEquality().hash(archivedFactIds));

@override
String toString() {
  return 'MemberData(profile: $profile, statistics: $statistics, preferences: $preferences, activeSubscription: $activeSubscription, archivedFactIds: $archivedFactIds)';
}


}

/// @nodoc
abstract mixin class $MemberDataCopyWith<$Res>  {
  factory $MemberDataCopyWith(MemberData value, $Res Function(MemberData) _then) = _$MemberDataCopyWithImpl;
@useResult
$Res call({
 Profile profile, UserStatistics statistics, UserPreferences preferences, Option<UserSubscription> activeSubscription, List<UniqueId> archivedFactIds
});


$ProfileCopyWith<$Res> get profile;$UserStatisticsCopyWith<$Res> get statistics;$UserPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class _$MemberDataCopyWithImpl<$Res>
    implements $MemberDataCopyWith<$Res> {
  _$MemberDataCopyWithImpl(this._self, this._then);

  final MemberData _self;
  final $Res Function(MemberData) _then;

/// Create a copy of MemberData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profile = null,Object? statistics = null,Object? preferences = null,Object? activeSubscription = null,Object? archivedFactIds = null,}) {
  return _then(_self.copyWith(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,statistics: null == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as UserStatistics,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,activeSubscription: null == activeSubscription ? _self.activeSubscription : activeSubscription // ignore: cast_nullable_to_non_nullable
as Option<UserSubscription>,archivedFactIds: null == archivedFactIds ? _self.archivedFactIds : archivedFactIds // ignore: cast_nullable_to_non_nullable
as List<UniqueId>,
  ));
}
/// Create a copy of MemberData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of MemberData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStatisticsCopyWith<$Res> get statistics {
  
  return $UserStatisticsCopyWith<$Res>(_self.statistics, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}/// Create a copy of MemberData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<$Res> get preferences {
  
  return $UserPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}


/// Adds pattern-matching-related methods to [MemberData].
extension MemberDataPatterns on MemberData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberData value)  $default,){
final _that = this;
switch (_that) {
case _MemberData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberData value)?  $default,){
final _that = this;
switch (_that) {
case _MemberData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Profile profile,  UserStatistics statistics,  UserPreferences preferences,  Option<UserSubscription> activeSubscription,  List<UniqueId> archivedFactIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberData() when $default != null:
return $default(_that.profile,_that.statistics,_that.preferences,_that.activeSubscription,_that.archivedFactIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Profile profile,  UserStatistics statistics,  UserPreferences preferences,  Option<UserSubscription> activeSubscription,  List<UniqueId> archivedFactIds)  $default,) {final _that = this;
switch (_that) {
case _MemberData():
return $default(_that.profile,_that.statistics,_that.preferences,_that.activeSubscription,_that.archivedFactIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Profile profile,  UserStatistics statistics,  UserPreferences preferences,  Option<UserSubscription> activeSubscription,  List<UniqueId> archivedFactIds)?  $default,) {final _that = this;
switch (_that) {
case _MemberData() when $default != null:
return $default(_that.profile,_that.statistics,_that.preferences,_that.activeSubscription,_that.archivedFactIds);case _:
  return null;

}
}

}

/// @nodoc


class _MemberData implements MemberData {
  const _MemberData({required this.profile, required this.statistics, required this.preferences, required this.activeSubscription, required final  List<UniqueId> archivedFactIds}): _archivedFactIds = archivedFactIds;
  

@override final  Profile profile;
@override final  UserStatistics statistics;
@override final  UserPreferences preferences;
@override final  Option<UserSubscription> activeSubscription;
 final  List<UniqueId> _archivedFactIds;
@override List<UniqueId> get archivedFactIds {
  if (_archivedFactIds is EqualUnmodifiableListView) return _archivedFactIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_archivedFactIds);
}


/// Create a copy of MemberData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberDataCopyWith<_MemberData> get copyWith => __$MemberDataCopyWithImpl<_MemberData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberData&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.statistics, statistics) || other.statistics == statistics)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.activeSubscription, activeSubscription) || other.activeSubscription == activeSubscription)&&const DeepCollectionEquality().equals(other._archivedFactIds, _archivedFactIds));
}


@override
int get hashCode => Object.hash(runtimeType,profile,statistics,preferences,activeSubscription,const DeepCollectionEquality().hash(_archivedFactIds));

@override
String toString() {
  return 'MemberData(profile: $profile, statistics: $statistics, preferences: $preferences, activeSubscription: $activeSubscription, archivedFactIds: $archivedFactIds)';
}


}

/// @nodoc
abstract mixin class _$MemberDataCopyWith<$Res> implements $MemberDataCopyWith<$Res> {
  factory _$MemberDataCopyWith(_MemberData value, $Res Function(_MemberData) _then) = __$MemberDataCopyWithImpl;
@override @useResult
$Res call({
 Profile profile, UserStatistics statistics, UserPreferences preferences, Option<UserSubscription> activeSubscription, List<UniqueId> archivedFactIds
});


@override $ProfileCopyWith<$Res> get profile;@override $UserStatisticsCopyWith<$Res> get statistics;@override $UserPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class __$MemberDataCopyWithImpl<$Res>
    implements _$MemberDataCopyWith<$Res> {
  __$MemberDataCopyWithImpl(this._self, this._then);

  final _MemberData _self;
  final $Res Function(_MemberData) _then;

/// Create a copy of MemberData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profile = null,Object? statistics = null,Object? preferences = null,Object? activeSubscription = null,Object? archivedFactIds = null,}) {
  return _then(_MemberData(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,statistics: null == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as UserStatistics,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,activeSubscription: null == activeSubscription ? _self.activeSubscription : activeSubscription // ignore: cast_nullable_to_non_nullable
as Option<UserSubscription>,archivedFactIds: null == archivedFactIds ? _self._archivedFactIds : archivedFactIds // ignore: cast_nullable_to_non_nullable
as List<UniqueId>,
  ));
}

/// Create a copy of MemberData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of MemberData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStatisticsCopyWith<$Res> get statistics {
  
  return $UserStatisticsCopyWith<$Res>(_self.statistics, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}/// Create a copy of MemberData
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
