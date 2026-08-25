// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThemePreferences {

 ThemeMode get mode; UniqueId get colorationId;
/// Create a copy of ThemePreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemePreferencesCopyWith<ThemePreferences> get copyWith => _$ThemePreferencesCopyWithImpl<ThemePreferences>(this as ThemePreferences, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemePreferences&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.colorationId, colorationId) || other.colorationId == colorationId));
}


@override
int get hashCode => Object.hash(runtimeType,mode,colorationId);

@override
String toString() {
  return 'ThemePreferences(mode: $mode, colorationId: $colorationId)';
}


}

/// @nodoc
abstract mixin class $ThemePreferencesCopyWith<$Res>  {
  factory $ThemePreferencesCopyWith(ThemePreferences value, $Res Function(ThemePreferences) _then) = _$ThemePreferencesCopyWithImpl;
@useResult
$Res call({
 ThemeMode mode, UniqueId colorationId
});




}
/// @nodoc
class _$ThemePreferencesCopyWithImpl<$Res>
    implements $ThemePreferencesCopyWith<$Res> {
  _$ThemePreferencesCopyWithImpl(this._self, this._then);

  final ThemePreferences _self;
  final $Res Function(ThemePreferences) _then;

/// Create a copy of ThemePreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? colorationId = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ThemeMode,colorationId: null == colorationId ? _self.colorationId : colorationId // ignore: cast_nullable_to_non_nullable
as UniqueId,
  ));
}

}


/// Adds pattern-matching-related methods to [ThemePreferences].
extension ThemePreferencesPatterns on ThemePreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThemePreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThemePreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThemePreferences value)  $default,){
final _that = this;
switch (_that) {
case _ThemePreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThemePreferences value)?  $default,){
final _that = this;
switch (_that) {
case _ThemePreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode mode,  UniqueId colorationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThemePreferences() when $default != null:
return $default(_that.mode,_that.colorationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode mode,  UniqueId colorationId)  $default,) {final _that = this;
switch (_that) {
case _ThemePreferences():
return $default(_that.mode,_that.colorationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode mode,  UniqueId colorationId)?  $default,) {final _that = this;
switch (_that) {
case _ThemePreferences() when $default != null:
return $default(_that.mode,_that.colorationId);case _:
  return null;

}
}

}

/// @nodoc


class _ThemePreferences implements ThemePreferences {
  const _ThemePreferences({required this.mode, required this.colorationId});
  

@override final  ThemeMode mode;
@override final  UniqueId colorationId;

/// Create a copy of ThemePreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThemePreferencesCopyWith<_ThemePreferences> get copyWith => __$ThemePreferencesCopyWithImpl<_ThemePreferences>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemePreferences&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.colorationId, colorationId) || other.colorationId == colorationId));
}


@override
int get hashCode => Object.hash(runtimeType,mode,colorationId);

@override
String toString() {
  return 'ThemePreferences(mode: $mode, colorationId: $colorationId)';
}


}

/// @nodoc
abstract mixin class _$ThemePreferencesCopyWith<$Res> implements $ThemePreferencesCopyWith<$Res> {
  factory _$ThemePreferencesCopyWith(_ThemePreferences value, $Res Function(_ThemePreferences) _then) = __$ThemePreferencesCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode mode, UniqueId colorationId
});




}
/// @nodoc
class __$ThemePreferencesCopyWithImpl<$Res>
    implements _$ThemePreferencesCopyWith<$Res> {
  __$ThemePreferencesCopyWithImpl(this._self, this._then);

  final _ThemePreferences _self;
  final $Res Function(_ThemePreferences) _then;

/// Create a copy of ThemePreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? colorationId = null,}) {
  return _then(_ThemePreferences(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ThemeMode,colorationId: null == colorationId ? _self.colorationId : colorationId // ignore: cast_nullable_to_non_nullable
as UniqueId,
  ));
}


}

// dart format on
