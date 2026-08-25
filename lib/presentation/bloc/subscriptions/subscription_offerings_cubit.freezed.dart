// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_offerings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SubscriptionOfferingsState {

 bool get isPurchaseInProgress; bool get isGettingPackages; bool get isPurchaseRestoring; bool get isPurchaseRestoreSuccess; Option<PremiumPackages> get packages; Option<PremiumPackage> get purchasedPackage; Option<SubscriptionsFailure> get failure;
/// Create a copy of SubscriptionOfferingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionOfferingsStateCopyWith<SubscriptionOfferingsState> get copyWith => _$SubscriptionOfferingsStateCopyWithImpl<SubscriptionOfferingsState>(this as SubscriptionOfferingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionOfferingsState&&(identical(other.isPurchaseInProgress, isPurchaseInProgress) || other.isPurchaseInProgress == isPurchaseInProgress)&&(identical(other.isGettingPackages, isGettingPackages) || other.isGettingPackages == isGettingPackages)&&(identical(other.isPurchaseRestoring, isPurchaseRestoring) || other.isPurchaseRestoring == isPurchaseRestoring)&&(identical(other.isPurchaseRestoreSuccess, isPurchaseRestoreSuccess) || other.isPurchaseRestoreSuccess == isPurchaseRestoreSuccess)&&(identical(other.packages, packages) || other.packages == packages)&&(identical(other.purchasedPackage, purchasedPackage) || other.purchasedPackage == purchasedPackage)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,isPurchaseInProgress,isGettingPackages,isPurchaseRestoring,isPurchaseRestoreSuccess,packages,purchasedPackage,failure);

