// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'misc_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MiscPreferences {

 bool get isHapticsEnabled;
/// Create a copy of MiscPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MiscPreferencesCopyWith<MiscPreferences> get copyWith => _$MiscPreferencesCopyWithImpl<MiscPreferences>(this as MiscPreferences, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MiscPreferences&&(identical(other.isHapticsEnabled, isHapticsEnabled) || other.isHapticsEnabled == isHapticsEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,isHapticsEnabled);

@override
String toString() {
  return 'MiscPreferences(isHapticsEnabled: $isHapticsEnabled)';
}


}

/// @nodoc
abstract mixin class $MiscPreferencesCopyWith<$Res>  {
  factory $MiscPreferencesCopyWith(MiscPreferences value, $Res Function(MiscPreferences) _then) = _$MiscPreferencesCopyWithImpl;
@useResult
$Res call({
 bool isHapticsEnabled
});




}
/// @nodoc
class _$MiscPreferencesCopyWithImpl<$Res>
    implements $MiscPreferencesCopyWith<$Res> {
  _$MiscPreferencesCopyWithImpl(this._self, this._then);

  final MiscPreferences _self;
  final $Res Function(MiscPreferences) _then;

/// Create a copy of MiscPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isHapticsEnabled = null,}) {
  return _then(_self.copyWith(
isHapticsEnabled: null == isHapticsEnabled ? _self.isHapticsEnabled : isHapticsEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MiscPreferences].
extension MiscPreferencesPatterns on MiscPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MiscPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MiscPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MiscPreferences value)  $default,){
final _that = this;
switch (_that) {
case _MiscPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MiscPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _MiscPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isHapticsEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MiscPreferences() when $default != null:
return $default(_that.isHapticsEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isHapticsEnabled)  $default,) {final _that = this;
switch (_that) {
case _MiscPreferences():
return $default(_that.isHapticsEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isHapticsEnabled)?  $default,) {final _that = this;
switch (_that) {
case _MiscPreferences() when $default != null:
return $default(_that.isHapticsEnabled);case _:
  return null;

}
}

}

/// @nodoc


class _MiscPreferences implements MiscPreferences {
  const _MiscPreferences({required this.isHapticsEnabled});
  

@override final  bool isHapticsEnabled;

/// Create a copy of MiscPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MiscPreferencesCopyWith<_MiscPreferences> get copyWith => __$MiscPreferencesCopyWithImpl<_MiscPreferences>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MiscPreferences&&(identical(other.isHapticsEnabled, isHapticsEnabled) || other.isHapticsEnabled == isHapticsEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,isHapticsEnabled);

@override
String toString() {
  return 'MiscPreferences(isHapticsEnabled: $isHapticsEnabled)';
}


}

/// @nodoc
abstract mixin class _$MiscPreferencesCopyWith<$Res> implements $MiscPreferencesCopyWith<$Res> {
  factory _$MiscPreferencesCopyWith(_MiscPreferences value, $Res Function(_MiscPreferences) _then) = __$MiscPreferencesCopyWithImpl;
@override @useResult
$Res call({
 bool isHapticsEnabled
});




}
/// @nodoc
class __$MiscPreferencesCopyWithImpl<$Res>
    implements _$MiscPreferencesCopyWith<$Res> {
  __$MiscPreferencesCopyWithImpl(this._self, this._then);

  final _MiscPreferences _self;
  final $Res Function(_MiscPreferences) _then;

/// Create a copy of MiscPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isHapticsEnabled = null,}) {
  return _then(_MiscPreferences(
isHapticsEnabled: null == isHapticsEnabled ? _self.isHapticsEnabled : isHapticsEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
