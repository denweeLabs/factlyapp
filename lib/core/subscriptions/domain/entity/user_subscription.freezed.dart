// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserSubscription {

 PremiumPackageType get packageType; DateTime get expiresAt;
/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSubscriptionCopyWith<UserSubscription> get copyWith => _$UserSubscriptionCopyWithImpl<UserSubscription>(this as UserSubscription, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubscription&&(identical(other.packageType, packageType) || other.packageType == packageType)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,packageType,expiresAt);

@override
String toString() {
  return 'UserSubscription(packageType: $packageType, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $UserSubscriptionCopyWith<$Res>  {
  factory $UserSubscriptionCopyWith(UserSubscription value, $Res Function(UserSubscription) _then) = _$UserSubscriptionCopyWithImpl;
@useResult
$Res call({
 PremiumPackageType packageType, DateTime expiresAt
});




}
/// @nodoc
class _$UserSubscriptionCopyWithImpl<$Res>
    implements $UserSubscriptionCopyWith<$Res> {
  _$UserSubscriptionCopyWithImpl(this._self, this._then);

  final UserSubscription _self;
  final $Res Function(UserSubscription) _then;

/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageType = null,Object? expiresAt = null,}) {
  return _then(_self.copyWith(
packageType: null == packageType ? _self.packageType : packageType // ignore: cast_nullable_to_non_nullable
as PremiumPackageType,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSubscription].
extension UserSubscriptionPatterns on UserSubscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSubscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSubscription value)  $default,){
final _that = this;
switch (_that) {
case _UserSubscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSubscription value)?  $default,){
final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PremiumPackageType packageType,  DateTime expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
return $default(_that.packageType,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PremiumPackageType packageType,  DateTime expiresAt)  $default,) {final _that = this;
switch (_that) {
case _UserSubscription():
return $default(_that.packageType,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PremiumPackageType packageType,  DateTime expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
return $default(_that.packageType,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserSubscription extends UserSubscription {
  const _UserSubscription({required this.packageType, required this.expiresAt}): super._();
  

@override final  PremiumPackageType packageType;
@override final  DateTime expiresAt;

/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSubscriptionCopyWith<_UserSubscription> get copyWith => __$UserSubscriptionCopyWithImpl<_UserSubscription>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSubscription&&(identical(other.packageType, packageType) || other.packageType == packageType)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}


@override
int get hashCode => Object.hash(runtimeType,packageType,expiresAt);

@override
String toString() {
  return 'UserSubscription(packageType: $packageType, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$UserSubscriptionCopyWith<$Res> implements $UserSubscriptionCopyWith<$Res> {
  factory _$UserSubscriptionCopyWith(_UserSubscription value, $Res Function(_UserSubscription) _then) = __$UserSubscriptionCopyWithImpl;
@override @useResult
$Res call({
 PremiumPackageType packageType, DateTime expiresAt
});




}
/// @nodoc
class __$UserSubscriptionCopyWithImpl<$Res>
    implements _$UserSubscriptionCopyWith<$Res> {
  __$UserSubscriptionCopyWithImpl(this._self, this._then);

  final _UserSubscription _self;
  final $Res Function(_UserSubscription) _then;

/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageType = null,Object? expiresAt = null,}) {
  return _then(_UserSubscription(
packageType: null == packageType ? _self.packageType : packageType // ignore: cast_nullable_to_non_nullable
as PremiumPackageType,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
