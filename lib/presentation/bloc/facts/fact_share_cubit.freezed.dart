// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fact_share_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FactShareState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FactShareState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FactShareState()';
}


}

/// @nodoc
class $FactShareStateCopyWith<$Res>  {
$FactShareStateCopyWith(FactShareState _, $Res Function(FactShareState) __);
}


/// Adds pattern-matching-related methods to [FactShareState].
extension FactShareStatePatterns on FactShareState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Preparing value)?  preparing,TResult Function( _Capturing value)?  capturing,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Preparing() when preparing != null:
return preparing(_that);case _Capturing() when capturing != null:
return capturing(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Preparing value)  preparing,required TResult Function( _Capturing value)  capturing,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Preparing():
return preparing(_that);case _Capturing():
return capturing(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Preparing value)?  preparing,TResult? Function( _Capturing value)?  capturing,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Preparing() when preparing != null:
return preparing(_that);case _Capturing() when capturing != null:
return capturing(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( FactCaptureArea area,  FactShareSupportedTarget target)?  preparing,TResult Function( FactCaptureArea area,  FactShareSupportedTarget target)?  capturing,TResult Function( File file)?  success,TResult Function( CommonApiFailure error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Preparing() when preparing != null:
return preparing(_that.area,_that.target);case _Capturing() when capturing != null:
return capturing(_that.area,_that.target);case _Success() when success != null:
return success(_that.file);case _Failure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( FactCaptureArea area,  FactShareSupportedTarget target)  preparing,required TResult Function( FactCaptureArea area,  FactShareSupportedTarget target)  capturing,required TResult Function( File file)  success,required TResult Function( CommonApiFailure error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Preparing():
return preparing(_that.area,_that.target);case _Capturing():
return capturing(_that.area,_that.target);case _Success():
return success(_that.file);case _Failure():
return failure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( FactCaptureArea area,  FactShareSupportedTarget target)?  preparing,TResult? Function( FactCaptureArea area,  FactShareSupportedTarget target)?  capturing,TResult? Function( File file)?  success,TResult? Function( CommonApiFailure error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Preparing() when preparing != null:
return preparing(_that.area,_that.target);case _Capturing() when capturing != null:
return capturing(_that.area,_that.target);case _Success() when success != null:
return success(_that.file);case _Failure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends FactShareState {
  const _Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FactShareState.initial()';
}


}




/// @nodoc


class _Preparing extends FactShareState {
  const _Preparing(this.area, this.target): super._();
  

 final  FactCaptureArea area;
 final  FactShareSupportedTarget target;

/// Create a copy of FactShareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreparingCopyWith<_Preparing> get copyWith => __$PreparingCopyWithImpl<_Preparing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Preparing&&(identical(other.area, area) || other.area == area)&&(identical(other.target, target) || other.target == target));
}


@override
int get hashCode => Object.hash(runtimeType,area,target);

@override
String toString() {
  return 'FactShareState.preparing(area: $area, target: $target)';
}


}

/// @nodoc
abstract mixin class _$PreparingCopyWith<$Res> implements $FactShareStateCopyWith<$Res> {
  factory _$PreparingCopyWith(_Preparing value, $Res Function(_Preparing) _then) = __$PreparingCopyWithImpl;
@useResult
$Res call({
 FactCaptureArea area, FactShareSupportedTarget target
});




}
/// @nodoc
class __$PreparingCopyWithImpl<$Res>
    implements _$PreparingCopyWith<$Res> {
  __$PreparingCopyWithImpl(this._self, this._then);

  final _Preparing _self;
  final $Res Function(_Preparing) _then;

/// Create a copy of FactShareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? area = null,Object? target = null,}) {
  return _then(_Preparing(
null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as FactCaptureArea,null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as FactShareSupportedTarget,
  ));
}


}

/// @nodoc


class _Capturing extends FactShareState {
  const _Capturing(this.area, this.target): super._();
  

 final  FactCaptureArea area;
 final  FactShareSupportedTarget target;

/// Create a copy of FactShareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CapturingCopyWith<_Capturing> get copyWith => __$CapturingCopyWithImpl<_Capturing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Capturing&&(identical(other.area, area) || other.area == area)&&(identical(other.target, target) || other.target == target));
}


@override
int get hashCode => Object.hash(runtimeType,area,target);

@override
String toString() {
  return 'FactShareState.capturing(area: $area, target: $target)';
}


}

/// @nodoc
abstract mixin class _$CapturingCopyWith<$Res> implements $FactShareStateCopyWith<$Res> {
  factory _$CapturingCopyWith(_Capturing value, $Res Function(_Capturing) _then) = __$CapturingCopyWithImpl;
@useResult
$Res call({
 FactCaptureArea area, FactShareSupportedTarget target
});




}
/// @nodoc
class __$CapturingCopyWithImpl<$Res>
    implements _$CapturingCopyWith<$Res> {
  __$CapturingCopyWithImpl(this._self, this._then);

  final _Capturing _self;
  final $Res Function(_Capturing) _then;

/// Create a copy of FactShareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? area = null,Object? target = null,}) {
  return _then(_Capturing(
null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as FactCaptureArea,null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as FactShareSupportedTarget,
  ));
}


}

/// @nodoc


class _Success extends FactShareState {
  const _Success(this.file): super._();
  

 final  File file;

/// Create a copy of FactShareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.file, file) || other.file == file));
}


@override
int get hashCode => Object.hash(runtimeType,file);

@override
String toString() {
  return 'FactShareState.success(file: $file)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $FactShareStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 File file
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of FactShareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? file = null,}) {
  return _then(_Success(
null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc


class _Failure extends FactShareState {
  const _Failure(this.error): super._();
  

 final  CommonApiFailure error;

/// Create a copy of FactShareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'FactShareState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $FactShareStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 CommonApiFailure error
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of FactShareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Failure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as CommonApiFailure,
  ));
}


}

// dart format on
