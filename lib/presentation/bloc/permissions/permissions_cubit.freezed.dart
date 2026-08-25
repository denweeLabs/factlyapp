// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permissions_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PermissionsState {

 bool get checkingNotificationsPermission; bool get checkingPhotosAddPermission; bool get checkingPhotosFullPermission; Option<AppPermissionStatus> get notificationsPermission; Option<AppPermissionStatus> get photosAddPermission; Option<AppPermissionStatus> get photosFullPermission;
/// Create a copy of PermissionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionsStateCopyWith<PermissionsState> get copyWith => _$PermissionsStateCopyWithImpl<PermissionsState>(this as PermissionsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionsState&&(identical(other.checkingNotificationsPermission, checkingNotificationsPermission) || other.checkingNotificationsPermission == checkingNotificationsPermission)&&(identical(other.checkingPhotosAddPermission, checkingPhotosAddPermission) || other.checkingPhotosAddPermission == checkingPhotosAddPermission)&&(identical(other.checkingPhotosFullPermission, checkingPhotosFullPermission) || other.checkingPhotosFullPermission == checkingPhotosFullPermission)&&(identical(other.notificationsPermission, notificationsPermission) || other.notificationsPermission == notificationsPermission)&&(identical(other.photosAddPermission, photosAddPermission) || other.photosAddPermission == photosAddPermission)&&(identical(other.photosFullPermission, photosFullPermission) || other.photosFullPermission == photosFullPermission));
}


@override
int get hashCode => Object.hash(runtimeType,checkingNotificationsPermission,checkingPhotosAddPermission,checkingPhotosFullPermission,notificationsPermission,photosAddPermission,photosFullPermission);

@override
String toString() {
  return 'PermissionsState(checkingNotificationsPermission: $checkingNotificationsPermission, checkingPhotosAddPermission: $checkingPhotosAddPermission, checkingPhotosFullPermission: $checkingPhotosFullPermission, notificationsPermission: $notificationsPermission, photosAddPermission: $photosAddPermission, photosFullPermission: $photosFullPermission)';
}


}

/// @nodoc
abstract mixin class $PermissionsStateCopyWith<$Res>  {
  factory $PermissionsStateCopyWith(PermissionsState value, $Res Function(PermissionsState) _then) = _$PermissionsStateCopyWithImpl;
@useResult
$Res call({
 bool checkingNotificationsPermission, bool checkingPhotosAddPermission, bool checkingPhotosFullPermission, Option<AppPermissionStatus> notificationsPermission, Option<AppPermissionStatus> photosAddPermission, Option<AppPermissionStatus> photosFullPermission
});




}
/// @nodoc
class _$PermissionsStateCopyWithImpl<$Res>
    implements $PermissionsStateCopyWith<$Res> {
  _$PermissionsStateCopyWithImpl(this._self, this._then);

  final PermissionsState _self;
  final $Res Function(PermissionsState) _then;

/// Create a copy of PermissionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkingNotificationsPermission = null,Object? checkingPhotosAddPermission = null,Object? checkingPhotosFullPermission = null,Object? notificationsPermission = null,Object? photosAddPermission = null,Object? photosFullPermission = null,}) {
  return _then(_self.copyWith(
checkingNotificationsPermission: null == checkingNotificationsPermission ? _self.checkingNotificationsPermission : checkingNotificationsPermission // ignore: cast_nullable_to_non_nullable
as bool,checkingPhotosAddPermission: null == checkingPhotosAddPermission ? _self.checkingPhotosAddPermission : checkingPhotosAddPermission // ignore: cast_nullable_to_non_nullable
as bool,checkingPhotosFullPermission: null == checkingPhotosFullPermission ? _self.checkingPhotosFullPermission : checkingPhotosFullPermission // ignore: cast_nullable_to_non_nullable
as bool,notificationsPermission: null == notificationsPermission ? _self.notificationsPermission : notificationsPermission // ignore: cast_nullable_to_non_nullable
as Option<AppPermissionStatus>,photosAddPermission: null == photosAddPermission ? _self.photosAddPermission : photosAddPermission // ignore: cast_nullable_to_non_nullable
as Option<AppPermissionStatus>,photosFullPermission: null == photosFullPermission ? _self.photosFullPermission : photosFullPermission // ignore: cast_nullable_to_non_nullable
as Option<AppPermissionStatus>,
  ));
}

}


/// Adds pattern-matching-related methods to [PermissionsState].
extension PermissionsStatePatterns on PermissionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermissionsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermissionsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermissionsState value)  $default,){
final _that = this;
switch (_that) {
case _PermissionsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermissionsState value)?  $default,){
final _that = this;
switch (_that) {
case _PermissionsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool checkingNotificationsPermission,  bool checkingPhotosAddPermission,  bool checkingPhotosFullPermission,  Option<AppPermissionStatus> notificationsPermission,  Option<AppPermissionStatus> photosAddPermission,  Option<AppPermissionStatus> photosFullPermission)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermissionsState() when $default != null:
return $default(_that.checkingNotificationsPermission,_that.checkingPhotosAddPermission,_that.checkingPhotosFullPermission,_that.notificationsPermission,_that.photosAddPermission,_that.photosFullPermission);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool checkingNotificationsPermission,  bool checkingPhotosAddPermission,  bool checkingPhotosFullPermission,  Option<AppPermissionStatus> notificationsPermission,  Option<AppPermissionStatus> photosAddPermission,  Option<AppPermissionStatus> photosFullPermission)  $default,) {final _that = this;
switch (_that) {
case _PermissionsState():
return $default(_that.checkingNotificationsPermission,_that.checkingPhotosAddPermission,_that.checkingPhotosFullPermission,_that.notificationsPermission,_that.photosAddPermission,_that.photosFullPermission);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool checkingNotificationsPermission,  bool checkingPhotosAddPermission,  bool checkingPhotosFullPermission,  Option<AppPermissionStatus> notificationsPermission,  Option<AppPermissionStatus> photosAddPermission,  Option<AppPermissionStatus> photosFullPermission)?  $default,) {final _that = this;
switch (_that) {
case _PermissionsState() when $default != null:
return $default(_that.checkingNotificationsPermission,_that.checkingPhotosAddPermission,_that.checkingPhotosFullPermission,_that.notificationsPermission,_that.photosAddPermission,_that.photosFullPermission);case _:
  return null;

}
}

}

