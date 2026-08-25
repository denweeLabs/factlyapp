// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_notification_time_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectNotificationTimeState {

 DateTime get time;
/// Create a copy of SelectNotificationTimeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectNotificationTimeStateCopyWith<SelectNotificationTimeState> get copyWith => _$SelectNotificationTimeStateCopyWithImpl<SelectNotificationTimeState>(this as SelectNotificationTimeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectNotificationTimeState&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode => Object.hash(runtimeType,time);

@override
String toString() {
  return 'SelectNotificationTimeState(time: $time)';
}


}

/// @nodoc
abstract mixin class $SelectNotificationTimeStateCopyWith<$Res>  {
  factory $SelectNotificationTimeStateCopyWith(SelectNotificationTimeState value, $Res Function(SelectNotificationTimeState) _then) = _$SelectNotificationTimeStateCopyWithImpl;
@useResult
$Res call({
 DateTime time
});




}
/// @nodoc
class _$SelectNotificationTimeStateCopyWithImpl<$Res>
    implements $SelectNotificationTimeStateCopyWith<$Res> {
  _$SelectNotificationTimeStateCopyWithImpl(this._self, this._then);

  final SelectNotificationTimeState _self;
  final $Res Function(SelectNotificationTimeState) _then;

/// Create a copy of SelectNotificationTimeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectNotificationTimeState].
extension SelectNotificationTimeStatePatterns on SelectNotificationTimeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectNotificationTimeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectNotificationTimeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectNotificationTimeState value)  $default,){
final _that = this;
switch (_that) {
case _SelectNotificationTimeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectNotificationTimeState value)?  $default,){
final _that = this;
switch (_that) {
case _SelectNotificationTimeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectNotificationTimeState() when $default != null:
return $default(_that.time);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time)  $default,) {final _that = this;
switch (_that) {
case _SelectNotificationTimeState():
return $default(_that.time);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time)?  $default,) {final _that = this;
switch (_that) {
case _SelectNotificationTimeState() when $default != null:
return $default(_that.time);case _:
  return null;

}
}

}

/// @nodoc


class _SelectNotificationTimeState extends SelectNotificationTimeState {
  const _SelectNotificationTimeState({required this.time}): super._();
  

@override final  DateTime time;

/// Create a copy of SelectNotificationTimeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectNotificationTimeStateCopyWith<_SelectNotificationTimeState> get copyWith => __$SelectNotificationTimeStateCopyWithImpl<_SelectNotificationTimeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectNotificationTimeState&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode => Object.hash(runtimeType,time);

@override
String toString() {
  return 'SelectNotificationTimeState(time: $time)';
}


}

/// @nodoc
abstract mixin class _$SelectNotificationTimeStateCopyWith<$Res> implements $SelectNotificationTimeStateCopyWith<$Res> {
  factory _$SelectNotificationTimeStateCopyWith(_SelectNotificationTimeState value, $Res Function(_SelectNotificationTimeState) _then) = __$SelectNotificationTimeStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime time
});




}
/// @nodoc
class __$SelectNotificationTimeStateCopyWithImpl<$Res>
    implements _$SelectNotificationTimeStateCopyWith<$Res> {
  __$SelectNotificationTimeStateCopyWithImpl(this._self, this._then);

  final _SelectNotificationTimeState _self;
  final $Res Function(_SelectNotificationTimeState) _then;

/// Create a copy of SelectNotificationTimeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,}) {
  return _then(_SelectNotificationTimeState(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
