// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPreferencesState {

 UserPreferences get preferences; Option<PreferencesFailure> get failure;
/// Create a copy of UserPreferencesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferencesStateCopyWith<UserPreferencesState> get copyWith => _$UserPreferencesStateCopyWithImpl<UserPreferencesState>(this as UserPreferencesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreferencesState&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,preferences,failure);

@override
String toString() {
  return 'UserPreferencesState(preferences: $preferences, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $UserPreferencesStateCopyWith<$Res>  {
  factory $UserPreferencesStateCopyWith(UserPreferencesState value, $Res Function(UserPreferencesState) _then) = _$UserPreferencesStateCopyWithImpl;
@useResult
$Res call({
 UserPreferences preferences, Option<PreferencesFailure> failure
});


$UserPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class _$UserPreferencesStateCopyWithImpl<$Res>
    implements $UserPreferencesStateCopyWith<$Res> {
  _$UserPreferencesStateCopyWithImpl(this._self, this._then);

  final UserPreferencesState _self;
  final $Res Function(UserPreferencesState) _then;

/// Create a copy of UserPreferencesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? preferences = null,Object? failure = null,}) {
  return _then(_self.copyWith(
preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Option<PreferencesFailure>,
  ));
}
/// Create a copy of UserPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<$Res> get preferences {
  
  return $UserPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserPreferencesState].
extension UserPreferencesStatePatterns on UserPreferencesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreferencesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreferencesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreferencesState value)  $default,){
final _that = this;
switch (_that) {
case _UserPreferencesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreferencesState value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreferencesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserPreferences preferences,  Option<PreferencesFailure> failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreferencesState() when $default != null:
return $default(_that.preferences,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserPreferences preferences,  Option<PreferencesFailure> failure)  $default,) {final _that = this;
switch (_that) {
case _UserPreferencesState():
return $default(_that.preferences,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserPreferences preferences,  Option<PreferencesFailure> failure)?  $default,) {final _that = this;
switch (_that) {
case _UserPreferencesState() when $default != null:
return $default(_that.preferences,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _UserPreferencesState extends UserPreferencesState {
  const _UserPreferencesState({required this.preferences, this.failure = const None()}): super._();
  

@override final  UserPreferences preferences;
@override@JsonKey() final  Option<PreferencesFailure> failure;

/// Create a copy of UserPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferencesStateCopyWith<_UserPreferencesState> get copyWith => __$UserPreferencesStateCopyWithImpl<_UserPreferencesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreferencesState&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,preferences,failure);

@override
String toString() {
  return 'UserPreferencesState(preferences: $preferences, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$UserPreferencesStateCopyWith<$Res> implements $UserPreferencesStateCopyWith<$Res> {
  factory _$UserPreferencesStateCopyWith(_UserPreferencesState value, $Res Function(_UserPreferencesState) _then) = __$UserPreferencesStateCopyWithImpl;
@override @useResult
$Res call({
 UserPreferences preferences, Option<PreferencesFailure> failure
});


@override $UserPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class __$UserPreferencesStateCopyWithImpl<$Res>
    implements _$UserPreferencesStateCopyWith<$Res> {
  __$UserPreferencesStateCopyWithImpl(this._self, this._then);

  final _UserPreferencesState _self;
  final $Res Function(_UserPreferencesState) _then;

/// Create a copy of UserPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? preferences = null,Object? failure = null,}) {
  return _then(_UserPreferencesState(
preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Option<PreferencesFailure>,
  ));
}

/// Create a copy of UserPreferencesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<$Res> get preferences {
  
  return $UserPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}

// dart format on