/// @nodoc


class _PermissionsState extends PermissionsState {
  const _PermissionsState({this.checkingNotificationsPermission = false, this.checkingPhotosAddPermission = false, this.checkingPhotosFullPermission = false, this.notificationsPermission = const None(), this.photosAddPermission = const None(), this.photosFullPermission = const None()}): super._();
  

@override@JsonKey() final  bool checkingNotificationsPermission;
@override@JsonKey() final  bool checkingPhotosAddPermission;
@override@JsonKey() final  bool checkingPhotosFullPermission;
@override@JsonKey() final  Option<AppPermissionStatus> notificationsPermission;
@override@JsonKey() final  Option<AppPermissionStatus> photosAddPermission;
@override@JsonKey() final  Option<AppPermissionStatus> photosFullPermission;

/// Create a copy of PermissionsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionsStateCopyWith<_PermissionsState> get copyWith => __$PermissionsStateCopyWithImpl<_PermissionsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionsState&&(identical(other.checkingNotificationsPermission, checkingNotificationsPermission) || other.checkingNotificationsPermission == checkingNotificationsPermission)&&(identical(other.checkingPhotosAddPermission, checkingPhotosAddPermission) || other.checkingPhotosAddPermission == checkingPhotosAddPermission)&&(identical(other.checkingPhotosFullPermission, checkingPhotosFullPermission) || other.checkingPhotosFullPermission == checkingPhotosFullPermission)&&(identical(other.notificationsPermission, notificationsPermission) || other.notificationsPermission == notificationsPermission)&&(identical(other.photosAddPermission, photosAddPermission) || other.photosAddPermission == photosAddPermission)&&(identical(other.photosFullPermission, photosFullPermission) || other.photosFullPermission == photosFullPermission));
}


@override
int get hashCode => Object.hash(runtimeType,checkingNotificationsPermission,checkingPhotosAddPermission,checkingPhotosFullPermission,notificationsPermission,photosAddPermission,photosFullPermission);

@override
String toString() {
  return 'PermissionsState(checkingNotificationsPermission: $checkingNotificationsPermission, checkingPhotosAddPermission: $checkingPhotosAddPermission, checkingPhotosFullPermission: $checkingPhotosFullPermission, notificationsPermission: $notificationsPermission, photosAddPermission: $photosAddPermission, photosFullPermission: $photosFullPermission)';
}


}

/// @nodoc
abstract mixin class _$PermissionsStateCopyWith<$Res> implements $PermissionsStateCopyWith<$Res> {
  factory _$PermissionsStateCopyWith(_PermissionsState value, $Res Function(_PermissionsState) _then) = __$PermissionsStateCopyWithImpl;
@override @useResult
$Res call({
 bool checkingNotificationsPermission, bool checkingPhotosAddPermission, bool checkingPhotosFullPermission, Option<AppPermissionStatus> notificationsPermission, Option<AppPermissionStatus> photosAddPermission, Option<AppPermissionStatus> photosFullPermission
});




}
/// @nodoc
class __$PermissionsStateCopyWithImpl<$Res>
    implements _$PermissionsStateCopyWith<$Res> {
  __$PermissionsStateCopyWithImpl(this._self, this._then);

  final _PermissionsState _self;
  final $Res Function(_PermissionsState) _then;

/// Create a copy of PermissionsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkingNotificationsPermission = null,Object? checkingPhotosAddPermission = null,Object? checkingPhotosFullPermission = null,Object? notificationsPermission = null,Object? photosAddPermission = null,Object? photosFullPermission = null,}) {
  return _then(_PermissionsState(
checkingNotificationsPermission: null == checkingNotificationsPermission ? _self.checkingNotificationsPermission : checkingNotificationsPermission // ignore: cast_nullable_to_non_nullable
as bool,checkingPhotosAddPermission: null == checkingPhotosAddPermission ? _self.checkingPhotosAddPermission : checkingPhotosAddPermission // ignore: cast_nullable_to_non_nullable
as bool,checkingPhotosFullPermission: null == checkingPhotosFullPermission ? _self.checkingPhotosFullPermission : checkingPhotosFullPermission // ignore: cast_nullable_to_non_nullable
as bool,notificationsPermission: null == notificationsPermission ? _self.notificationsPermission : notificationsPermission // ignore: cast_nullable_to_non_nullable
as Option<AppPermissionStatus>,photosAddPermission: null == photosAddPermission ? _self.photosAddPermission : photosAddPermission // ignore: cast_nullable_to_non_nullable
as Option<AppPermissionStatus>,photosFullPermission: null == photosFullPermission ? _self.photosFullPermission : photosFullPermission // ignore: cast_nullable_to_non_nullable
as Option<AppPermissionStatus>,
  ));
}


}

// dart format on
