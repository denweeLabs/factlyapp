// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_facts_bucket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyFactsBucket {

 DateTime get date; List<DailyFact> get facts;
/// Create a copy of DailyFactsBucket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyFactsBucketCopyWith<DailyFactsBucket> get copyWith => _$DailyFactsBucketCopyWithImpl<DailyFactsBucket>(this as DailyFactsBucket, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyFactsBucket&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.facts, facts));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(facts));

@override
String toString() {
  return 'DailyFactsBucket(date: $date, facts: $facts)';
}


}

/// @nodoc
abstract mixin class $DailyFactsBucketCopyWith<$Res>  {
  factory $DailyFactsBucketCopyWith(DailyFactsBucket value, $Res Function(DailyFactsBucket) _then) = _$DailyFactsBucketCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<DailyFact> facts
});




}
/// @nodoc
class _$DailyFactsBucketCopyWithImpl<$Res>
    implements $DailyFactsBucketCopyWith<$Res> {
  _$DailyFactsBucketCopyWithImpl(this._self, this._then);

  final DailyFactsBucket _self;
  final $Res Function(DailyFactsBucket) _then;

/// Create a copy of DailyFactsBucket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? facts = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,facts: null == facts ? _self.facts : facts // ignore: cast_nullable_to_non_nullable
as List<DailyFact>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyFactsBucket].
extension DailyFactsBucketPatterns on DailyFactsBucket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyFactsBucket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyFactsBucket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyFactsBucket value)  $default,){
final _that = this;
switch (_that) {
case _DailyFactsBucket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyFactsBucket value)?  $default,){
final _that = this;
switch (_that) {
case _DailyFactsBucket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  List<DailyFact> facts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyFactsBucket() when $default != null:
return $default(_that.date,_that.facts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  List<DailyFact> facts)  $default,) {final _that = this;
switch (_that) {
case _DailyFactsBucket():
return $default(_that.date,_that.facts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  List<DailyFact> facts)?  $default,) {final _that = this;
switch (_that) {
case _DailyFactsBucket() when $default != null:
return $default(_that.date,_that.facts);case _:
  return null;

}
}

}

/// @nodoc


class _DailyFactsBucket implements DailyFactsBucket {
  const _DailyFactsBucket({required this.date, required final  List<DailyFact> facts}): _facts = facts;
  

@override final  DateTime date;
 final  List<DailyFact> _facts;
@override List<DailyFact> get facts {
  if (_facts is EqualUnmodifiableListView) return _facts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_facts);
}


/// Create a copy of DailyFactsBucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyFactsBucketCopyWith<_DailyFactsBucket> get copyWith => __$DailyFactsBucketCopyWithImpl<_DailyFactsBucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyFactsBucket&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._facts, _facts));
}


@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_facts));

@override
String toString() {
  return 'DailyFactsBucket(date: $date, facts: $facts)';
}


}

/// @nodoc
abstract mixin class _$DailyFactsBucketCopyWith<$Res> implements $DailyFactsBucketCopyWith<$Res> {
  factory _$DailyFactsBucketCopyWith(_DailyFactsBucket value, $Res Function(_DailyFactsBucket) _then) = __$DailyFactsBucketCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, List<DailyFact> facts
});




}
/// @nodoc
class __$DailyFactsBucketCopyWithImpl<$Res>
    implements _$DailyFactsBucketCopyWith<$Res> {
  __$DailyFactsBucketCopyWithImpl(this._self, this._then);

  final _DailyFactsBucket _self;
  final $Res Function(_DailyFactsBucket) _then;

/// Create a copy of DailyFactsBucket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? facts = null,}) {
  return _then(_DailyFactsBucket(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,facts: null == facts ? _self._facts : facts // ignore: cast_nullable_to_non_nullable
as List<DailyFact>,
  ));
}


}

// dart format on
