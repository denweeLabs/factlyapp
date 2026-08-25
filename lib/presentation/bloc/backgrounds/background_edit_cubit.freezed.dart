// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_edit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackgroundEditState {

 String get textFont; int get textSize; Color get textColor; double get backgroundFade; Color get backgroundFadeColor; BackgroundEditMode get mode; bool get hasChanges; bool get showPurchaseAnimation;
/// Create a copy of BackgroundEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BackgroundEditStateCopyWith<BackgroundEditState> get copyWith => _$BackgroundEditStateCopyWithImpl<BackgroundEditState>(this as BackgroundEditState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundEditState&&(identical(other.textFont, textFont) || other.textFont == textFont)&&(identical(other.textSize, textSize) || other.textSize == textSize)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.backgroundFade, backgroundFade) || other.backgroundFade == backgroundFade)&&(identical(other.backgroundFadeColor, backgroundFadeColor) || other.backgroundFadeColor == backgroundFadeColor)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.hasChanges, hasChanges) || other.hasChanges == hasChanges)&&(identical(other.showPurchaseAnimation, showPurchaseAnimation) || other.showPurchaseAnimation == showPurchaseAnimation));
}


@override
int get hashCode => Object.hash(runtimeType,textFont,textSize,textColor,backgroundFade,backgroundFadeColor,mode,hasChanges,showPurchaseAnimation);

@override
String toString() {
  return 'BackgroundEditState(textFont: $textFont, textSize: $textSize, textColor: $textColor, backgroundFade: $backgroundFade, backgroundFadeColor: $backgroundFadeColor, mode: $mode, hasChanges: $hasChanges, showPurchaseAnimation: $showPurchaseAnimation)';
}


}

/// @nodoc
abstract mixin class $BackgroundEditStateCopyWith<$Res>  {
  factory $BackgroundEditStateCopyWith(BackgroundEditState value, $Res Function(BackgroundEditState) _then) = _$BackgroundEditStateCopyWithImpl;
@useResult
$Res call({
 String textFont, int textSize, Color textColor, double backgroundFade, Color backgroundFadeColor, BackgroundEditMode mode, bool hasChanges, bool showPurchaseAnimation
});




}
/// @nodoc
class _$BackgroundEditStateCopyWithImpl<$Res>
    implements $BackgroundEditStateCopyWith<$Res> {
  _$BackgroundEditStateCopyWithImpl(this._self, this._then);

  final BackgroundEditState _self;
  final $Res Function(BackgroundEditState) _then;

/// Create a copy of BackgroundEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? textFont = null,Object? textSize = null,Object? textColor = null,Object? backgroundFade = null,Object? backgroundFadeColor = null,Object? mode = null,Object? hasChanges = null,Object? showPurchaseAnimation = null,}) {
  return _then(_self.copyWith(
textFont: null == textFont ? _self.textFont : textFont // ignore: cast_nullable_to_non_nullable
as String,textSize: null == textSize ? _self.textSize : textSize // ignore: cast_nullable_to_non_nullable
as int,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as Color,backgroundFade: null == backgroundFade ? _self.backgroundFade : backgroundFade // ignore: cast_nullable_to_non_nullable
as double,backgroundFadeColor: null == backgroundFadeColor ? _self.backgroundFadeColor : backgroundFadeColor // ignore: cast_nullable_to_non_nullable
as Color,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as BackgroundEditMode,hasChanges: null == hasChanges ? _self.hasChanges : hasChanges // ignore: cast_nullable_to_non_nullable
as bool,showPurchaseAnimation: null == showPurchaseAnimation ? _self.showPurchaseAnimation : showPurchaseAnimation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BackgroundEditState].
extension BackgroundEditStatePatterns on BackgroundEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BackgroundEditState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BackgroundEditState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BackgroundEditState value)  $default,){
final _that = this;
switch (_that) {
case _BackgroundEditState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BackgroundEditState value)?  $default,){
final _that = this;
switch (_that) {
case _BackgroundEditState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String textFont,  int textSize,  Color textColor,  double backgroundFade,  Color backgroundFadeColor,  BackgroundEditMode mode,  bool hasChanges,  bool showPurchaseAnimation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BackgroundEditState() when $default != null:
return $default(_that.textFont,_that.textSize,_that.textColor,_that.backgroundFade,_that.backgroundFadeColor,_that.mode,_that.hasChanges,_that.showPurchaseAnimation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String textFont,  int textSize,  Color textColor,  double backgroundFade,  Color backgroundFadeColor,  BackgroundEditMode mode,  bool hasChanges,  bool showPurchaseAnimation)  $default,) {final _that = this;
switch (_that) {
case _BackgroundEditState():
return $default(_that.textFont,_that.textSize,_that.textColor,_that.backgroundFade,_that.backgroundFadeColor,_that.mode,_that.hasChanges,_that.showPurchaseAnimation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String textFont,  int textSize,  Color textColor,  double backgroundFade,  Color backgroundFadeColor,  BackgroundEditMode mode,  bool hasChanges,  bool showPurchaseAnimation)?  $default,) {final _that = this;
switch (_that) {
case _BackgroundEditState() when $default != null:
return $default(_that.textFont,_that.textSize,_that.textColor,_that.backgroundFade,_that.backgroundFadeColor,_that.mode,_that.hasChanges,_that.showPurchaseAnimation);case _:
  return null;

}
}

}

/// @nodoc


class _BackgroundEditState extends BackgroundEditState {
  const _BackgroundEditState({required this.textFont, required this.textSize, required this.textColor, required this.backgroundFade, required this.backgroundFadeColor, required this.mode, this.hasChanges = false, this.showPurchaseAnimation = false}): super._();
  

@override final  String textFont;
@override final  int textSize;
@override final  Color textColor;
@override final  double backgroundFade;
@override final  Color backgroundFadeColor;
@override final  BackgroundEditMode mode;
@override@JsonKey() final  bool hasChanges;
@override@JsonKey() final  bool showPurchaseAnimation;

/// Create a copy of BackgroundEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BackgroundEditStateCopyWith<_BackgroundEditState> get copyWith => __$BackgroundEditStateCopyWithImpl<_BackgroundEditState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BackgroundEditState&&(identical(other.textFont, textFont) || other.textFont == textFont)&&(identical(other.textSize, textSize) || other.textSize == textSize)&&(identical(other.textColor, textColor) || other.textColor == textColor)&&(identical(other.backgroundFade, backgroundFade) || other.backgroundFade == backgroundFade)&&(identical(other.backgroundFadeColor, backgroundFadeColor) || other.backgroundFadeColor == backgroundFadeColor)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.hasChanges, hasChanges) || other.hasChanges == hasChanges)&&(identical(other.showPurchaseAnimation, showPurchaseAnimation) || other.showPurchaseAnimation == showPurchaseAnimation));
}


@override
int get hashCode => Object.hash(runtimeType,textFont,textSize,textColor,backgroundFade,backgroundFadeColor,mode,hasChanges,showPurchaseAnimation);

@override
String toString() {
  return 'BackgroundEditState(textFont: $textFont, textSize: $textSize, textColor: $textColor, backgroundFade: $backgroundFade, backgroundFadeColor: $backgroundFadeColor, mode: $mode, hasChanges: $hasChanges, showPurchaseAnimation: $showPurchaseAnimation)';
}


}

