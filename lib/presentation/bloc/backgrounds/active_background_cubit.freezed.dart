// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_background_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveBackgroundState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ActiveBackgroundState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveBackgroundState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ActiveBackgroundState()';
}


}

/// @nodoc
class $ActiveBackgroundStateCopyWith<$Res>  {
$ActiveBackgroundStateCopyWith(ActiveBackgroundState _, $Res Function(ActiveBackgroundState) __);
}


/// Adds pattern-matching-related methods to [ActiveBackgroundState].
extension ActiveBackgroundStatePatterns on ActiveBackgroundState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Default value)?  defaultBackground,TResult Function( _Applying value)?  applying,TResult Function( _Failure value)?  failure,TResult Function( _Applied value)?  applied,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Default() when defaultBackground != null:
return defaultBackground(_that);case _Applying() when applying != null:
return applying(_that);case _Failure() when failure != null:
return failure(_that);case _Applied() when applied != null:
return applied(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Default value)  defaultBackground,required TResult Function( _Applying value)  applying,required TResult Function( _Failure value)  failure,required TResult Function( _Applied value)  applied,}){
final _that = this;
switch (_that) {
case _Default():
return defaultBackground(_that);case _Applying():
return applying(_that);case _Failure():
return failure(_that);case _Applied():
return applied(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Default value)?  defaultBackground,TResult? Function( _Applying value)?  applying,TResult? Function( _Failure value)?  failure,TResult? Function( _Applied value)?  applied,}){
final _that = this;
switch (_that) {
case _Default() when defaultBackground != null:
return defaultBackground(_that);case _Applying() when applying != null:
return applying(_that);case _Failure() when failure != null:
return failure(_that);case _Applied() when applied != null:
return applied(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  defaultBackground,TResult Function( UniqueId id)?  applying,TResult Function( BackgroundFailure data)?  failure,TResult Function( bool isPurchasedViaStars,  ResolvedBackgroundAsset asset)?  applied,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Default() when defaultBackground != null:
return defaultBackground();case _Applying() when applying != null:
return applying(_that.id);case _Failure() when failure != null:
return failure(_that.data);case _Applied() when applied != null:
return applied(_that.isPurchasedViaStars,_that.asset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  defaultBackground,required TResult Function( UniqueId id)  applying,required TResult Function( BackgroundFailure data)  failure,required TResult Function( bool isPurchasedViaStars,  ResolvedBackgroundAsset asset)  applied,}) {final _that = this;
switch (_that) {
case _Default():
return defaultBackground();case _Applying():
return applying(_that.id);case _Failure():
return failure(_that.data);case _Applied():
return applied(_that.isPurchasedViaStars,_that.asset);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  defaultBackground,TResult? Function( UniqueId id)?  applying,TResult? Function( BackgroundFailure data)?  failure,TResult? Function( bool isPurchasedViaStars,  ResolvedBackgroundAsset asset)?  applied,}) {final _that = this;
switch (_that) {
case _Default() when defaultBackground != null:
return defaultBackground();case _Applying() when applying != null:
return applying(_that.id);case _Failure() when failure != null:
return failure(_that.data);case _Applied() when applied != null:
return applied(_that.isPurchasedViaStars,_that.asset);case _:
  return null;

}
}

}

/// @nodoc


class _Default extends ActiveBackgroundState with DiagnosticableTreeMixin {
  const _Default(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ActiveBackgroundState.defaultBackground'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Default);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ActiveBackgroundState.defaultBackground()';
}


}




/// @nodoc


class _Applying extends ActiveBackgroundState with DiagnosticableTreeMixin {
  const _Applying(this.id): super._();
  

 final  UniqueId id;

/// Create a copy of ActiveBackgroundState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplyingCopyWith<_Applying> get copyWith => __$ApplyingCopyWithImpl<_Applying>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ActiveBackgroundState.applying'))
    ..add(DiagnosticsProperty('id', id));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Applying&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ActiveBackgroundState.applying(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ApplyingCopyWith<$Res> implements $ActiveBackgroundStateCopyWith<$Res> {
  factory _$ApplyingCopyWith(_Applying value, $Res Function(_Applying) _then) = __$ApplyingCopyWithImpl;
@useResult
$Res call({
 UniqueId id
});




}
/// @nodoc
class __$ApplyingCopyWithImpl<$Res>
    implements _$ApplyingCopyWith<$Res> {
  __$ApplyingCopyWithImpl(this._self, this._then);

  final _Applying _self;
  final $Res Function(_Applying) _then;

/// Create a copy of ActiveBackgroundState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_Applying(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,
  ));
}


}

/// @nodoc


class _Failure extends ActiveBackgroundState with DiagnosticableTreeMixin {
  const _Failure(this.data): super._();
  

 final  BackgroundFailure data;

/// Create a copy of ActiveBackgroundState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ActiveBackgroundState.failure'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ActiveBackgroundState.failure(data: $data)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $ActiveBackgroundStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 BackgroundFailure data
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of ActiveBackgroundState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Failure(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BackgroundFailure,
  ));
}


}

/// @nodoc


class _Applied extends ActiveBackgroundState with DiagnosticableTreeMixin {
  const _Applied({required this.isPurchasedViaStars, required this.asset}): super._();
  

 final  bool isPurchasedViaStars;
 final  ResolvedBackgroundAsset asset;

/// Create a copy of ActiveBackgroundState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppliedCopyWith<_Applied> get copyWith => __$AppliedCopyWithImpl<_Applied>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ActiveBackgroundState.applied'))
    ..add(DiagnosticsProperty('isPurchasedViaStars', isPurchasedViaStars))..add(DiagnosticsProperty('asset', asset));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Applied&&(identical(other.isPurchasedViaStars, isPurchasedViaStars) || other.isPurchasedViaStars == isPurchasedViaStars)&&(identical(other.asset, asset) || other.asset == asset));
}


@override
int get hashCode => Object.hash(runtimeType,isPurchasedViaStars,asset);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ActiveBackgroundState.applied(isPurchasedViaStars: $isPurchasedViaStars, asset: $asset)';
}


}

/// @nodoc
abstract mixin class _$AppliedCopyWith<$Res> implements $ActiveBackgroundStateCopyWith<$Res> {
  factory _$AppliedCopyWith(_Applied value, $Res Function(_Applied) _then) = __$AppliedCopyWithImpl;
@useResult
$Res call({
 bool isPurchasedViaStars, ResolvedBackgroundAsset asset
});


$ResolvedBackgroundAssetCopyWith<$Res> get asset;

}
/// @nodoc
class __$AppliedCopyWithImpl<$Res>
    implements _$AppliedCopyWith<$Res> {
  __$AppliedCopyWithImpl(this._self, this._then);

  final _Applied _self;
  final $Res Function(_Applied) _then;

/// Create a copy of ActiveBackgroundState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPurchasedViaStars = null,Object? asset = null,}) {
  return _then(_Applied(
isPurchasedViaStars: null == isPurchasedViaStars ? _self.isPurchasedViaStars : isPurchasedViaStars // ignore: cast_nullable_to_non_nullable
as bool,asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as ResolvedBackgroundAsset,
  ));
}

/// Create a copy of ActiveBackgroundState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResolvedBackgroundAssetCopyWith<$Res> get asset {
  
  return $ResolvedBackgroundAssetCopyWith<$Res>(_self.asset, (value) {
    return _then(_self.copyWith(asset: value));
  });
}
}

// dart format on
