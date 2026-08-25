// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'third_party_login_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThirdPartyLoginBody {

 ThirdPartyAuthProvider get provider; String get idToken; Option<String> get accessToken; Option<String> get nonce;
/// Create a copy of ThirdPartyLoginBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThirdPartyLoginBodyCopyWith<ThirdPartyLoginBody> get copyWith => _$ThirdPartyLoginBodyCopyWithImpl<ThirdPartyLoginBody>(this as ThirdPartyLoginBody, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThirdPartyLoginBody&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.nonce, nonce) || other.nonce == nonce));
}


@override
int get hashCode => Object.hash(runtimeType,provider,idToken,accessToken,nonce);

@override
String toString() {
  return 'ThirdPartyLoginBody(provider: $provider, idToken: $idToken, accessToken: $accessToken, nonce: $nonce)';
}


}

/// @nodoc
abstract mixin class $ThirdPartyLoginBodyCopyWith<$Res>  {
  factory $ThirdPartyLoginBodyCopyWith(ThirdPartyLoginBody value, $Res Function(ThirdPartyLoginBody) _then) = _$ThirdPartyLoginBodyCopyWithImpl;
@useResult
$Res call({
 ThirdPartyAuthProvider provider, String idToken, Option<String> accessToken, Option<String> nonce
});




}
/// @nodoc
class _$ThirdPartyLoginBodyCopyWithImpl<$Res>
    implements $ThirdPartyLoginBodyCopyWith<$Res> {
  _$ThirdPartyLoginBodyCopyWithImpl(this._self, this._then);

  final ThirdPartyLoginBody _self;
  final $Res Function(ThirdPartyLoginBody) _then;

/// Create a copy of ThirdPartyLoginBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = null,Object? idToken = null,Object? accessToken = null,Object? nonce = null,}) {
  return _then(_self.copyWith(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as ThirdPartyAuthProvider,idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as Option<String>,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as Option<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ThirdPartyLoginBody].
extension ThirdPartyLoginBodyPatterns on ThirdPartyLoginBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThirdPartyLoginBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThirdPartyLoginBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThirdPartyLoginBody value)  $default,){
final _that = this;
switch (_that) {
case _ThirdPartyLoginBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThirdPartyLoginBody value)?  $default,){
final _that = this;
switch (_that) {
case _ThirdPartyLoginBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThirdPartyAuthProvider provider,  String idToken,  Option<String> accessToken,  Option<String> nonce)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThirdPartyLoginBody() when $default != null:
return $default(_that.provider,_that.idToken,_that.accessToken,_that.nonce);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThirdPartyAuthProvider provider,  String idToken,  Option<String> accessToken,  Option<String> nonce)  $default,) {final _that = this;
switch (_that) {
case _ThirdPartyLoginBody():
return $default(_that.provider,_that.idToken,_that.accessToken,_that.nonce);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThirdPartyAuthProvider provider,  String idToken,  Option<String> accessToken,  Option<String> nonce)?  $default,) {final _that = this;
switch (_that) {
case _ThirdPartyLoginBody() when $default != null:
return $default(_that.provider,_that.idToken,_that.accessToken,_that.nonce);case _:
  return null;

}
}

}

/// @nodoc


class _ThirdPartyLoginBody implements ThirdPartyLoginBody {
  const _ThirdPartyLoginBody({required this.provider, required this.idToken, required this.accessToken, required this.nonce});
  

@override final  ThirdPartyAuthProvider provider;
@override final  String idToken;
@override final  Option<String> accessToken;
@override final  Option<String> nonce;

/// Create a copy of ThirdPartyLoginBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThirdPartyLoginBodyCopyWith<_ThirdPartyLoginBody> get copyWith => __$ThirdPartyLoginBodyCopyWithImpl<_ThirdPartyLoginBody>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThirdPartyLoginBody&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.nonce, nonce) || other.nonce == nonce));
}


@override
int get hashCode => Object.hash(runtimeType,provider,idToken,accessToken,nonce);

@override
String toString() {
  return 'ThirdPartyLoginBody(provider: $provider, idToken: $idToken, accessToken: $accessToken, nonce: $nonce)';
}


}

/// @nodoc
abstract mixin class _$ThirdPartyLoginBodyCopyWith<$Res> implements $ThirdPartyLoginBodyCopyWith<$Res> {
  factory _$ThirdPartyLoginBodyCopyWith(_ThirdPartyLoginBody value, $Res Function(_ThirdPartyLoginBody) _then) = __$ThirdPartyLoginBodyCopyWithImpl;
@override @useResult
$Res call({
 ThirdPartyAuthProvider provider, String idToken, Option<String> accessToken, Option<String> nonce
});




}
/// @nodoc
class __$ThirdPartyLoginBodyCopyWithImpl<$Res>
    implements _$ThirdPartyLoginBodyCopyWith<$Res> {
  __$ThirdPartyLoginBodyCopyWithImpl(this._self, this._then);

  final _ThirdPartyLoginBody _self;
  final $Res Function(_ThirdPartyLoginBody) _then;

/// Create a copy of ThirdPartyLoginBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? idToken = null,Object? accessToken = null,Object? nonce = null,}) {
  return _then(_ThirdPartyLoginBody(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as ThirdPartyAuthProvider,idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as Option<String>,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as Option<String>,
  ));
}


}

// dart format on
