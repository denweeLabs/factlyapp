// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Profile {

 UniqueId get id; Option<Email> get email; Option<Username> get name; Option<NetworkLink> get avatarUrl; Option<DateTime> get createdAt; bool get isAnonymous; Set<UniqueId> get unlockedBackgrounds; AppSupportedAuthProvider get authProvider;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isAnonymous, isAnonymous) || other.isAnonymous == isAnonymous)&&const DeepCollectionEquality().equals(other.unlockedBackgrounds, unlockedBackgrounds)&&(identical(other.authProvider, authProvider) || other.authProvider == authProvider));
}


@override
int get hashCode => Object.hash(runtimeType,id,email,name,avatarUrl,createdAt,isAnonymous,const DeepCollectionEquality().hash(unlockedBackgrounds),authProvider);

@override
String toString() {
  return 'Profile(id: $id, email: $email, name: $name, avatarUrl: $avatarUrl, createdAt: $createdAt, isAnonymous: $isAnonymous, unlockedBackgrounds: $unlockedBackgrounds, authProvider: $authProvider)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 UniqueId id, Option<Email> email, Option<Username> name, Option<NetworkLink> avatarUrl, Option<DateTime> createdAt, bool isAnonymous, Set<UniqueId> unlockedBackgrounds, AppSupportedAuthProvider authProvider
});




}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? name = null,Object? avatarUrl = null,Object? createdAt = null,Object? isAnonymous = null,Object? unlockedBackgrounds = null,Object? authProvider = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Option<Email>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Option<Username>,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as Option<NetworkLink>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,isAnonymous: null == isAnonymous ? _self.isAnonymous : isAnonymous // ignore: cast_nullable_to_non_nullable
as bool,unlockedBackgrounds: null == unlockedBackgrounds ? _self.unlockedBackgrounds : unlockedBackgrounds // ignore: cast_nullable_to_non_nullable
as Set<UniqueId>,authProvider: null == authProvider ? _self.authProvider : authProvider // ignore: cast_nullable_to_non_nullable
as AppSupportedAuthProvider,
  ));
}

}


/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,){
final _that = this;
switch (_that) {
case _Profile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UniqueId id,  Option<Email> email,  Option<Username> name,  Option<NetworkLink> avatarUrl,  Option<DateTime> createdAt,  bool isAnonymous,  Set<UniqueId> unlockedBackgrounds,  AppSupportedAuthProvider authProvider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.avatarUrl,_that.createdAt,_that.isAnonymous,_that.unlockedBackgrounds,_that.authProvider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UniqueId id,  Option<Email> email,  Option<Username> name,  Option<NetworkLink> avatarUrl,  Option<DateTime> createdAt,  bool isAnonymous,  Set<UniqueId> unlockedBackgrounds,  AppSupportedAuthProvider authProvider)  $default,) {final _that = this;
switch (_that) {
case _Profile():
return $default(_that.id,_that.email,_that.name,_that.avatarUrl,_that.createdAt,_that.isAnonymous,_that.unlockedBackgrounds,_that.authProvider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UniqueId id,  Option<Email> email,  Option<Username> name,  Option<NetworkLink> avatarUrl,  Option<DateTime> createdAt,  bool isAnonymous,  Set<UniqueId> unlockedBackgrounds,  AppSupportedAuthProvider authProvider)?  $default,) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.avatarUrl,_that.createdAt,_that.isAnonymous,_that.unlockedBackgrounds,_that.authProvider);case _:
  return null;

}
}

}

/// @nodoc


class _Profile extends Profile {
  const _Profile({required this.id, required this.email, required this.name, required this.avatarUrl, required this.createdAt, required this.isAnonymous, required final  Set<UniqueId> unlockedBackgrounds, required this.authProvider}): _unlockedBackgrounds = unlockedBackgrounds,super._();
  

@override final  UniqueId id;
@override final  Option<Email> email;
@override final  Option<Username> name;
@override final  Option<NetworkLink> avatarUrl;
@override final  Option<DateTime> createdAt;
@override final  bool isAnonymous;
 final  Set<UniqueId> _unlockedBackgrounds;
@override Set<UniqueId> get unlockedBackgrounds {
  if (_unlockedBackgrounds is EqualUnmodifiableSetView) return _unlockedBackgrounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_unlockedBackgrounds);
}

@override final  AppSupportedAuthProvider authProvider;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isAnonymous, isAnonymous) || other.isAnonymous == isAnonymous)&&const DeepCollectionEquality().equals(other._unlockedBackgrounds, _unlockedBackgrounds)&&(identical(other.authProvider, authProvider) || other.authProvider == authProvider));
}


@override
int get hashCode => Object.hash(runtimeType,id,email,name,avatarUrl,createdAt,isAnonymous,const DeepCollectionEquality().hash(_unlockedBackgrounds),authProvider);

@override
String toString() {
  return 'Profile(id: $id, email: $email, name: $name, avatarUrl: $avatarUrl, createdAt: $createdAt, isAnonymous: $isAnonymous, unlockedBackgrounds: $unlockedBackgrounds, authProvider: $authProvider)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
 UniqueId id, Option<Email> email, Option<Username> name, Option<NetworkLink> avatarUrl, Option<DateTime> createdAt, bool isAnonymous, Set<UniqueId> unlockedBackgrounds, AppSupportedAuthProvider authProvider
});




}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? name = null,Object? avatarUrl = null,Object? createdAt = null,Object? isAnonymous = null,Object? unlockedBackgrounds = null,Object? authProvider = null,}) {
  return _then(_Profile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Option<Email>,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Option<Username>,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as Option<NetworkLink>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,isAnonymous: null == isAnonymous ? _self.isAnonymous : isAnonymous // ignore: cast_nullable_to_non_nullable
as bool,unlockedBackgrounds: null == unlockedBackgrounds ? _self._unlockedBackgrounds : unlockedBackgrounds // ignore: cast_nullable_to_non_nullable
as Set<UniqueId>,authProvider: null == authProvider ? _self.authProvider : authProvider // ignore: cast_nullable_to_non_nullable
as AppSupportedAuthProvider,
  ));
}


}

// dart format on
