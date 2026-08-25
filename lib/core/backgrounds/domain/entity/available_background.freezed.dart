// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_background.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AvailableBackground {

 UniqueId get id; int get price; bool get isPremiumOnly; BackgroundCategory get category; AvailableBackgroundType get type; BackgroundAsset get asset; BackgroundStyle get style;
/// Create a copy of AvailableBackground
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableBackgroundCopyWith<AvailableBackground> get copyWith => _$AvailableBackgroundCopyWithImpl<AvailableBackground>(this as AvailableBackground, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableBackground&&(identical(other.id, id) || other.id == id)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPremiumOnly, isPremiumOnly) || other.isPremiumOnly == isPremiumOnly)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,id,price,isPremiumOnly,category,type,asset,style);

@override
String toString() {
  return 'AvailableBackground(id: $id, price: $price, isPremiumOnly: $isPremiumOnly, category: $category, type: $type, asset: $asset, style: $style)';
}


}

/// @nodoc
abstract mixin class $AvailableBackgroundCopyWith<$Res>  {
  factory $AvailableBackgroundCopyWith(AvailableBackground value, $Res Function(AvailableBackground) _then) = _$AvailableBackgroundCopyWithImpl;
@useResult
$Res call({
 UniqueId id, int price, bool isPremiumOnly, BackgroundCategory category, AvailableBackgroundType type, BackgroundAsset asset, BackgroundStyle style
});


$BackgroundCategoryCopyWith<$Res> get category;$BackgroundAssetCopyWith<$Res> get asset;$BackgroundStyleCopyWith<$Res> get style;

}
/// @nodoc
class _$AvailableBackgroundCopyWithImpl<$Res>
    implements $AvailableBackgroundCopyWith<$Res> {
  _$AvailableBackgroundCopyWithImpl(this._self, this._then);

  final AvailableBackground _self;
  final $Res Function(AvailableBackground) _then;

/// Create a copy of AvailableBackground
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? price = null,Object? isPremiumOnly = null,Object? category = null,Object? type = null,Object? asset = null,Object? style = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isPremiumOnly: null == isPremiumOnly ? _self.isPremiumOnly : isPremiumOnly // ignore: cast_nullable_to_non_nullable
as bool,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BackgroundCategory,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AvailableBackgroundType,asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as BackgroundAsset,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as BackgroundStyle,
  ));
}
/// Create a copy of AvailableBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundCategoryCopyWith<$Res> get category {
  
  return $BackgroundCategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of AvailableBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundAssetCopyWith<$Res> get asset {
  
  return $BackgroundAssetCopyWith<$Res>(_self.asset, (value) {
    return _then(_self.copyWith(asset: value));
  });
}/// Create a copy of AvailableBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundStyleCopyWith<$Res> get style {
  
  return $BackgroundStyleCopyWith<$Res>(_self.style, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}


/// Adds pattern-matching-related methods to [AvailableBackground].
extension AvailableBackgroundPatterns on AvailableBackground {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailableBackground value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailableBackground() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailableBackground value)  $default,){
final _that = this;
switch (_that) {
case _AvailableBackground():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailableBackground value)?  $default,){
final _that = this;
switch (_that) {
case _AvailableBackground() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UniqueId id,  int price,  bool isPremiumOnly,  BackgroundCategory category,  AvailableBackgroundType type,  BackgroundAsset asset,  BackgroundStyle style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailableBackground() when $default != null:
return $default(_that.id,_that.price,_that.isPremiumOnly,_that.category,_that.type,_that.asset,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UniqueId id,  int price,  bool isPremiumOnly,  BackgroundCategory category,  AvailableBackgroundType type,  BackgroundAsset asset,  BackgroundStyle style)  $default,) {final _that = this;
switch (_that) {
case _AvailableBackground():
return $default(_that.id,_that.price,_that.isPremiumOnly,_that.category,_that.type,_that.asset,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UniqueId id,  int price,  bool isPremiumOnly,  BackgroundCategory category,  AvailableBackgroundType type,  BackgroundAsset asset,  BackgroundStyle style)?  $default,) {final _that = this;
switch (_that) {
case _AvailableBackground() when $default != null:
return $default(_that.id,_that.price,_that.isPremiumOnly,_that.category,_that.type,_that.asset,_that.style);case _:
  return null;

}
}

}

/// @nodoc


class _AvailableBackground extends AvailableBackground {
  const _AvailableBackground({required this.id, required this.price, required this.isPremiumOnly, required this.category, required this.type, required this.asset, required this.style}): super._();
  

@override final  UniqueId id;
@override final  int price;
@override final  bool isPremiumOnly;
@override final  BackgroundCategory category;
@override final  AvailableBackgroundType type;
@override final  BackgroundAsset asset;
@override final  BackgroundStyle style;

/// Create a copy of AvailableBackground
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailableBackgroundCopyWith<_AvailableBackground> get copyWith => __$AvailableBackgroundCopyWithImpl<_AvailableBackground>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailableBackground&&(identical(other.id, id) || other.id == id)&&(identical(other.price, price) || other.price == price)&&(identical(other.isPremiumOnly, isPremiumOnly) || other.isPremiumOnly == isPremiumOnly)&&(identical(other.category, category) || other.category == category)&&(identical(other.type, type) || other.type == type)&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,id,price,isPremiumOnly,category,type,asset,style);

@override
String toString() {
  return 'AvailableBackground(id: $id, price: $price, isPremiumOnly: $isPremiumOnly, category: $category, type: $type, asset: $asset, style: $style)';
}


}

/// @nodoc
abstract mixin class _$AvailableBackgroundCopyWith<$Res> implements $AvailableBackgroundCopyWith<$Res> {
  factory _$AvailableBackgroundCopyWith(_AvailableBackground value, $Res Function(_AvailableBackground) _then) = __$AvailableBackgroundCopyWithImpl;
@override @useResult
$Res call({
 UniqueId id, int price, bool isPremiumOnly, BackgroundCategory category, AvailableBackgroundType type, BackgroundAsset asset, BackgroundStyle style
});


@override $BackgroundCategoryCopyWith<$Res> get category;@override $BackgroundAssetCopyWith<$Res> get asset;@override $BackgroundStyleCopyWith<$Res> get style;

}
/// @nodoc
class __$AvailableBackgroundCopyWithImpl<$Res>
    implements _$AvailableBackgroundCopyWith<$Res> {
  __$AvailableBackgroundCopyWithImpl(this._self, this._then);

  final _AvailableBackground _self;
  final $Res Function(_AvailableBackground) _then;

/// Create a copy of AvailableBackground
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? price = null,Object? isPremiumOnly = null,Object? category = null,Object? type = null,Object? asset = null,Object? style = null,}) {
  return _then(_AvailableBackground(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,isPremiumOnly: null == isPremiumOnly ? _self.isPremiumOnly : isPremiumOnly // ignore: cast_nullable_to_non_nullable
as bool,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BackgroundCategory,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AvailableBackgroundType,asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as BackgroundAsset,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as BackgroundStyle,
  ));
}

/// Create a copy of AvailableBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundCategoryCopyWith<$Res> get category {
  
  return $BackgroundCategoryCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of AvailableBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundAssetCopyWith<$Res> get asset {
  
  return $BackgroundAssetCopyWith<$Res>(_self.asset, (value) {
    return _then(_self.copyWith(asset: value));
  });
}/// Create a copy of AvailableBackground
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
