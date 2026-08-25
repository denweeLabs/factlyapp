// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fact_explanation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FactExplanation {

 UniqueId get id; String get content;
/// Create a copy of FactExplanation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FactExplanationCopyWith<FactExplanation> get copyWith => _$FactExplanationCopyWithImpl<FactExplanation>(this as FactExplanation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FactExplanation&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,id,content);

@override
String toString() {
  return 'FactExplanation(id: $id, content: $content)';
}


}

/// @nodoc
abstract mixin class $FactExplanationCopyWith<$Res>  {
  factory $FactExplanationCopyWith(FactExplanation value, $Res Function(FactExplanation) _then) = _$FactExplanationCopyWithImpl;
@useResult
$Res call({
 UniqueId id, String content
});




}
/// @nodoc
class _$FactExplanationCopyWithImpl<$Res>
    implements $FactExplanationCopyWith<$Res> {
  _$FactExplanationCopyWithImpl(this._self, this._then);

  final FactExplanation _self;
  final $Res Function(FactExplanation) _then;

/// Create a copy of FactExplanation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? content = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FactExplanation].
extension FactExplanationPatterns on FactExplanation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FactExplanation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FactExplanation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FactExplanation value)  $default,){
final _that = this;
switch (_that) {
case _FactExplanation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FactExplanation value)?  $default,){
final _that = this;
switch (_that) {
case _FactExplanation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UniqueId id,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FactExplanation() when $default != null:
return $default(_that.id,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UniqueId id,  String content)  $default,) {final _that = this;
switch (_that) {
case _FactExplanation():
return $default(_that.id,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UniqueId id,  String content)?  $default,) {final _that = this;
switch (_that) {
case _FactExplanation() when $default != null:
return $default(_that.id,_that.content);case _:
  return null;

}
}

}

/// @nodoc


class _FactExplanation implements FactExplanation {
  const _FactExplanation({required this.id, required this.content});
  

@override final  UniqueId id;
@override final  String content;

/// Create a copy of FactExplanation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FactExplanationCopyWith<_FactExplanation> get copyWith => __$FactExplanationCopyWithImpl<_FactExplanation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FactExplanation&&(identical(other.id, id) || other.id == id)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,id,content);

@override
String toString() {
  return 'FactExplanation(id: $id, content: $content)';
}


}

/// @nodoc
abstract mixin class _$FactExplanationCopyWith<$Res> implements $FactExplanationCopyWith<$Res> {
  factory _$FactExplanationCopyWith(_FactExplanation value, $Res Function(_FactExplanation) _then) = __$FactExplanationCopyWithImpl;
@override @useResult
$Res call({
 UniqueId id, String content
});




}
/// @nodoc
class __$FactExplanationCopyWithImpl<$Res>
    implements _$FactExplanationCopyWith<$Res> {
  __$FactExplanationCopyWithImpl(this._self, this._then);

  final _FactExplanation _self;
  final $Res Function(_FactExplanation) _then;

/// Create a copy of FactExplanation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? content = null,}) {
  return _then(_FactExplanation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
