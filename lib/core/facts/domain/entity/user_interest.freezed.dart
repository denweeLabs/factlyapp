// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_interest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserInterest {

 UniqueId get id; String get englishName;
/// Create a copy of UserInterest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInterestCopyWith<UserInterest> get copyWith => _$UserInterestCopyWithImpl<UserInterest>(this as UserInterest, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInterest&&(identical(other.id, id) || other.id == id)&&(identical(other.englishName, englishName) || other.englishName == englishName));
}


@override
int get hashCode => Object.hash(runtimeType,id,englishName);

@override
String toString() {
  return 'UserInterest(id: $id, englishName: $englishName)';
}


}

/// @nodoc
abstract mixin class $UserInterestCopyWith<$Res>  {
  factory $UserInterestCopyWith(UserInterest value, $Res Function(UserInterest) _then) = _$UserInterestCopyWithImpl;
@useResult
$Res call({
 UniqueId id, String englishName
});




}
/// @nodoc
class _$UserInterestCopyWithImpl<$Res>
    implements $UserInterestCopyWith<$Res> {
  _$UserInterestCopyWithImpl(this._self, this._then);

  final UserInterest _self;
  final $Res Function(UserInterest) _then;

/// Create a copy of UserInterest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? englishName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInterest].
extension UserInterestPatterns on UserInterest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInterest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInterest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInterest value)  $default,){
final _that = this;
switch (_that) {
case _UserInterest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInterest value)?  $default,){
final _that = this;
switch (_that) {
case _UserInterest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UniqueId id,  String englishName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInterest() when $default != null:
return $default(_that.id,_that.englishName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UniqueId id,  String englishName)  $default,) {final _that = this;
switch (_that) {
case _UserInterest():
return $default(_that.id,_that.englishName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UniqueId id,  String englishName)?  $default,) {final _that = this;
switch (_that) {
case _UserInterest() when $default != null:
return $default(_that.id,_that.englishName);case _:
  return null;

}
}

}

/// @nodoc


class _UserInterest extends UserInterest {
  const _UserInterest({required this.id, required this.englishName}): super._();
  

@override final  UniqueId id;
@override final  String englishName;

/// Create a copy of UserInterest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInterestCopyWith<_UserInterest> get copyWith => __$UserInterestCopyWithImpl<_UserInterest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInterest&&(identical(other.id, id) || other.id == id)&&(identical(other.englishName, englishName) || other.englishName == englishName));
}


@override
int get hashCode => Object.hash(runtimeType,id,englishName);

@override
String toString() {
  return 'UserInterest(id: $id, englishName: $englishName)';
}


}

/// @nodoc
abstract mixin class _$UserInterestCopyWith<$Res> implements $UserInterestCopyWith<$Res> {
  factory _$UserInterestCopyWith(_UserInterest value, $Res Function(_UserInterest) _then) = __$UserInterestCopyWithImpl;
@override @useResult
$Res call({
 UniqueId id, String englishName
});




}
/// @nodoc
class __$UserInterestCopyWithImpl<$Res>
    implements _$UserInterestCopyWith<$Res> {
  __$UserInterestCopyWithImpl(this._self, this._then);

  final _UserInterest _self;
  final $Res Function(_UserInterest) _then;

/// Create a copy of UserInterest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? englishName = null,}) {
  return _then(_UserInterest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
