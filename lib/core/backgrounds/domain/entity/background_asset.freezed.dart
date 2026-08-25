// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackgroundAsset {

 String get path; AvailableBackgroundType get type; int get version; bool get hasSound; NetworkLink get link; Option<NetworkLink> get audioLink;
/// Create a copy of BackgroundAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundAssetCopyWith<BackgroundAsset> get copyWith => _$BackgroundAssetCopyWithImpl<BackgroundAsset>(this as BackgroundAsset, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundAsset&&(identical(other.path, path) || other.path == path)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.hasSound, hasSound) || other.hasSound == hasSound)&&(identical(other.link, link) || other.link == link)&&(identical(other.audioLink, audioLink) || other.audioLink == audioLink));
}


@override
int get hashCode => Object.hash(runtimeType,path,type,version,hasSound,link,audioLink);

@override
String toString() {
  return 'BackgroundAsset(path: $path, type: $type, version: $version, hasSound: $hasSound, link: $link, audioLink: $audioLink)';
}


}

/// @nodoc
abstract mixin class $BackgroundAssetCopyWith<$Res>  {
  factory $BackgroundAssetCopyWith(BackgroundAsset value, $Res Function(BackgroundAsset) _then) = _$BackgroundAssetCopyWithImpl;
@useResult
$Res call({
 String path, AvailableBackgroundType type, int version, bool hasSound, NetworkLink link, Option<NetworkLink> audioLink
});




}
/// @nodoc
class _$BackgroundAssetCopyWithImpl<$Res>
    implements $BackgroundAssetCopyWith<$Res> {
  _$BackgroundAssetCopyWithImpl(this._self, this._then);

  final BackgroundAsset _self;
  final $Res Function(BackgroundAsset) _then;

/// Create a copy of BackgroundAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? type = null,Object? version = null,Object? hasSound = null,Object? link = null,Object? audioLink = null,}) {
  return _then(_self.copyWith(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AvailableBackgroundType,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,hasSound: null == hasSound ? _self.hasSound : hasSound // ignore: cast_nullable_to_non_nullable
as bool,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as NetworkLink,audioLink: null == audioLink ? _self.audioLink : audioLink // ignore: cast_nullable_to_non_nullable
as Option<NetworkLink>,
  ));
}

}


/// Adds pattern-matching-related methods to [BackgroundAsset].
extension BackgroundAssetPatterns on BackgroundAsset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackgroundAsset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackgroundAsset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackgroundAsset value)  $default,){
final _that = this;
switch (_that) {
case _BackgroundAsset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackgroundAsset value)?  $default,){
final _that = this;
switch (_that) {
case _BackgroundAsset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  AvailableBackgroundType type,  int version,  bool hasSound,  NetworkLink link,  Option<NetworkLink> audioLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackgroundAsset() when $default != null:
return $default(_that.path,_that.type,_that.version,_that.hasSound,_that.link,_that.audioLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  AvailableBackgroundType type,  int version,  bool hasSound,  NetworkLink link,  Option<NetworkLink> audioLink)  $default,) {final _that = this;
switch (_that) {
case _BackgroundAsset():
return $default(_that.path,_that.type,_that.version,_that.hasSound,_that.link,_that.audioLink);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  AvailableBackgroundType type,  int version,  bool hasSound,  NetworkLink link,  Option<NetworkLink> audioLink)?  $default,) {final _that = this;
switch (_that) {
case _BackgroundAsset() when $default != null:
return $default(_that.path,_that.type,_that.version,_that.hasSound,_that.link,_that.audioLink);case _:
  return null;

}
}

}

/// @nodoc


class _BackgroundAsset implements BackgroundAsset {
  const _BackgroundAsset({required this.path, required this.type, required this.version, required this.hasSound, required this.link, required this.audioLink});
  

@override final  String path;
@override final  AvailableBackgroundType type;
@override final  int version;
@override final  bool hasSound;
@override final  NetworkLink link;
@override final  Option<NetworkLink> audioLink;

/// Create a copy of BackgroundAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundAssetCopyWith<_BackgroundAsset> get copyWith => __$BackgroundAssetCopyWithImpl<_BackgroundAsset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackgroundAsset&&(identical(other.path, path) || other.path == path)&&(identical(other.type, type) || other.type == type)&&(identical(other.version, version) || other.version == version)&&(identical(other.hasSound, hasSound) || other.hasSound == hasSound)&&(identical(other.link, link) || other.link == link)&&(identical(other.audioLink, audioLink) || other.audioLink == audioLink));
}


@override
int get hashCode => Object.hash(runtimeType,path,type,version,hasSound,link,audioLink);

@override
String toString() {
  return 'BackgroundAsset(path: $path, type: $type, version: $version, hasSound: $hasSound, link: $link, audioLink: $audioLink)';
}


}

/// @nodoc
abstract mixin class _$BackgroundAssetCopyWith<$Res> implements $BackgroundAssetCopyWith<$Res> {
  factory _$BackgroundAssetCopyWith(_BackgroundAsset value, $Res Function(_BackgroundAsset) _then) = __$BackgroundAssetCopyWithImpl;
@override @useResult
$Res call({
 String path, AvailableBackgroundType type, int version, bool hasSound, NetworkLink link, Option<NetworkLink> audioLink
});




}
/// @nodoc
class __$BackgroundAssetCopyWithImpl<$Res>
    implements _$BackgroundAssetCopyWith<$Res> {
  __$BackgroundAssetCopyWithImpl(this._self, this._then);

  final _BackgroundAsset _self;
  final $Res Function(_BackgroundAsset) _then;

/// Create a copy of BackgroundAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? type = null,Object? version = null,Object? hasSound = null,Object? link = null,Object? audioLink = null,}) {
  return _then(_BackgroundAsset(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AvailableBackgroundType,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,hasSound: null == hasSound ? _self.hasSound : hasSound // ignore: cast_nullable_to_non_nullable
as bool,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as NetworkLink,audioLink: null == audioLink ? _self.audioLink : audioLink // ignore: cast_nullable_to_non_nullable
as Option<NetworkLink>,
  ));
}


}

// dart format on
