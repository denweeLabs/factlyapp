// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_backgrounds_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AvailableBackgroundsState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AvailableBackgroundsState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableBackgroundsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AvailableBackgroundsState()';
}


}

/// @nodoc
class $AvailableBackgroundsStateCopyWith<$Res>  {
$AvailableBackgroundsStateCopyWith(AvailableBackgroundsState _, $Res Function(AvailableBackgroundsState) __);
}


/// Adds pattern-matching-related methods to [AvailableBackgroundsState].
extension AvailableBackgroundsStatePatterns on AvailableBackgroundsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  empty,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when empty != null:
return empty(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  empty,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return empty(_that);case _Loading():
return loading(_that);case _Success():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  empty,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when empty != null:
return empty(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  empty,TResult Function()?  loading,TResult Function( List<AvailableBackground> backgrounds)?  success,TResult Function( BackgroundFailure data)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when empty != null:
return empty();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.backgrounds);case _Failure() when failure != null:
return failure(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  empty,required TResult Function()  loading,required TResult Function( List<AvailableBackground> backgrounds)  success,required TResult Function( BackgroundFailure data)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return empty();case _Loading():
return loading();case _Success():
return success(_that.backgrounds);case _Failure():
return failure(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  empty,TResult? Function()?  loading,TResult? Function( List<AvailableBackground> backgrounds)?  success,TResult? Function( BackgroundFailure data)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when empty != null:
return empty();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.backgrounds);case _Failure() when failure != null:
return failure(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends AvailableBackgroundsState with DiagnosticableTreeMixin {
  const _Initial(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AvailableBackgroundsState.empty'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AvailableBackgroundsState.empty()';
}


}




/// @nodoc


class _Loading extends AvailableBackgroundsState with DiagnosticableTreeMixin {
  const _Loading(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AvailableBackgroundsState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AvailableBackgroundsState.loading()';
}


}




/// @nodoc


class _Success extends AvailableBackgroundsState with DiagnosticableTreeMixin {
  const _Success(final  List<AvailableBackground> backgrounds): _backgrounds = backgrounds,super._();
  

 final  List<AvailableBackground> _backgrounds;
 List<AvailableBackground> get backgrounds {
  if (_backgrounds is EqualUnmodifiableListView) return _backgrounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_backgrounds);
}


/// Create a copy of AvailableBackgroundsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AvailableBackgroundsState.success'))
    ..add(DiagnosticsProperty('backgrounds', backgrounds));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._backgrounds, _backgrounds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_backgrounds));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AvailableBackgroundsState.success(backgrounds: $backgrounds)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $AvailableBackgroundsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 List<AvailableBackground> backgrounds
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of AvailableBackgroundsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? backgrounds = null,}) {
  return _then(_Success(
null == backgrounds ? _self._backgrounds : backgrounds // ignore: cast_nullable_to_non_nullable
as List<AvailableBackground>,
  ));
}


}

/// @nodoc


class _Failure extends AvailableBackgroundsState with DiagnosticableTreeMixin {
  const _Failure(this.data): super._();
  

 final  BackgroundFailure data;

/// Create a copy of AvailableBackgroundsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AvailableBackgroundsState.failure'))
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
  return 'AvailableBackgroundsState.failure(data: $data)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $AvailableBackgroundsStateCopyWith<$Res> {
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

/// Create a copy of AvailableBackgroundsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Failure(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BackgroundFailure,
  ));
}


}

// dart format on
