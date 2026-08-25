// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_coloration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemeColoration {

 UniqueId get id; Color get primary; Color get secondary;
/// Create a copy of ThemeColoration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeColorationCopyWith<ThemeColoration> get copyWith => _$ThemeColorationCopyWithImpl<ThemeColoration>(this as ThemeColoration, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeColoration&&(identical(other.id, id) || other.id == id)&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary));
}


@override
int get hashCode => Object.hash(runtimeType,id,primary,secondary);

@override
String toString() {
  return 'ThemeColoration(id: $id, primary: $primary, secondary: $secondary)';
}


}

/// @nodoc
abstract mixin class $ThemeColorationCopyWith<$Res>  {
  factory $ThemeColorationCopyWith(ThemeColoration value, $Res Function(ThemeColoration) _then) = _$ThemeColorationCopyWithImpl;
@useResult
$Res call({
 UniqueId id, Color primary, Color secondary
});




}
/// @nodoc
class _$ThemeColorationCopyWithImpl<$Res>
    implements $ThemeColorationCopyWith<$Res> {
  _$ThemeColorationCopyWithImpl(this._self, this._then);

  final ThemeColoration _self;
  final $Res Function(ThemeColoration) _then;

/// Create a copy of ThemeColoration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? primary = null,Object? secondary = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemeColoration].
extension ThemeColorationPatterns on ThemeColoration {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemeColoration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemeColoration() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemeColoration value)  $default,){
final _that = this;
switch (_that) {
case _ThemeColoration():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemeColoration value)?  $default,){
final _that = this;
switch (_that) {
case _ThemeColoration() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UniqueId id,  Color primary,  Color secondary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemeColoration() when $default != null:
return $default(_that.id,_that.primary,_that.secondary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UniqueId id,  Color primary,  Color secondary)  $default,) {final _that = this;
switch (_that) {
case _ThemeColoration():
return $default(_that.id,_that.primary,_that.secondary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UniqueId id,  Color primary,  Color secondary)?  $default,) {final _that = this;
switch (_that) {
case _ThemeColoration() when $default != null:
return $default(_that.id,_that.primary,_that.secondary);case _:
  return null;

}
}

}

/// @nodoc


class _ThemeColoration implements ThemeColoration {
  const _ThemeColoration({required this.id, required this.primary, required this.secondary});
  

@override final  UniqueId id;
@override final  Color primary;
@override final  Color secondary;

/// Create a copy of ThemeColoration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemeColorationCopyWith<_ThemeColoration> get copyWith => __$ThemeColorationCopyWithImpl<_ThemeColoration>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeColoration&&(identical(other.id, id) || other.id == id)&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary));
}


@override
int get hashCode => Object.hash(runtimeType,id,primary,secondary);

@override
String toString() {
  return 'ThemeColoration(id: $id, primary: $primary, secondary: $secondary)';
}


}

/// @nodoc
abstract mixin class _$ThemeColorationCopyWith<$Res> implements $ThemeColorationCopyWith<$Res> {
  factory _$ThemeColorationCopyWith(_ThemeColoration value, $Res Function(_ThemeColoration) _then) = __$ThemeColorationCopyWithImpl;
@override @useResult
$Res call({
 UniqueId id, Color primary, Color secondary
});




}
/// @nodoc
class __$ThemeColorationCopyWithImpl<$Res>
    implements _$ThemeColorationCopyWith<$Res> {
  __$ThemeColorationCopyWithImpl(this._self, this._then);

  final _ThemeColoration _self;
  final $Res Function(_ThemeColoration) _then;

/// Create a copy of ThemeColoration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? primary = null,Object? secondary = null,}) {
  return _then(_ThemeColoration(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
