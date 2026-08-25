// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_subscription_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserSubscriptionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubscriptionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserSubscriptionState()';
}


}

/// @nodoc
class $UserSubscriptionStateCopyWith<$Res>  {
$UserSubscriptionStateCopyWith(UserSubscriptionState _, $Res Function(UserSubscriptionState) __);
}


/// Adds pattern-matching-related methods to [UserSubscriptionState].
extension UserSubscriptionStatePatterns on UserSubscriptionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CheckingSubscription value)?  checkingSubscription,TResult Function( _Unsubscribed value)?  unsubscribed,TResult Function( _Subscribed value)?  subscribed,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckingSubscription() when checkingSubscription != null:
return checkingSubscription(_that);case _Unsubscribed() when unsubscribed != null:
return unsubscribed(_that);case _Subscribed() when subscribed != null:
return subscribed(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CheckingSubscription value)  checkingSubscription,required TResult Function( _Unsubscribed value)  unsubscribed,required TResult Function( _Subscribed value)  subscribed,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _CheckingSubscription():
return checkingSubscription(_that);case _Unsubscribed():
return unsubscribed(_that);case _Subscribed():
return subscribed(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CheckingSubscription value)?  checkingSubscription,TResult? Function( _Unsubscribed value)?  unsubscribed,TResult? Function( _Subscribed value)?  subscribed,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _CheckingSubscription() when checkingSubscription != null:
return checkingSubscription(_that);case _Unsubscribed() when unsubscribed != null:
return unsubscribed(_that);case _Subscribed() when subscribed != null:
return subscribed(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkingSubscription,TResult Function()?  unsubscribed,TResult Function( UserSubscription subscription)?  subscribed,TResult Function( SubscriptionsFailure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckingSubscription() when checkingSubscription != null:
return checkingSubscription();case _Unsubscribed() when unsubscribed != null:
return unsubscribed();case _Subscribed() when subscribed != null:
return subscribed(_that.subscription);case _Failure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkingSubscription,required TResult Function()  unsubscribed,required TResult Function( UserSubscription subscription)  subscribed,required TResult Function( SubscriptionsFailure failure)  failure,}) {final _that = this;
switch (_that) {
case _CheckingSubscription():
return checkingSubscription();case _Unsubscribed():
return unsubscribed();case _Subscribed():
return subscribed(_that.subscription);case _Failure():
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkingSubscription,TResult? Function()?  unsubscribed,TResult? Function( UserSubscription subscription)?  subscribed,TResult? Function( SubscriptionsFailure failure)?  failure,}) {final _that = this;
switch (_that) {
case _CheckingSubscription() when checkingSubscription != null:
return checkingSubscription();case _Unsubscribed() when unsubscribed != null:
return unsubscribed();case _Subscribed() when subscribed != null:
return subscribed(_that.subscription);case _Failure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _CheckingSubscription extends UserSubscriptionState {
  const _CheckingSubscription(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckingSubscription);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserSubscriptionState.checkingSubscription()';
}


}




/// @nodoc


class _Unsubscribed extends UserSubscriptionState {
  const _Unsubscribed(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unsubscribed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserSubscriptionState.unsubscribed()';
}


}




/// @nodoc


class _Subscribed extends UserSubscriptionState {
  const _Subscribed(this.subscription): super._();
  

 final  UserSubscription subscription;

/// Create a copy of UserSubscriptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscribedCopyWith<_Subscribed> get copyWith => __$SubscribedCopyWithImpl<_Subscribed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscribed&&(identical(other.subscription, subscription) || other.subscription == subscription));
}


@override
int get hashCode => Object.hash(runtimeType,subscription);

@override
String toString() {
  return 'UserSubscriptionState.subscribed(subscription: $subscription)';
}


}

/// @nodoc
abstract mixin class _$SubscribedCopyWith<$Res> implements $UserSubscriptionStateCopyWith<$Res> {
  factory _$SubscribedCopyWith(_Subscribed value, $Res Function(_Subscribed) _then) = __$SubscribedCopyWithImpl;
@useResult
$Res call({
 UserSubscription subscription
});


$UserSubscriptionCopyWith<$Res> get subscription;

}
/// @nodoc
class __$SubscribedCopyWithImpl<$Res>
    implements _$SubscribedCopyWith<$Res> {
  __$SubscribedCopyWithImpl(this._self, this._then);

  final _Subscribed _self;
  final $Res Function(_Subscribed) _then;

/// Create a copy of UserSubscriptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subscription = null,}) {
  return _then(_Subscribed(
null == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as UserSubscription,
  ));
}

/// Create a copy of UserSubscriptionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSubscriptionCopyWith<$Res> get subscription {
  
  return $UserSubscriptionCopyWith<$Res>(_self.subscription, (value) {
    return _then(_self.copyWith(subscription: value));
  });
}
}

/// @nodoc


class _Failure extends UserSubscriptionState {
  const _Failure(this.failure): super._();
  

 final  SubscriptionsFailure failure;

/// Create a copy of UserSubscriptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'UserSubscriptionState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $UserSubscriptionStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 SubscriptionsFailure failure
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of UserSubscriptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Failure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as SubscriptionsFailure,
  ));
}


}

// dart format on
