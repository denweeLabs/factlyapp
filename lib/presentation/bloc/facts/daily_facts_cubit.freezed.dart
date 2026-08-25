// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_facts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyFactsState {

 bool get isFetching; Option<DailyFactsBucket> get bucket; Option<FactsFailure> get bucketFailure;
/// Create a copy of DailyFactsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyFactsStateCopyWith<DailyFactsState> get copyWith => _$DailyFactsStateCopyWithImpl<DailyFactsState>(this as DailyFactsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyFactsState&&(identical(other.isFetching, isFetching) || other.isFetching == isFetching)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.bucketFailure, bucketFailure) || other.bucketFailure == bucketFailure));
}


@override
int get hashCode => Object.hash(runtimeType,isFetching,bucket,bucketFailure);

@override
String toString() {
  return 'DailyFactsState(isFetching: $isFetching, bucket: $bucket, bucketFailure: $bucketFailure)';
}


}

/// @nodoc
abstract mixin class $DailyFactsStateCopyWith<$Res>  {
  factory $DailyFactsStateCopyWith(DailyFactsState value, $Res Function(DailyFactsState) _then) = _$DailyFactsStateCopyWithImpl;
@useResult
$Res call({
 bool isFetching, Option<DailyFactsBucket> bucket, Option<FactsFailure> bucketFailure
});




}
/// @nodoc
class _$DailyFactsStateCopyWithImpl<$Res>
    implements $DailyFactsStateCopyWith<$Res> {
  _$DailyFactsStateCopyWithImpl(this._self, this._then);

  final DailyFactsState _self;
  final $Res Function(DailyFactsState) _then;

/// Create a copy of DailyFactsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFetching = null,Object? bucket = null,Object? bucketFailure = null,}) {
  return _then(_self.copyWith(
isFetching: null == isFetching ? _self.isFetching : isFetching // ignore: cast_nullable_to_non_nullable
as bool,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as Option<DailyFactsBucket>,bucketFailure: null == bucketFailure ? _self.bucketFailure : bucketFailure // ignore: cast_nullable_to_non_nullable
as Option<FactsFailure>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyFactsState].
extension DailyFactsStatePatterns on DailyFactsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyFactsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyFactsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyFactsState value)  $default,){
final _that = this;
switch (_that) {
case _DailyFactsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyFactsState value)?  $default,){
final _that = this;
switch (_that) {
case _DailyFactsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isFetching,  Option<DailyFactsBucket> bucket,  Option<FactsFailure> bucketFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyFactsState() when $default != null:
return $default(_that.isFetching,_that.bucket,_that.bucketFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isFetching,  Option<DailyFactsBucket> bucket,  Option<FactsFailure> bucketFailure)  $default,) {final _that = this;
switch (_that) {
case _DailyFactsState():
return $default(_that.isFetching,_that.bucket,_that.bucketFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isFetching,  Option<DailyFactsBucket> bucket,  Option<FactsFailure> bucketFailure)?  $default,) {final _that = this;
switch (_that) {
case _DailyFactsState() when $default != null:
return $default(_that.isFetching,_that.bucket,_that.bucketFailure);case _:
  return null;

}
}

}

/// @nodoc


class _DailyFactsState extends DailyFactsState {
  const _DailyFactsState({this.isFetching = false, this.bucket = const None(), this.bucketFailure = const None()}): super._();
  

@override@JsonKey() final  bool isFetching;
@override@JsonKey() final  Option<DailyFactsBucket> bucket;
@override@JsonKey() final  Option<FactsFailure> bucketFailure;

/// Create a copy of DailyFactsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyFactsStateCopyWith<_DailyFactsState> get copyWith => __$DailyFactsStateCopyWithImpl<_DailyFactsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyFactsState&&(identical(other.isFetching, isFetching) || other.isFetching == isFetching)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.bucketFailure, bucketFailure) || other.bucketFailure == bucketFailure));
}


@override
int get hashCode => Object.hash(runtimeType,isFetching,bucket,bucketFailure);

@override
String toString() {
  return 'DailyFactsState(isFetching: $isFetching, bucket: $bucket, bucketFailure: $bucketFailure)';
}


}

/// @nodoc
abstract mixin class _$DailyFactsStateCopyWith<$Res> implements $DailyFactsStateCopyWith<$Res> {
  factory _$DailyFactsStateCopyWith(_DailyFactsState value, $Res Function(_DailyFactsState) _then) = __$DailyFactsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isFetching, Option<DailyFactsBucket> bucket, Option<FactsFailure> bucketFailure
});




}
/// @nodoc
class __$DailyFactsStateCopyWithImpl<$Res>
    implements _$DailyFactsStateCopyWith<$Res> {
  __$DailyFactsStateCopyWithImpl(this._self, this._then);

  final _DailyFactsState _self;
  final $Res Function(_DailyFactsState) _then;

/// Create a copy of DailyFactsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFetching = null,Object? bucket = null,Object? bucketFailure = null,}) {
  return _then(_DailyFactsState(
isFetching: null == isFetching ? _self.isFetching : isFetching // ignore: cast_nullable_to_non_nullable
as bool,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as Option<DailyFactsBucket>,bucketFailure: null == bucketFailure ? _self.bucketFailure : bucketFailure // ignore: cast_nullable_to_non_nullable
as Option<FactsFailure>,
  ));
}


}

// dart format on
