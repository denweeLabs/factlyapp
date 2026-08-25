// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archived_fact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArchivedFact {

 UniqueId get id; DateTime get archivedAt; DailyFact get fact;
/// Create a copy of ArchivedFact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchivedFactCopyWith<ArchivedFact> get copyWith => _$ArchivedFactCopyWithImpl<ArchivedFact>(this as ArchivedFact, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchivedFact&&(identical(other.id, id) || other.id == id)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt)&&(identical(other.fact, fact) || other.fact == fact));
}


@override
int get hashCode => Object.hash(runtimeType,id,archivedAt,fact);

@override
String toString() {
  return 'ArchivedFact(id: $id, archivedAt: $archivedAt, fact: $fact)';
}


}

/// @nodoc
abstract mixin class $ArchivedFactCopyWith<$Res>  {
  factory $ArchivedFactCopyWith(ArchivedFact value, $Res Function(ArchivedFact) _then) = _$ArchivedFactCopyWithImpl;
@useResult
$Res call({
 UniqueId id, DateTime archivedAt, DailyFact fact
});


$DailyFactCopyWith<$Res> get fact;

}
/// @nodoc
class _$ArchivedFactCopyWithImpl<$Res>
    implements $ArchivedFactCopyWith<$Res> {
  _$ArchivedFactCopyWithImpl(this._self, this._then);

  final ArchivedFact _self;
  final $Res Function(ArchivedFact) _then;

/// Create a copy of ArchivedFact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? archivedAt = null,Object? fact = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,archivedAt: null == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fact: null == fact ? _self.fact : fact // ignore: cast_nullable_to_non_nullable
as DailyFact,
  ));
}
/// Create a copy of ArchivedFact
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyFactCopyWith<$Res> get fact {
  
  return $DailyFactCopyWith<$Res>(_self.fact, (value) {
    return _then(_self.copyWith(fact: value));
  });
}
}


/// Adds pattern-matching-related methods to [ArchivedFact].
extension ArchivedFactPatterns on ArchivedFact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArchivedFact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArchivedFact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArchivedFact value)  $default,){
final _that = this;
switch (_that) {
case _ArchivedFact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArchivedFact value)?  $default,){
final _that = this;
switch (_that) {
case _ArchivedFact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UniqueId id,  DateTime archivedAt,  DailyFact fact)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArchivedFact() when $default != null:
return $default(_that.id,_that.archivedAt,_that.fact);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UniqueId id,  DateTime archivedAt,  DailyFact fact)  $default,) {final _that = this;
switch (_that) {
case _ArchivedFact():
return $default(_that.id,_that.archivedAt,_that.fact);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UniqueId id,  DateTime archivedAt,  DailyFact fact)?  $default,) {final _that = this;
switch (_that) {
case _ArchivedFact() when $default != null:
return $default(_that.id,_that.archivedAt,_that.fact);case _:
  return null;

}
}

}

/// @nodoc


class _ArchivedFact implements ArchivedFact {
  const _ArchivedFact({required this.id, required this.archivedAt, required this.fact});
  

@override final  UniqueId id;
@override final  DateTime archivedAt;
@override final  DailyFact fact;

/// Create a copy of ArchivedFact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArchivedFactCopyWith<_ArchivedFact> get copyWith => __$ArchivedFactCopyWithImpl<_ArchivedFact>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchivedFact&&(identical(other.id, id) || other.id == id)&&(identical(other.archivedAt, archivedAt) || other.archivedAt == archivedAt)&&(identical(other.fact, fact) || other.fact == fact));
}


@override
int get hashCode => Object.hash(runtimeType,id,archivedAt,fact);

@override
String toString() {
  return 'ArchivedFact(id: $id, archivedAt: $archivedAt, fact: $fact)';
}


}

/// @nodoc
abstract mixin class _$ArchivedFactCopyWith<$Res> implements $ArchivedFactCopyWith<$Res> {
  factory _$ArchivedFactCopyWith(_ArchivedFact value, $Res Function(_ArchivedFact) _then) = __$ArchivedFactCopyWithImpl;
@override @useResult
$Res call({
 UniqueId id, DateTime archivedAt, DailyFact fact
});


@override $DailyFactCopyWith<$Res> get fact;

}
/// @nodoc
class __$ArchivedFactCopyWithImpl<$Res>
    implements _$ArchivedFactCopyWith<$Res> {
  __$ArchivedFactCopyWithImpl(this._self, this._then);

  final _ArchivedFact _self;
  final $Res Function(_ArchivedFact) _then;

/// Create a copy of ArchivedFact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? archivedAt = null,Object? fact = null,}) {
  return _then(_ArchivedFact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,archivedAt: null == archivedAt ? _self.archivedAt : archivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,fact: null == fact ? _self.fact : fact // ignore: cast_nullable_to_non_nullable
as DailyFact,
  ));
}

/// Create a copy of ArchivedFact
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DailyFactCopyWith<$Res> get fact {
  
  return $DailyFactCopyWith<$Res>(_self.fact, (value) {
    return _then(_self.copyWith(fact: value));
  });
}
}

// dart format on
