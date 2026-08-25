// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'third_party_register_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ThirdPartyRegisterBody {

 ThirdPartyAuthProvider get provider; String get idToken; Option<String> get accessToken; Option<String> get nonce; UserPreferences get preferences;
/// Create a copy of ThirdPartyRegisterBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThirdPartyRegisterBodyCopyWith<ThirdPartyRegisterBody> get copyWith => _$ThirdPartyRegisterBodyCopyWithImpl<ThirdPartyRegisterBody>(this as ThirdPartyRegisterBody, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThirdPartyRegisterBody&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.preferences, preferences) || other.preferences == preferences));
}


@override
int get hashCode => Object.hash(runtimeType,provider,idToken,accessToken,nonce,preferences);

@override
String toString() {
  return 'ThirdPartyRegisterBody(provider: $provider, idToken: $idToken, accessToken: $accessToken, nonce: $nonce, preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class $ThirdPartyRegisterBodyCopyWith<$Res>  {
  factory $ThirdPartyRegisterBodyCopyWith(ThirdPartyRegisterBody value, $Res Function(ThirdPartyRegisterBody) _then) = _$ThirdPartyRegisterBodyCopyWithImpl;
@useResult
$Res call({
 ThirdPartyAuthProvider provider, String idToken, Option<String> accessToken, Option<String> nonce, UserPreferences preferences
});


$UserPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class _$ThirdPartyRegisterBodyCopyWithImpl<$Res>
    implements $ThirdPartyRegisterBodyCopyWith<$Res> {
  _$ThirdPartyRegisterBodyCopyWithImpl(this._self, this._then);

  final ThirdPartyRegisterBody _self;
  final $Res Function(ThirdPartyRegisterBody) _then;

/// Create a copy of ThirdPartyRegisterBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? provider = null,Object? idToken = null,Object? accessToken = null,Object? nonce = null,Object? preferences = null,}) {
  return _then(_self.copyWith(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as ThirdPartyAuthProvider,idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as Option<String>,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as Option<String>,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,
  ));
}
/// Create a copy of ThirdPartyRegisterBody
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<$Res> get preferences {
  
  return $UserPreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}
}


/// Adds pattern-matching-related methods to [ThirdPartyRegisterBody].
extension ThirdPartyRegisterBodyPatterns on ThirdPartyRegisterBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThirdPartyRegisterBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThirdPartyRegisterBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThirdPartyRegisterBody value)  $default,){
final _that = this;
switch (_that) {
case _ThirdPartyRegisterBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThirdPartyRegisterBody value)?  $default,){
final _that = this;
switch (_that) {
case _ThirdPartyRegisterBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThirdPartyAuthProvider provider,  String idToken,  Option<String> accessToken,  Option<String> nonce,  UserPreferences preferences)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThirdPartyRegisterBody() when $default != null:
return $default(_that.provider,_that.idToken,_that.accessToken,_that.nonce,_that.preferences);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThirdPartyAuthProvider provider,  String idToken,  Option<String> accessToken,  Option<String> nonce,  UserPreferences preferences)  $default,) {final _that = this;
switch (_that) {
case _ThirdPartyRegisterBody():
return $default(_that.provider,_that.idToken,_that.accessToken,_that.nonce,_that.preferences);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThirdPartyAuthProvider provider,  String idToken,  Option<String> accessToken,  Option<String> nonce,  UserPreferences preferences)?  $default,) {final _that = this;
switch (_that) {
case _ThirdPartyRegisterBody() when $default != null:
return $default(_that.provider,_that.idToken,_that.accessToken,_that.nonce,_that.preferences);case _:
  return null;

}
}

}

/// @nodoc


class _ThirdPartyRegisterBody implements ThirdPartyRegisterBody {
  const _ThirdPartyRegisterBody({required this.provider, required this.idToken, required this.accessToken, required this.nonce, required this.preferences});
  

@override final  ThirdPartyAuthProvider provider;
@override final  String idToken;
@override final  Option<String> accessToken;
@override final  Option<String> nonce;
@override final  UserPreferences preferences;

/// Create a copy of ThirdPartyRegisterBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThirdPartyRegisterBodyCopyWith<_ThirdPartyRegisterBody> get copyWith => __$ThirdPartyRegisterBodyCopyWithImpl<_ThirdPartyRegisterBody>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThirdPartyRegisterBody&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.nonce, nonce) || other.nonce == nonce)&&(identical(other.preferences, preferences) || other.preferences == preferences));
}


@override
int get hashCode => Object.hash(runtimeType,provider,idToken,accessToken,nonce,preferences);

@override
String toString() {
  return 'ThirdPartyRegisterBody(provider: $provider, idToken: $idToken, accessToken: $accessToken, nonce: $nonce, preferences: $preferences)';
}


}

/// @nodoc
abstract mixin class _$ThirdPartyRegisterBodyCopyWith<$Res> implements $ThirdPartyRegisterBodyCopyWith<$Res> {
  factory _$ThirdPartyRegisterBodyCopyWith(_ThirdPartyRegisterBody value, $Res Function(_ThirdPartyRegisterBody) _then) = __$ThirdPartyRegisterBodyCopyWithImpl;
@override @useResult
$Res call({
 ThirdPartyAuthProvider provider, String idToken, Option<String> accessToken, Option<String> nonce, UserPreferences preferences
});


@override $UserPreferencesCopyWith<$Res> get preferences;

}
/// @nodoc
class __$ThirdPartyRegisterBodyCopyWithImpl<$Res>
    implements _$ThirdPartyRegisterBodyCopyWith<$Res> {
  __$ThirdPartyRegisterBodyCopyWithImpl(this._self, this._then);

  final _ThirdPartyRegisterBody _self;
  final $Res Function(_ThirdPartyRegisterBody) _then;

/// Create a copy of ThirdPartyRegisterBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? provider = null,Object? idToken = null,Object? accessToken = null,Object? nonce = null,Object? preferences = null,}) {
  return _then(_ThirdPartyRegisterBody(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as ThirdPartyAuthProvider,idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as Option<String>,nonce: null == nonce ? _self.nonce : nonce // ignore: cast_nullable_to_non_nullable
as Option<String>,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as UserPreferences,
  ));
}

/// Create a copy of ThirdPartyRegisterBody
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
