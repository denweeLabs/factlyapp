// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackgroundPreferences {

 UniqueId get selectedBackgroundId;
/// Create a copy of BackgroundPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundPreferencesCopyWith<BackgroundPreferences> get copyWith => _$BackgroundPreferencesCopyWithImpl<BackgroundPreferences>(this as BackgroundPreferences, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundPreferences&&(identical(other.selectedBackgroundId, selectedBackgroundId) || other.selectedBackgroundId == selectedBackgroundId));
}


@override
int get hashCode => Object.hash(runtimeType,selectedBackgroundId);

@override
String toString() {
  return 'BackgroundPreferences(selectedBackgroundId: $selectedBackgroundId)';
}


}

/// @nodoc
abstract mixin class $BackgroundPreferencesCopyWith<$Res>  {
  factory $BackgroundPreferencesCopyWith(BackgroundPreferences value, $Res Function(BackgroundPreferences) _then) = _$BackgroundPreferencesCopyWithImpl;
@useResult
$Res call({
 UniqueId selectedBackgroundId
});




}
/// @nodoc
class _$BackgroundPreferencesCopyWithImpl<$Res>
    implements $BackgroundPreferencesCopyWith<$Res> {
  _$BackgroundPreferencesCopyWithImpl(this._self, this._then);

  final BackgroundPreferences _self;
  final $Res Function(BackgroundPreferences) _then;

/// Create a copy of BackgroundPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedBackgroundId = null,}) {
  return _then(_self.copyWith(
selectedBackgroundId: null == selectedBackgroundId ? _self.selectedBackgroundId : selectedBackgroundId // ignore: cast_nullable_to_non_nullable
as UniqueId,
  ));
}

}


/// Adds pattern-matching-related methods to [BackgroundPreferences].
extension BackgroundPreferencesPatterns on BackgroundPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackgroundPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackgroundPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackgroundPreferences value)  $default,){
final _that = this;
switch (_that) {
case _BackgroundPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackgroundPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _BackgroundPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UniqueId selectedBackgroundId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackgroundPreferences() when $default != null:
return $default(_that.selectedBackgroundId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UniqueId selectedBackgroundId)  $default,) {final _that = this;
switch (_that) {
case _BackgroundPreferences():
return $default(_that.selectedBackgroundId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UniqueId selectedBackgroundId)?  $default,) {final _that = this;
switch (_that) {
case _BackgroundPreferences() when $default != null:
return $default(_that.selectedBackgroundId);case _:
  return null;

}
}

}

/// @nodoc


class _BackgroundPreferences implements BackgroundPreferences {
  const _BackgroundPreferences({required this.selectedBackgroundId});
  

@override final  UniqueId selectedBackgroundId;

/// Create a copy of BackgroundPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundPreferencesCopyWith<_BackgroundPreferences> get copyWith => __$BackgroundPreferencesCopyWithImpl<_BackgroundPreferences>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackgroundPreferences&&(identical(other.selectedBackgroundId, selectedBackgroundId) || other.selectedBackgroundId == selectedBackgroundId));
}


@override
int get hashCode => Object.hash(runtimeType,selectedBackgroundId);

@override
String toString() {
  return 'BackgroundPreferences(selectedBackgroundId: $selectedBackgroundId)';
}


}

/// @nodoc
abstract mixin class _$BackgroundPreferencesCopyWith<$Res> implements $BackgroundPreferencesCopyWith<$Res> {
  factory _$BackgroundPreferencesCopyWith(_BackgroundPreferences value, $Res Function(_BackgroundPreferences) _then) = __$BackgroundPreferencesCopyWithImpl;
@override @useResult
$Res call({
 UniqueId selectedBackgroundId
});




}
/// @nodoc
class __$BackgroundPreferencesCopyWithImpl<$Res>
    implements _$BackgroundPreferencesCopyWith<$Res> {
  __$BackgroundPreferencesCopyWithImpl(this._self, this._then);

  final _BackgroundPreferences _self;
  final $Res Function(_BackgroundPreferences) _then;

/// Create a copy of BackgroundPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedBackgroundId = null,}) {
  return _then(_BackgroundPreferences(
selectedBackgroundId: null == selectedBackgroundId ? _self.selectedBackgroundId : selectedBackgroundId // ignore: cast_nullable_to_non_nullable
as UniqueId,
  ));
}


}

// dart format on