@override
String toString() {
  return 'SubscriptionOfferingsState(isPurchaseInProgress: $isPurchaseInProgress, isGettingPackages: $isGettingPackages, isPurchaseRestoring: $isPurchaseRestoring, isPurchaseRestoreSuccess: $isPurchaseRestoreSuccess, packages: $packages, purchasedPackage: $purchasedPackage, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $SubscriptionOfferingsStateCopyWith<$Res>  {
  factory $SubscriptionOfferingsStateCopyWith(SubscriptionOfferingsState value, $Res Function(SubscriptionOfferingsState) _then) = _$SubscriptionOfferingsStateCopyWithImpl;
@useResult
$Res call({
 bool isPurchaseInProgress, bool isGettingPackages, bool isPurchaseRestoring, bool isPurchaseRestoreSuccess, Option<PremiumPackages> packages, Option<PremiumPackage> purchasedPackage, Option<SubscriptionsFailure> failure
});




}
/// @nodoc
class _$SubscriptionOfferingsStateCopyWithImpl<$Res>
    implements $SubscriptionOfferingsStateCopyWith<$Res> {
  _$SubscriptionOfferingsStateCopyWithImpl(this._self, this._then);

  final SubscriptionOfferingsState _self;
  final $Res Function(SubscriptionOfferingsState) _then;

/// Create a copy of SubscriptionOfferingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPurchaseInProgress = null,Object? isGettingPackages = null,Object? isPurchaseRestoring = null,Object? isPurchaseRestoreSuccess = null,Object? packages = null,Object? purchasedPackage = null,Object? failure = null,}) {
  return _then(_self.copyWith(
isPurchaseInProgress: null == isPurchaseInProgress ? _self.isPurchaseInProgress : isPurchaseInProgress // ignore: cast_nullable_to_non_nullable
as bool,isGettingPackages: null == isGettingPackages ? _self.isGettingPackages : isGettingPackages // ignore: cast_nullable_to_non_nullable
as bool,isPurchaseRestoring: null == isPurchaseRestoring ? _self.isPurchaseRestoring : isPurchaseRestoring // ignore: cast_nullable_to_non_nullable
as bool,isPurchaseRestoreSuccess: null == isPurchaseRestoreSuccess ? _self.isPurchaseRestoreSuccess : isPurchaseRestoreSuccess // ignore: cast_nullable_to_non_nullable
as bool,packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as Option<PremiumPackages>,purchasedPackage: null == purchasedPackage ? _self.purchasedPackage : purchasedPackage // ignore: cast_nullable_to_non_nullable
as Option<PremiumPackage>,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Option<SubscriptionsFailure>,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionOfferingsState].
extension SubscriptionOfferingsStatePatterns on SubscriptionOfferingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionOfferingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionOfferingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionOfferingsState value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionOfferingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionOfferingsState value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionOfferingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPurchaseInProgress,  bool isGettingPackages,  bool isPurchaseRestoring,  bool isPurchaseRestoreSuccess,  Option<PremiumPackages> packages,  Option<PremiumPackage> purchasedPackage,  Option<SubscriptionsFailure> failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionOfferingsState() when $default != null:
return $default(_that.isPurchaseInProgress,_that.isGettingPackages,_that.isPurchaseRestoring,_that.isPurchaseRestoreSuccess,_that.packages,_that.purchasedPackage,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPurchaseInProgress,  bool isGettingPackages,  bool isPurchaseRestoring,  bool isPurchaseRestoreSuccess,  Option<PremiumPackages> packages,  Option<PremiumPackage> purchasedPackage,  Option<SubscriptionsFailure> failure)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionOfferingsState():
return $default(_that.isPurchaseInProgress,_that.isGettingPackages,_that.isPurchaseRestoring,_that.isPurchaseRestoreSuccess,_that.packages,_that.purchasedPackage,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPurchaseInProgress,  bool isGettingPackages,  bool isPurchaseRestoring,  bool isPurchaseRestoreSuccess,  Option<PremiumPackages> packages,  Option<PremiumPackage> purchasedPackage,  Option<SubscriptionsFailure> failure)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionOfferingsState() when $default != null:
return $default(_that.isPurchaseInProgress,_that.isGettingPackages,_that.isPurchaseRestoring,_that.isPurchaseRestoreSuccess,_that.packages,_that.purchasedPackage,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _SubscriptionOfferingsState implements SubscriptionOfferingsState {
  const _SubscriptionOfferingsState({this.isPurchaseInProgress = false, this.isGettingPackages = false, this.isPurchaseRestoring = false, this.isPurchaseRestoreSuccess = false, this.packages = const None(), this.purchasedPackage = const None(), this.failure = const None()});
  

@override@JsonKey() final  bool isPurchaseInProgress;
@override@JsonKey() final  bool isGettingPackages;
@override@JsonKey() final  bool isPurchaseRestoring;
@override@JsonKey() final  bool isPurchaseRestoreSuccess;
@override@JsonKey() final  Option<PremiumPackages> packages;
@override@JsonKey() final  Option<PremiumPackage> purchasedPackage;
@override@JsonKey() final  Option<SubscriptionsFailure> failure;

/// Create a copy of SubscriptionOfferingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionOfferingsStateCopyWith<_SubscriptionOfferingsState> get copyWith => __$SubscriptionOfferingsStateCopyWithImpl<_SubscriptionOfferingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionOfferingsState&&(identical(other.isPurchaseInProgress, isPurchaseInProgress) || other.isPurchaseInProgress == isPurchaseInProgress)&&(identical(other.isGettingPackages, isGettingPackages) || other.isGettingPackages == isGettingPackages)&&(identical(other.isPurchaseRestoring, isPurchaseRestoring) || other.isPurchaseRestoring == isPurchaseRestoring)&&(identical(other.isPurchaseRestoreSuccess, isPurchaseRestoreSuccess) || other.isPurchaseRestoreSuccess == isPurchaseRestoreSuccess)&&(identical(other.packages, packages) || other.packages == packages)&&(identical(other.purchasedPackage, purchasedPackage) || other.purchasedPackage == purchasedPackage)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,isPurchaseInProgress,isGettingPackages,isPurchaseRestoring,isPurchaseRestoreSuccess,packages,purchasedPackage,failure);

@override
String toString() {
  return 'SubscriptionOfferingsState(isPurchaseInProgress: $isPurchaseInProgress, isGettingPackages: $isGettingPackages, isPurchaseRestoring: $isPurchaseRestoring, isPurchaseRestoreSuccess: $isPurchaseRestoreSuccess, packages: $packages, purchasedPackage: $purchasedPackage, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionOfferingsStateCopyWith<$Res> implements $SubscriptionOfferingsStateCopyWith<$Res> {
  factory _$SubscriptionOfferingsStateCopyWith(_SubscriptionOfferingsState value, $Res Function(_SubscriptionOfferingsState) _then) = __$SubscriptionOfferingsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isPurchaseInProgress, bool isGettingPackages, bool isPurchaseRestoring, bool isPurchaseRestoreSuccess, Option<PremiumPackages> packages, Option<PremiumPackage> purchasedPackage, Option<SubscriptionsFailure> failure
});




}
/// @nodoc
class __$SubscriptionOfferingsStateCopyWithImpl<$Res>
    implements _$SubscriptionOfferingsStateCopyWith<$Res> {
  __$SubscriptionOfferingsStateCopyWithImpl(this._self, this._then);

  final _SubscriptionOfferingsState _self;
  final $Res Function(_SubscriptionOfferingsState) _then;

/// Create a copy of SubscriptionOfferingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPurchaseInProgress = null,Object? isGettingPackages = null,Object? isPurchaseRestoring = null,Object? isPurchaseRestoreSuccess = null,Object? packages = null,Object? purchasedPackage = null,Object? failure = null,}) {
  return _then(_SubscriptionOfferingsState(
isPurchaseInProgress: null == isPurchaseInProgress ? _self.isPurchaseInProgress : isPurchaseInProgress // ignore: cast_nullable_to_non_nullable
as bool,isGettingPackages: null == isGettingPackages ? _self.isGettingPackages : isGettingPackages // ignore: cast_nullable_to_non_nullable
as bool,isPurchaseRestoring: null == isPurchaseRestoring ? _self.isPurchaseRestoring : isPurchaseRestoring // ignore: cast_nullable_to_non_nullable
as bool,isPurchaseRestoreSuccess: null == isPurchaseRestoreSuccess ? _self.isPurchaseRestoreSuccess : isPurchaseRestoreSuccess // ignore: cast_nullable_to_non_nullable
as bool,packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as Option<PremiumPackages>,purchasedPackage: null == purchasedPackage ? _self.purchasedPackage : purchasedPackage // ignore: cast_nullable_to_non_nullable
as Option<PremiumPackage>,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Option<SubscriptionsFailure>,
  ));
}


}

// dart format on
