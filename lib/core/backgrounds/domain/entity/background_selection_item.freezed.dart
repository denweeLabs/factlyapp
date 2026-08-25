// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_selection_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BackgroundSelectionItem {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BackgroundSelectionItem);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackgroundSelectionItem()';
}


}

/// @nodoc
class $BackgroundSelectionItemCopyWith<$Res>  {
$BackgroundSelectionItemCopyWith(BackgroundSelectionItem _, $Res Function(BackgroundSelectionItem) __);
}


/// Adds pattern-matching-related methods to [BackgroundSelectionItem].
extension BackgroundSelectionItemPatterns on BackgroundSelectionItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Default value)?  defaultBackground,TResult Function( Available value)?  availableBackground,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Default() when defaultBackground != null:
return defaultBackground(_that);case Available() when availableBackground != null:
return availableBackground(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Default value)  defaultBackground,required TResult Function( Available value)  availableBackground,}){
final _that = this;
switch (_that) {
case Default():
return defaultBackground(_that);case Available():
return availableBackground(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Default value)?  defaultBackground,TResult? Function( Available value)?  availableBackground,}){
final _that = this;
switch (_that) {
case Default() when defaultBackground != null:
return defaultBackground(_that);case Available() when availableBackground != null:
return availableBackground(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  defaultBackground,TResult Function( AvailableBackground background)?  availableBackground,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Default() when defaultBackground != null:
return defaultBackground();case Available() when availableBackground != null:
return availableBackground(_that.background);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  defaultBackground,required TResult Function( AvailableBackground background)  availableBackground,}) {final _that = this;
switch (_that) {
case Default():
return defaultBackground();case Available():
return availableBackground(_that.background);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  defaultBackground,TResult? Function( AvailableBackground background)?  availableBackground,}) {final _that = this;
switch (_that) {
case Default() when defaultBackground != null:
return defaultBackground();case Available() when availableBackground != null:
return availableBackground(_that.background);case _:
  return null;

}
}

}

/// @nodoc


class Default extends BackgroundSelectionItem {
  const Default(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Default);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BackgroundSelectionItem.defaultBackground()';
}


}




/// @nodoc


class Available extends BackgroundSelectionItem {
  const Available(this.background): super._();
  

 final  AvailableBackground background;

/// Create a copy of BackgroundSelectionItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableCopyWith<Available> get copyWith => _$AvailableCopyWithImpl<Available>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Available&&(identical(other.background, background) || other.background == background));
}


@override
int get hashCode => Object.hash(runtimeType,background);

@override
String toString() {
  return 'BackgroundSelectionItem.availableBackground(background: $background)';
}


}

/// @nodoc
abstract mixin class $AvailableCopyWith<$Res> implements $BackgroundSelectionItemCopyWith<$Res> {
  factory $AvailableCopyWith(Available value, $Res Function(Available) _then) = _$AvailableCopyWithImpl;
@useResult
$Res call({
 AvailableBackground background
});


$AvailableBackgroundCopyWith<$Res> get background;

}
/// @nodoc
class _$AvailableCopyWithImpl<$Res>
    implements $AvailableCopyWith<$Res> {
  _$AvailableCopyWithImpl(this._self, this._then);

  final Available _self;
  final $Res Function(Available) _then;

/// Create a copy of BackgroundSelectionItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? background = null,}) {
  return _then(Available(
null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as AvailableBackground,
  ));
}

/// Create a copy of BackgroundSelectionItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AvailableBackgroundCopyWith<$Res> get background {
  
  return $AvailableBackgroundCopyWith<$Res>(_self.background, (value) {
    return _then(_self.copyWith(background: value));
  });
}
}

// dart format on