/// @nodoc
abstract mixin class _$BackgroundEditStateCopyWith<$Res> implements $BackgroundEditStateCopyWith<$Res> {
  factory _$BackgroundEditStateCopyWith(_BackgroundEditState value, $Res Function(_BackgroundEditState) _then) = __$BackgroundEditStateCopyWithImpl;
@override @useResult
$Res call({
 String textFont, int textSize, Color textColor, double backgroundFade, Color backgroundFadeColor, BackgroundEditMode mode, bool hasChanges, bool showPurchaseAnimation
});




}
/// @nodoc
class __$BackgroundEditStateCopyWithImpl<$Res>
    implements _$BackgroundEditStateCopyWith<$Res> {
  __$BackgroundEditStateCopyWithImpl(this._self, this._then);

  final _BackgroundEditState _self;
  final $Res Function(_BackgroundEditState) _then;

/// Create a copy of BackgroundEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? textFont = null,Object? textSize = null,Object? textColor = null,Object? backgroundFade = null,Object? backgroundFadeColor = null,Object? mode = null,Object? hasChanges = null,Object? showPurchaseAnimation = null,}) {
  return _then(_BackgroundEditState(
textFont: null == textFont ? _self.textFont : textFont // ignore: cast_nullable_to_non_nullable
as String,textSize: null == textSize ? _self.textSize : textSize // ignore: cast_nullable_to_non_nullable
as int,textColor: null == textColor ? _self.textColor : textColor // ignore: cast_nullable_to_non_nullable
as Color,backgroundFade: null == backgroundFade ? _self.backgroundFade : backgroundFade // ignore: cast_nullable_to_non_nullable
as double,backgroundFadeColor: null == backgroundFadeColor ? _self.backgroundFadeColor : backgroundFadeColor // ignore: cast_nullable_to_non_nullable
as Color,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as BackgroundEditMode,hasChanges: null == hasChanges ? _self.hasChanges : hasChanges // ignore: cast_nullable_to_non_nullable
as bool,showPurchaseAnimation: null == showPurchaseAnimation ? _self.showPurchaseAnimation : showPurchaseAnimation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
