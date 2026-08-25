// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resolved_background_asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResolvedBackgroundAsset {

 ActiveBackground get background; File get visualFile; Option<File> get audioFile;
/// Create a copy of ResolvedBackgroundAsset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResolvedBackgroundAssetCopyWith<ResolvedBackgroundAsset> get copyWith => _$ResolvedBackgroundAssetCopyWithImpl<ResolvedBackgroundAsset>(this as ResolvedBackgroundAsset, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResolvedBackgroundAsset&&(identical(other.background, background) || other.background == background)&&(identical(other.visualFile, visualFile) || other.visualFile == visualFile)&&(identical(other.audioFile, audioFile) || other.audioFile == audioFile));
}


@override
int get hashCode => Object.hash(runtimeType,background,visualFile,audioFile);

@override
String toString() {
  return 'ResolvedBackgroundAsset(background: $background, visualFile: $visualFile, audioFile: $audioFile)';
}


}

/// @nodoc
abstract mixin class $ResolvedBackgroundAssetCopyWith<$Res>  {
  factory $ResolvedBackgroundAssetCopyWith(ResolvedBackgroundAsset value, $Res Function(ResolvedBackgroundAsset) _then) = _$ResolvedBackgroundAssetCopyWithImpl;
@useResult
$Res call({
 ActiveBackground background, File visualFile, Option<File> audioFile
});


$ActiveBackgroundCopyWith<$Res> get background;

}
/// @nodoc
class _$ResolvedBackgroundAssetCopyWithImpl<$Res>
    implements $ResolvedBackgroundAssetCopyWith<$Res> {
  _$ResolvedBackgroundAssetCopyWithImpl(this._self, this._then);

  final ResolvedBackgroundAsset _self;
  final $Res Function(ResolvedBackgroundAsset) _then;

/// Create a copy of ResolvedBackgroundAsset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? background = null,Object? visualFile = null,Object? audioFile = null,}) {
  return _then(_self.copyWith(
background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as ActiveBackground,visualFile: null == visualFile ? _self.visualFile : visualFile // ignore: cast_nullable_to_non_nullable
as File,audioFile: null == audioFile ? _self.audioFile : audioFile // ignore: cast_nullable_to_non_nullable
as Option<File>,
  ));
}
/// Create a copy of ResolvedBackgroundAsset
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActiveBackgroundCopyWith<$Res> get background {
  
  return $ActiveBackgroundCopyWith<$Res>(_self.background, (value) {
    return _then(_self.copyWith(background: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResolvedBackgroundAsset].
extension ResolvedBackgroundAssetPatterns on ResolvedBackgroundAsset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResolvedBackgroundAsset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResolvedBackgroundAsset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResolvedBackgroundAsset value)  $default,){
final _that = this;
switch (_that) {
case _ResolvedBackgroundAsset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResolvedBackgroundAsset value)?  $default,){
final _that = this;
switch (_that) {
case _ResolvedBackgroundAsset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActiveBackground background,  File visualFile,  Option<File> audioFile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResolvedBackgroundAsset() when $default != null:
return $default(_that.background,_that.visualFile,_that.audioFile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActiveBackground background,  File visualFile,  Option<File> audioFile)  $default,) {final _that = this;
switch (_that) {
case _ResolvedBackgroundAsset():
return $default(_that.background,_that.visualFile,_that.audioFile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActiveBackground background,  File visualFile,  Option<File> audioFile)?  $default,) {final _that = this;
switch (_that) {
case _ResolvedBackgroundAsset() when $default != null:
return $default(_that.background,_that.visualFile,_that.audioFile);case _:
  return null;

}
}

}

/// @nodoc


class _ResolvedBackgroundAsset implements ResolvedBackgroundAsset {
  const _ResolvedBackgroundAsset({required this.background, required this.visualFile, required this.audioFile});
  

@override final  ActiveBackground background;
@override final  File visualFile;
@override final  Option<File> audioFile;

/// Create a copy of ResolvedBackgroundAsset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResolvedBackgroundAssetCopyWith<_ResolvedBackgroundAsset> get copyWith => __$ResolvedBackgroundAssetCopyWithImpl<_ResolvedBackgroundAsset>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResolvedBackgroundAsset&&(identical(other.background, background) || other.background == background)&&(identical(other.visualFile, visualFile) || other.visualFile == visualFile)&&(identical(other.audioFile, audioFile) || other.audioFile == audioFile));
}


@override
int get hashCode => Object.hash(runtimeType,background,visualFile,audioFile);

@override
String toString() {
  return 'ResolvedBackgroundAsset(background: $background, visualFile: $visualFile, audioFile: $audioFile)';
}


}

/// @nodoc
abstract mixin class _$ResolvedBackgroundAssetCopyWith<$Res> implements $ResolvedBackgroundAssetCopyWith<$Res> {
  factory _$ResolvedBackgroundAssetCopyWith(_ResolvedBackgroundAsset value, $Res Function(_ResolvedBackgroundAsset) _then) = __$ResolvedBackgroundAssetCopyWithImpl;
@override @useResult
$Res call({
 ActiveBackground background, File visualFile, Option<File> audioFile
});


@override $ActiveBackgroundCopyWith<$Res> get background;

}
/// @nodoc
class __$ResolvedBackgroundAssetCopyWithImpl<$Res>
    implements _$ResolvedBackgroundAssetCopyWith<$Res> {
  __$ResolvedBackgroundAssetCopyWithImpl(this._self, this._then);

  final _ResolvedBackgroundAsset _self;
  final $Res Function(_ResolvedBackgroundAsset) _then;

/// Create a copy of ResolvedBackgroundAsset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? background = null,Object? visualFile = null,Object? audioFile = null,}) {
  return _then(_ResolvedBackgroundAsset(
background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as ActiveBackground,visualFile: null == visualFile ? _self.visualFile : visualFile // ignore: cast_nullable_to_non_nullable
as File,audioFile: null == audioFile ? _self.audioFile : audioFile // ignore: cast_nullable_to_non_nullable
as Option<File>,
  ));
}

/// Create a copy of ResolvedBackgroundAsset
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActiveBackgroundCopyWith<$Res> get background {
  
  return $ActiveBackgroundCopyWith<$Res>(_self.background, (value) {
    return _then(_self.copyWith(background: value));
  });
}
}

// dart format on
