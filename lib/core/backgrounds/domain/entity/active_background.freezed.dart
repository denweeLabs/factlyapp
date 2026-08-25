// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_background.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveBackground {

 UniqueId get id; BackgroundAsset get asset; BackgroundStyle get style;
/// Create a copy of ActiveBackground
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveBackgroundCopyWith<ActiveBackground> get copyWith => _$ActiveBackgroundCopyWithImpl<ActiveBackground>(this as ActiveBackground, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveBackground&&(identical(other.id, id) || other.id == id)&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,id,asset,style);

@override
String toString() {
  return 'ActiveBackground(id: $id, asset: $asset, style: $style)';
}


}

/// @nodoc
abstract mixin class $ActiveBackgroundCopyWith<$Res>  {
  factory $ActiveBackgroundCopyWith(ActiveBackground value, $Res Function(ActiveBackground) _then) = _$ActiveBackgroundCopyWithImpl;
@useResult
$Res call({
 UniqueId id, BackgroundAsset asset, BackgroundStyle style
});


$BackgroundAssetCopyWith<$Res> get asset;$BackgroundStyleCopyWith<$Res> get style;

}
/// @nodoc
class _$ActiveBackgroundCopyWithImpl<$Res>
    implements $ActiveBackgroundCopyWith<$Res> {
  _$ActiveBackgroundCopyWithImpl(this._self, this._then);

  final ActiveBackground _self;
  final $Res Function(ActiveBackground) _then;

/// Create a copy of ActiveBackground
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? asset = null,Object? style = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as BackgroundAsset,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as BackgroundStyle,
  ));
}
/// Create a copy of ActiveBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundAssetCopyWith<$Res> get asset {
  
  return $BackgroundAssetCopyWith<$Res>(_self.asset, (value) {
    return _then(_self.copyWith(asset: value));
  });
}/// Create a copy of ActiveBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundStyleCopyWith<$Res> get style {
  
  return $BackgroundStyleCopyWith<$Res>(_self.style, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActiveBackground].
extension ActiveBackgroundPatterns on ActiveBackground {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveBackground value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveBackground() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveBackground value)  $default,){
final _that = this;
switch (_that) {
case _ActiveBackground():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveBackground value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveBackground() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UniqueId id,  BackgroundAsset asset,  BackgroundStyle style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveBackground() when $default != null:
return $default(_that.id,_that.asset,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UniqueId id,  BackgroundAsset asset,  BackgroundStyle style)  $default,) {final _that = this;
switch (_that) {
case _ActiveBackground():
return $default(_that.id,_that.asset,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UniqueId id,  BackgroundAsset asset,  BackgroundStyle style)?  $default,) {final _that = this;
switch (_that) {
case _ActiveBackground() when $default != null:
return $default(_that.id,_that.asset,_that.style);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveBackground implements ActiveBackground {
  const _ActiveBackground({required this.id, required this.asset, required this.style});
  

@override final  UniqueId id;
@override final  BackgroundAsset asset;
@override final  BackgroundStyle style;

/// Create a copy of ActiveBackground
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveBackgroundCopyWith<_ActiveBackground> get copyWith => __$ActiveBackgroundCopyWithImpl<_ActiveBackground>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveBackground&&(identical(other.id, id) || other.id == id)&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,id,asset,style);

@override
String toString() {
  return 'ActiveBackground(id: $id, asset: $asset, style: $style)';
}


}

/// @nodoc
abstract mixin class _$ActiveBackgroundCopyWith<$Res> implements $ActiveBackgroundCopyWith<$Res> {
  factory _$ActiveBackgroundCopyWith(_ActiveBackground value, $Res Function(_ActiveBackground) _then) = __$ActiveBackgroundCopyWithImpl;
@override @useResult
$Res call({
 UniqueId id, BackgroundAsset asset, BackgroundStyle style
});


@override $BackgroundAssetCopyWith<$Res> get asset;@override $BackgroundStyleCopyWith<$Res> get style;

}
/// @nodoc
class __$ActiveBackgroundCopyWithImpl<$Res>
    implements _$ActiveBackgroundCopyWith<$Res> {
  __$ActiveBackgroundCopyWithImpl(this._self, this._then);

  final _ActiveBackground _self;
  final $Res Function(_ActiveBackground) _then;

/// Create a copy of ActiveBackground
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? asset = null,Object? style = null,}) {
  return _then(_ActiveBackground(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as BackgroundAsset,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as BackgroundStyle,
  ));
}

/// Create a copy of ActiveBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundAssetCopyWith<$Res> get asset {
  
  return $BackgroundAssetCopyWith<$Res>(_self.asset, (value) {
    return _then(_self.copyWith(asset: value));
  });
}/// Create a copy of ActiveBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundStyleCopyWith<$Res> get style {
  
  return $BackgroundStyleCopyWith<$Res>(_self.style, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}

// dart format on
