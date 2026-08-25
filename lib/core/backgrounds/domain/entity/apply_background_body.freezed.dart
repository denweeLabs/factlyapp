// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apply_background_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplyBackgroundBody {

 UniqueId get backgroundId; BackgroundStyle get style;
/// Create a copy of ApplyBackgroundBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplyBackgroundBodyCopyWith<ApplyBackgroundBody> get copyWith => _$ApplyBackgroundBodyCopyWithImpl<ApplyBackgroundBody>(this as ApplyBackgroundBody, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplyBackgroundBody&&(identical(other.backgroundId, backgroundId) || other.backgroundId == backgroundId)&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,backgroundId,style);

@override
String toString() {
  return 'ApplyBackgroundBody(backgroundId: $backgroundId, style: $style)';
}


}

/// @nodoc
abstract mixin class $ApplyBackgroundBodyCopyWith<$Res>  {
  factory $ApplyBackgroundBodyCopyWith(ApplyBackgroundBody value, $Res Function(ApplyBackgroundBody) _then) = _$ApplyBackgroundBodyCopyWithImpl;
@useResult
$Res call({
 UniqueId backgroundId, BackgroundStyle style
});


$BackgroundStyleCopyWith<$Res> get style;

}
/// @nodoc
class _$ApplyBackgroundBodyCopyWithImpl<$Res>
    implements $ApplyBackgroundBodyCopyWith<$Res> {
  _$ApplyBackgroundBodyCopyWithImpl(this._self, this._then);

  final ApplyBackgroundBody _self;
  final $Res Function(ApplyBackgroundBody) _then;

/// Create a copy of ApplyBackgroundBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? backgroundId = null,Object? style = null,}) {
  return _then(_self.copyWith(
backgroundId: null == backgroundId ? _self.backgroundId : backgroundId // ignore: cast_nullable_to_non_nullable
as UniqueId,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as BackgroundStyle,
  ));
}
/// Create a copy of ApplyBackgroundBody
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundStyleCopyWith<$Res> get style {
  
  return $BackgroundStyleCopyWith<$Res>(_self.style, (value) {
    return _then(_self.copyWith(style: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplyBackgroundBody].
extension ApplyBackgroundBodyPatterns on ApplyBackgroundBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplyBackgroundBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplyBackgroundBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplyBackgroundBody value)  $default,){
final _that = this;
switch (_that) {
case _ApplyBackgroundBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplyBackgroundBody value)?  $default,){
final _that = this;
switch (_that) {
case _ApplyBackgroundBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UniqueId backgroundId,  BackgroundStyle style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplyBackgroundBody() when $default != null:
return $default(_that.backgroundId,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UniqueId backgroundId,  BackgroundStyle style)  $default,) {final _that = this;
switch (_that) {
case _ApplyBackgroundBody():
return $default(_that.backgroundId,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UniqueId backgroundId,  BackgroundStyle style)?  $default,) {final _that = this;
switch (_that) {
case _ApplyBackgroundBody() when $default != null:
return $default(_that.backgroundId,_that.style);case _:
  return null;

}
}

}

/// @nodoc


class _ApplyBackgroundBody implements ApplyBackgroundBody {
  const _ApplyBackgroundBody({required this.backgroundId, required this.style});
  

@override final  UniqueId backgroundId;
@override final  BackgroundStyle style;

/// Create a copy of ApplyBackgroundBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplyBackgroundBodyCopyWith<_ApplyBackgroundBody> get copyWith => __$ApplyBackgroundBodyCopyWithImpl<_ApplyBackgroundBody>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplyBackgroundBody&&(identical(other.backgroundId, backgroundId) || other.backgroundId == backgroundId)&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,backgroundId,style);

@override
String toString() {
  return 'ApplyBackgroundBody(backgroundId: $backgroundId, style: $style)';
}


}

/// @nodoc
abstract mixin class _$ApplyBackgroundBodyCopyWith<$Res> implements $ApplyBackgroundBodyCopyWith<$Res> {
  factory _$ApplyBackgroundBodyCopyWith(_ApplyBackgroundBody value, $Res Function(_ApplyBackgroundBody) _then) = __$ApplyBackgroundBodyCopyWithImpl;
@override @useResult
$Res call({
 UniqueId backgroundId, BackgroundStyle style
});


@override $BackgroundStyleCopyWith<$Res> get style;

}
/// @nodoc
class __$ApplyBackgroundBodyCopyWithImpl<$Res>
    implements _$ApplyBackgroundBodyCopyWith<$Res> {
  __$ApplyBackgroundBodyCopyWithImpl(this._self, this._then);

  final _ApplyBackgroundBody _self;
  final $Res Function(_ApplyBackgroundBody) _then;

/// Create a copy of ApplyBackgroundBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? backgroundId = null,Object? style = null,}) {
  return _then(_ApplyBackgroundBody(
backgroundId: null == backgroundId ? _self.backgroundId : backgroundId // ignore: cast_nullable_to_non_nullable
as UniqueId,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as BackgroundStyle,
  ));
}

/// Create a copy of ApplyBackgroundBody
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
