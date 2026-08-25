// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackgroundStyle {

 String get textFont; int get textSize; Color get textColor; double get backgroundFade; Color get backgroundFadeColor;
/// Create a copy of BackgroundStyle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundStyleCopyWith<BackgroundStyle> get copyWith => _$BackgroundStyleCopyWithImpl<BackgroundStyle>(this as BackgroundStyle, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundStyle&&(identical(other.textFont, textFont) || other.textFont == textFont)&&(identical(other.textSize, textSize) || other.textSize == textSize)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.backgroundFade, backgroundFade) || other.backgroundFade == backgroundFade)&&(identical(other.backgroundFadeColor, backgroundFadeColor) || other.backgroundFadeColor == backgroundFadeColor));
}


@override
int get hashCode => Object.hash(runtimeType,textFont,textSize,textColor,backgroundFade,backgroundFadeColor);

@override
String toString() {
  return 'BackgroundStyle(textFont: $textFont, textSize: $textSize, textColor: $textColor, backgroundFade: $backgroundFade, backgroundFadeColor: $backgroundFadeColor)';
}


}

/// @nodoc
abstract mixin class $BackgroundStyleCopyWith<$Res>  {
  factory $BackgroundStyleCopyWith(BackgroundStyle value, $Res Function(BackgroundStyle) _then) = _$BackgroundStyleCopyWithImpl;
@useResult
$Res call({
 String textFont, int textSize, Color textColor, double backgroundFade, Color backgroundFadeColor
});




}
/// @nodoc
class _$BackgroundStyleCopyWithImpl<$Res>
    implements $BackgroundStyleCopyWith<$Res> {
  _$BackgroundStyleCopyWithImpl(this._self, this._then);

  final BackgroundStyle _self;
  final $Res Function(BackgroundStyle) _then;

/// Create a copy of BackgroundStyle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? textFont = null,Object? textSize = null,Object? textColor = null,Object? backgroundFade = null,Object? backgroundFadeColor = null,}) {
  return _then(_self.copyWith(
textFont: null == textFont ? _self.textFont : textFont // ignore: cast_nullable_to_non_nullable
as String,textSize: null == textSize ? _self.textSize : textSize // ignore: cast_nullable_to_non_nullable
as int,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as Color,backgroundFade: null == backgroundFade ? _self.backgroundFade : backgroundFade // ignore: cast_nullable_to_non_nullable
as double,backgroundFadeColor: null == backgroundFadeColor ? _self.backgroundFadeColor : backgroundFadeColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [BackgroundStyle].
extension BackgroundStylePatterns on BackgroundStyle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackgroundCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackgroundCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackgroundCategory value)  $default,){
final _that = this;
switch (_that) {
case _BackgroundCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackgroundCategory value)?  $default,){
final _that = this;
switch (_that) {
case _BackgroundCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String textFont,  int textSize,  Color textColor,  double backgroundFade,  Color backgroundFadeColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackgroundCategory() when $default != null:
return $default(_that.textFont,_that.textSize,_that.textColor,_that.backgroundFade,_that.backgroundFadeColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String textFont,  int textSize,  Color textColor,  double backgroundFade,  Color backgroundFadeColor)  $default,) {final _that = this;
switch (_that) {
case _BackgroundCategory():
return $default(_that.textFont,_that.textSize,_that.textColor,_that.backgroundFade,_that.backgroundFadeColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String textFont,  int textSize,  Color textColor,  double backgroundFade,  Color backgroundFadeColor)?  $default,) {final _that = this;
switch (_that) {
case _BackgroundCategory() when $default != null:
return $default(_that.textFont,_that.textSize,_that.textColor,_that.backgroundFade,_that.backgroundFadeColor);case _:
  return null;

}
}

}

/// @nodoc


class _BackgroundCategory extends BackgroundStyle {
  const _BackgroundCategory({required this.textFont, required this.textSize, required this.textColor, required this.backgroundFade, required this.backgroundFadeColor}): super._();
  

@override final  String textFont;
@override final  int textSize;
@override final  Color textColor;
@override final  double backgroundFade;
@override final  Color backgroundFadeColor;

/// Create a copy of BackgroundStyle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundCategoryCopyWith<_BackgroundCategory> get copyWith => __$BackgroundCategoryCopyWithImpl<_BackgroundCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackgroundCategory&&(identical(other.textFont, textFont) || other.textFont == textFont)&&(identical(other.textSize, textSize) || other.textSize == textSize)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.backgroundFade, backgroundFade) || other.backgroundFade == backgroundFade)&&(identical(other.backgroundFadeColor, backgroundFadeColor) || other.backgroundFadeColor == backgroundFadeColor));
}


@override
int get hashCode => Object.hash(runtimeType,textFont,textSize,textColor,backgroundFade,backgroundFadeColor);

@override
String toString() {
  return 'BackgroundStyle(textFont: $textFont, textSize: $textSize, textColor: $textColor, backgroundFade: $backgroundFade, backgroundFadeColor: $backgroundFadeColor)';
}


}

/// @nodoc
abstract mixin class _$BackgroundCategoryCopyWith<$Res> implements $BackgroundStyleCopyWith<$Res> {
  factory _$BackgroundCategoryCopyWith(_BackgroundCategory value, $Res Function(_BackgroundCategory) _then) = __$BackgroundCategoryCopyWithImpl;
@override @useResult
$Res call({
 String textFont, int textSize, Color textColor, double backgroundFade, Color backgroundFadeColor
});




}
/// @nodoc
class __$BackgroundCategoryCopyWithImpl<$Res>
    implements _$BackgroundCategoryCopyWith<$Res> {
  __$BackgroundCategoryCopyWithImpl(this._self, this._then);

  final _BackgroundCategory _self;
  final $Res Function(_BackgroundCategory) _then;

/// Create a copy of BackgroundStyle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? textFont = null,Object? textSize = null,Object? textColor = null,Object? backgroundFade = null,Object? backgroundFadeColor = null,}) {
  return _then(_BackgroundCategory(
textFont: null == textFont ? _self.textFont : textFont // ignore: cast_nullable_to_non_nullable
as String,textSize: null == textSize ? _self.textSize : textSize // ignore: cast_nullable_to_non_nullable
as int,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as Color,backgroundFade: null == backgroundFade ? _self.backgroundFade : backgroundFade // ignore: cast_nullable_to_non_nullable
as double,backgroundFadeColor: null == backgroundFadeColor ? _self.backgroundFadeColor : backgroundFadeColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
