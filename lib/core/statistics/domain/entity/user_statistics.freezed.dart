// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserStatistics {

 int get stars; int get starsRecord; int get currentStreak; int get streakRecord; int get knownFacts; Option<DateTime> get lastActiveDate; Option<bool> get isStreakLost;
/// Create a copy of UserStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatisticsCopyWith<UserStatistics> get copyWith => _$UserStatisticsCopyWithImpl<UserStatistics>(this as UserStatistics, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStatistics&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.starsRecord, starsRecord) || other.starsRecord == starsRecord)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.streakRecord, streakRecord) || other.streakRecord == streakRecord)&&(identical(other.knownFacts, knownFacts) || other.knownFacts == knownFacts)&&(identical(other.lastActiveDate, lastActiveDate) || other.lastActiveDate == lastActiveDate)&&(identical(other.isStreakLost, isStreakLost) || other.isStreakLost == isStreakLost));
}


@override
int get hashCode => Object.hash(runtimeType,stars,starsRecord,currentStreak,streakRecord,knownFacts,lastActiveDate,isStreakLost);

@override
String toString() {
  return 'UserStatistics(stars: $stars, starsRecord: $starsRecord, currentStreak: $currentStreak, streakRecord: $streakRecord, knownFacts: $knownFacts, lastActiveDate: $lastActiveDate, isStreakLost: $isStreakLost)';
}


}

/// @nodoc
abstract mixin class $UserStatisticsCopyWith<$Res>  {
  factory $UserStatisticsCopyWith(UserStatistics value, $Res Function(UserStatistics) _then) = _$UserStatisticsCopyWithImpl;
@useResult
$Res call({
 int stars, int starsRecord, int currentStreak, int streakRecord, int knownFacts, Option<DateTime> lastActiveDate, Option<bool> isStreakLost
});




}
/// @nodoc
class _$UserStatisticsCopyWithImpl<$Res>
    implements $UserStatisticsCopyWith<$Res> {
  _$UserStatisticsCopyWithImpl(this._self, this._then);

  final UserStatistics _self;
  final $Res Function(UserStatistics) _then;

/// Create a copy of UserStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stars = null,Object? starsRecord = null,Object? currentStreak = null,Object? streakRecord = null,Object? knownFacts = null,Object? lastActiveDate = null,Object? isStreakLost = null,}) {
  return _then(_self.copyWith(
stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,starsRecord: null == starsRecord ? _self.starsRecord : starsRecord // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,streakRecord: null == streakRecord ? _self.streakRecord : streakRecord // ignore: cast_nullable_to_non_nullable
as int,knownFacts: null == knownFacts ? _self.knownFacts : knownFacts // ignore: cast_nullable_to_non_nullable
as int,lastActiveDate: null == lastActiveDate ? _self.lastActiveDate : lastActiveDate // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,isStreakLost: null == isStreakLost ? _self.isStreakLost : isStreakLost // ignore: cast_nullable_to_non_nullable
as Option<bool>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserStatistics].
extension UserStatisticsPatterns on UserStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStatistics value)  $default,){
final _that = this;
switch (_that) {
case _UserStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _UserStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stars,  int starsRecord,  int currentStreak,  int streakRecord,  int knownFacts,  Option<DateTime> lastActiveDate,  Option<bool> isStreakLost)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStatistics() when $default != null:
return $default(_that.stars,_that.starsRecord,_that.currentStreak,_that.streakRecord,_that.knownFacts,_that.lastActiveDate,_that.isStreakLost);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stars,  int starsRecord,  int currentStreak,  int streakRecord,  int knownFacts,  Option<DateTime> lastActiveDate,  Option<bool> isStreakLost)  $default,) {final _that = this;
switch (_that) {
case _UserStatistics():
return $default(_that.stars,_that.starsRecord,_that.currentStreak,_that.streakRecord,_that.knownFacts,_that.lastActiveDate,_that.isStreakLost);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stars,  int starsRecord,  int currentStreak,  int streakRecord,  int knownFacts,  Option<DateTime> lastActiveDate,  Option<bool> isStreakLost)?  $default,) {final _that = this;
switch (_that) {
case _UserStatistics() when $default != null:
return $default(_that.stars,_that.starsRecord,_that.currentStreak,_that.streakRecord,_that.knownFacts,_that.lastActiveDate,_that.isStreakLost);case _:
  return null;

}
}

}

/// @nodoc


class _UserStatistics implements UserStatistics {
  const _UserStatistics({required this.stars, required this.starsRecord, required this.currentStreak, required this.streakRecord, required this.knownFacts, required this.lastActiveDate, required this.isStreakLost});
  

@override final  int stars;
@override final  int starsRecord;
@override final  int currentStreak;
@override final  int streakRecord;
@override final  int knownFacts;
@override final  Option<DateTime> lastActiveDate;
@override final  Option<bool> isStreakLost;

/// Create a copy of UserStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatisticsCopyWith<_UserStatistics> get copyWith => __$UserStatisticsCopyWithImpl<_UserStatistics>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStatistics&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.starsRecord, starsRecord) || other.starsRecord == starsRecord)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.streakRecord, streakRecord) || other.streakRecord == streakRecord)&&(identical(other.knownFacts, knownFacts) || other.knownFacts == knownFacts)&&(identical(other.lastActiveDate, lastActiveDate) || other.lastActiveDate == lastActiveDate)&&(identical(other.isStreakLost, isStreakLost) || other.isStreakLost == isStreakLost));
}


@override
int get hashCode => Object.hash(runtimeType,stars,starsRecord,currentStreak,streakRecord,knownFacts,lastActiveDate,isStreakLost);

@override
String toString() {
  return 'UserStatistics(stars: $stars, starsRecord: $starsRecord, currentStreak: $currentStreak, streakRecord: $streakRecord, knownFacts: $knownFacts, lastActiveDate: $lastActiveDate, isStreakLost: $isStreakLost)';
}


}

/// @nodoc
abstract mixin class _$UserStatisticsCopyWith<$Res> implements $UserStatisticsCopyWith<$Res> {
  factory _$UserStatisticsCopyWith(_UserStatistics value, $Res Function(_UserStatistics) _then) = __$UserStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int stars, int starsRecord, int currentStreak, int streakRecord, int knownFacts, Option<DateTime> lastActiveDate, Option<bool> isStreakLost
});




}
/// @nodoc
class __$UserStatisticsCopyWithImpl<$Res>
    implements _$UserStatisticsCopyWith<$Res> {
  __$UserStatisticsCopyWithImpl(this._self, this._then);

  final _UserStatistics _self;
  final $Res Function(_UserStatistics) _then;

/// Create a copy of UserStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stars = null,Object? starsRecord = null,Object? currentStreak = null,Object? streakRecord = null,Object? knownFacts = null,Object? lastActiveDate = null,Object? isStreakLost = null,}) {
  return _then(_UserStatistics(
stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,starsRecord: null == starsRecord ? _self.starsRecord : starsRecord // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,streakRecord: null == streakRecord ? _self.streakRecord : streakRecord // ignore: cast_nullable_to_non_nullable
as int,knownFacts: null == knownFacts ? _self.knownFacts : knownFacts // ignore: cast_nullable_to_non_nullable
as int,lastActiveDate: null == lastActiveDate ? _self.lastActiveDate : lastActiveDate // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,isStreakLost: null == isStreakLost ? _self.isStreakLost : isStreakLost // ignore: cast_nullable_to_non_nullable
as Option<bool>,
  ));
}


}

// dart format on
