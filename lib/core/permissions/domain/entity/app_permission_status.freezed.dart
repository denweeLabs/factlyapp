// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_permission_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppPermissionStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppPermissionStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppPermissionStatus()';
}


}

/// @nodoc
class $AppPermissionStatusCopyWith<$Res>  {
$AppPermissionStatusCopyWith(AppPermissionStatus _, $Res Function(AppPermissionStatus) __);
}


/// Adds pattern-matching-related methods to [AppPermissionStatus].
extension AppPermissionStatusPatterns on AppPermissionStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Granted value)?  granted,TResult Function( _Denied value)?  denied,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Granted() when granted != null:
return granted(_that);case _Denied() when denied != null:
return denied(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Granted value)  granted,required TResult Function( _Denied value)  denied,}){
final _that = this;
switch (_that) {
case _Granted():
return granted(_that);case _Denied():
return denied(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Granted value)?  granted,TResult? Function( _Denied value)?  denied,}){
final _that = this;
switch (_that) {
case _Granted() when granted != null:
return granted(_that);case _Denied() when denied != null:
return denied(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isLimited)?  granted,TResult Function( bool isForever)?  denied,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Granted() when granted != null:
return granted(_that.isLimited);case _Denied() when denied != null:
return denied(_that.isForever);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isLimited)  granted,required TResult Function( bool isForever)  denied,}) {final _that = this;
switch (_that) {
case _Granted():
return granted(_that.isLimited);case _Denied():
return denied(_that.isForever);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isLimited)?  granted,TResult? Function( bool isForever)?  denied,}) {final _that = this;
switch (_that) {
case _Granted() when granted != null:
return granted(_that.isLimited);case _Denied() when denied != null:
return denied(_that.isForever);case _:
  return null;

}
}

}

/// @nodoc


class _Granted extends AppPermissionStatus {
  const _Granted({this.isLimited = false}): super._();
  

@JsonKey() final  bool isLimited;

/// Create a copy of AppPermissionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GrantedCopyWith<_Granted> get copyWith => __$GrantedCopyWithImpl<_Granted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Granted&&(identical(other.isLimited, isLimited) || other.isLimited == isLimited));
}


@override
int get hashCode => Object.hash(runtimeType,isLimited);

@override
String toString() {
  return 'AppPermissionStatus.granted(isLimited: $isLimited)';
}


}

/// @nodoc
abstract mixin class _$GrantedCopyWith<$Res> implements $AppPermissionStatusCopyWith<$Res> {
  factory _$GrantedCopyWith(_Granted value, $Res Function(_Granted) _then) = __$GrantedCopyWithImpl;
@useResult
$Res call({
 bool isLimited
});




}
/// @nodoc
class __$GrantedCopyWithImpl<$Res>
    implements _$GrantedCopyWith<$Res> {
  __$GrantedCopyWithImpl(this._self, this._then);

  final _Granted _self;
  final $Res Function(_Granted) _then;

/// Create a copy of AppPermissionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isLimited = null,}) {
  return _then(_Granted(
isLimited: null == isLimited ? _self.isLimited : isLimited // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _Denied extends AppPermissionStatus {
  const _Denied({this.isForever = false}): super._();
  

@JsonKey() final  bool isForever;

/// Create a copy of AppPermissionStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeniedCopyWith<_Denied> get copyWith => __$DeniedCopyWithImpl<_Denied>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Denied&&(identical(other.isForever, isForever) || other.isForever == isForever));
}


@override
int get hashCode => Object.hash(runtimeType,isForever);

@override
String toString() {
  return 'AppPermissionStatus.denied(isForever: $isForever)';
}


}

/// @nodoc
abstract mixin class _$DeniedCopyWith<$Res> implements $AppPermissionStatusCopyWith<$Res> {
  factory _$DeniedCopyWith(_Denied value, $Res Function(_Denied) _then) = __$DeniedCopyWithImpl;
@useResult
$Res call({
 bool isForever
});




}
/// @nodoc
class __$DeniedCopyWithImpl<$Res>
    implements _$DeniedCopyWith<$Res> {
  __$DeniedCopyWithImpl(this._self, this._then);

  final _Denied _self;
  final $Res Function(_Denied) _then;

/// Create a copy of AppPermissionStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isForever = null,}) {
  return _then(_Denied(
isForever: null == isForever ? _self.isForever : isForever // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
