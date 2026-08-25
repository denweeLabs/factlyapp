// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_statistics_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserStatisticsState implements DiagnosticableTreeMixin {

 UserStatistics get statistics; bool get isFetching; bool get isInitiallyLoaded; Option<StatisticsFailure> get failure;
/// Create a copy of UserStatisticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserStatisticsStateCopyWith<UserStatisticsState> get copyWith => _$UserStatisticsStateCopyWithImpl<UserStatisticsState>(this as UserStatisticsState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserStatisticsState'))
    ..add(DiagnosticsProperty('statistics', statistics))..add(DiagnosticsProperty('isFetching', isFetching))..add(DiagnosticsProperty('isInitiallyLoaded', isInitiallyLoaded))..add(DiagnosticsProperty('failure', failure));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserStatisticsState&&(identical(other.statistics, statistics) || other.statistics == statistics)&&(identical(other.isFetching, isFetching) || other.isFetching == isFetching)&&(identical(other.isInitiallyLoaded, isInitiallyLoaded) || other.isInitiallyLoaded == isInitiallyLoaded)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,statistics,isFetching,isInitiallyLoaded,failure);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserStatisticsState(statistics: $statistics, isFetching: $isFetching, isInitiallyLoaded: $isInitiallyLoaded, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $UserStatisticsStateCopyWith<$Res>  {
  factory $UserStatisticsStateCopyWith(UserStatisticsState value, $Res Function(UserStatisticsState) _then) = _$UserStatisticsStateCopyWithImpl;
@useResult
$Res call({
 UserStatistics statistics, bool isFetching, bool isInitiallyLoaded, Option<StatisticsFailure> failure
});


$UserStatisticsCopyWith<$Res> get statistics;

}
/// @nodoc
class _$UserStatisticsStateCopyWithImpl<$Res>
    implements $UserStatisticsStateCopyWith<$Res> {
  _$UserStatisticsStateCopyWithImpl(this._self, this._then);

  final UserStatisticsState _self;
  final $Res Function(UserStatisticsState) _then;

/// Create a copy of UserStatisticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statistics = null,Object? isFetching = null,Object? isInitiallyLoaded = null,Object? failure = null,}) {
  return _then(_self.copyWith(
statistics: null == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as UserStatistics,isFetching: null == isFetching ? _self.isFetching : isFetching // ignore: cast_nullable_to_non_nullable
as bool,isInitiallyLoaded: null == isInitiallyLoaded ? _self.isInitiallyLoaded : isInitiallyLoaded // ignore: cast_nullable_to_non_nullable
as bool,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Option<StatisticsFailure>,
  ));
}
/// Create a copy of UserStatisticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserStatisticsCopyWith<$Res> get statistics {
  
  return $UserStatisticsCopyWith<$Res>(_self.statistics, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserStatisticsState].
extension UserStatisticsStatePatterns on UserStatisticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserStatisticsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserStatisticsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserStatisticsState value)  $default,){
final _that = this;
switch (_that) {
case _UserStatisticsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserStatisticsState value)?  $default,){
final _that = this;
switch (_that) {
case _UserStatisticsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserStatistics statistics,  bool isFetching,  bool isInitiallyLoaded,  Option<StatisticsFailure> failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserStatisticsState() when $default != null:
return $default(_that.statistics,_that.isFetching,_that.isInitiallyLoaded,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserStatistics statistics,  bool isFetching,  bool isInitiallyLoaded,  Option<StatisticsFailure> failure)  $default,) {final _that = this;
switch (_that) {
case _UserStatisticsState():
return $default(_that.statistics,_that.isFetching,_that.isInitiallyLoaded,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserStatistics statistics,  bool isFetching,  bool isInitiallyLoaded,  Option<StatisticsFailure> failure)?  $default,) {final _that = this;
switch (_that) {
case _UserStatisticsState() when $default != null:
return $default(_that.statistics,_that.isFetching,_that.isInitiallyLoaded,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _UserStatisticsState extends UserStatisticsState with DiagnosticableTreeMixin {
  const _UserStatisticsState({required this.statistics, this.isFetching = false, this.isInitiallyLoaded = false, this.failure = const None()}): super._();
  

@override final  UserStatistics statistics;
@override@JsonKey() final  bool isFetching;
@override@JsonKey() final  bool isInitiallyLoaded;
@override@JsonKey() final  Option<StatisticsFailure> failure;

/// Create a copy of UserStatisticsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserStatisticsStateCopyWith<_UserStatisticsState> get copyWith => __$UserStatisticsStateCopyWithImpl<_UserStatisticsState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserStatisticsState'))
    ..add(DiagnosticsProperty('statistics', statistics))..add(DiagnosticsProperty('isFetching', isFetching))..add(DiagnosticsProperty('isInitiallyLoaded', isInitiallyLoaded))..add(DiagnosticsProperty('failure', failure));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserStatisticsState&&(identical(other.statistics, statistics) || other.statistics == statistics)&&(identical(other.isFetching, isFetching) || other.isFetching == isFetching)&&(identical(other.isInitiallyLoaded, isInitiallyLoaded) || other.isInitiallyLoaded == isInitiallyLoaded)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,statistics,isFetching,isInitiallyLoaded,failure);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserStatisticsState(statistics: $statistics, isFetching: $isFetching, isInitiallyLoaded: $isInitiallyLoaded, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$UserStatisticsStateCopyWith<$Res> implements $UserStatisticsStateCopyWith<$Res> {
  factory _$UserStatisticsStateCopyWith(_UserStatisticsState value, $Res Function(_UserStatisticsState) _then) = __$UserStatisticsStateCopyWithImpl;
@override @useResult
$Res call({
 UserStatistics statistics, bool isFetching, bool isInitiallyLoaded, Option<StatisticsFailure> failure
});


@override $UserStatisticsCopyWith<$Res> get statistics;

}
/// @nodoc
class __$UserStatisticsStateCopyWithImpl<$Res>
    implements _$UserStatisticsStateCopyWith<$Res> {
  __$UserStatisticsStateCopyWithImpl(this._self, this._then);

  final _UserStatisticsState _self;
  final $Res Function(_UserStatisticsState) _then;

/// Create a copy of UserStatisticsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statistics = null,Object? isFetching = null,Object? isInitiallyLoaded = null,Object? failure = null,}) {
  return _then(_UserStatisticsState(
statistics: null == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as UserStatistics,isFetching: null == isFetching ? _self.isFetching : isFetching // ignore: cast_nullable_to_non_nullable
as bool,isInitiallyLoaded: null == isInitiallyLoaded ? _self.isInitiallyLoaded : isInitiallyLoaded // ignore: cast_nullable_to_non_nullable
as bool,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Option<StatisticsFailure>,
  ));
}

/// Create a copy of UserStatisticsState
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
