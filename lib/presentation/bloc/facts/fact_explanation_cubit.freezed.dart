// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fact_explanation_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FactExplanationState implements DiagnosticableTreeMixin {

 bool get checkingFactExplanation; bool get factExplanationChecked; bool get loadingFactExplanation; bool get factExplanationLoaded; Option<FactExplanation> get explanation; Option<FactsFailure> get failure;
/// Create a copy of FactExplanationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FactExplanationStateCopyWith<FactExplanationState> get copyWith => _$FactExplanationStateCopyWithImpl<FactExplanationState>(this as FactExplanationState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FactExplanationState'))
    ..add(DiagnosticsProperty('checkingFactExplanation', checkingFactExplanation))..add(DiagnosticsProperty('factExplanationChecked', factExplanationChecked))..add(DiagnosticsProperty('loadingFactExplanation', loadingFactExplanation))..add(DiagnosticsProperty('factExplanationLoaded', factExplanationLoaded))..add(DiagnosticsProperty('explanation', explanation))..add(DiagnosticsProperty('failure', failure));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FactExplanationState&&(identical(other.checkingFactExplanation, checkingFactExplanation) || other.checkingFactExplanation == checkingFactExplanation)&&(identical(other.factExplanationChecked, factExplanationChecked) || other.factExplanationChecked == factExplanationChecked)&&(identical(other.loadingFactExplanation, loadingFactExplanation) || other.loadingFactExplanation == loadingFactExplanation)&&(identical(other.factExplanationLoaded, factExplanationLoaded) || other.factExplanationLoaded == factExplanationLoaded)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,checkingFactExplanation,factExplanationChecked,loadingFactExplanation,factExplanationLoaded,explanation,failure);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FactExplanationState(checkingFactExplanation: $checkingFactExplanation, factExplanationChecked: $factExplanationChecked, loadingFactExplanation: $loadingFactExplanation, factExplanationLoaded: $factExplanationLoaded, explanation: $explanation, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FactExplanationStateCopyWith<$Res>  {
  factory $FactExplanationStateCopyWith(FactExplanationState value, $Res Function(FactExplanationState) _then) = _$FactExplanationStateCopyWithImpl;
@useResult
$Res call({
 bool checkingFactExplanation, bool factExplanationChecked, bool loadingFactExplanation, bool factExplanationLoaded, Option<FactExplanation> explanation, Option<FactsFailure> failure
});




}
/// @nodoc
class _$FactExplanationStateCopyWithImpl<$Res>
    implements $FactExplanationStateCopyWith<$Res> {
  _$FactExplanationStateCopyWithImpl(this._self, this._then);

  final FactExplanationState _self;
  final $Res Function(FactExplanationState) _then;

/// Create a copy of FactExplanationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkingFactExplanation = null,Object? factExplanationChecked = null,Object? loadingFactExplanation = null,Object? factExplanationLoaded = null,Object? explanation = null,Object? failure = null,}) {
  return _then(_self.copyWith(
checkingFactExplanation: null == checkingFactExplanation ? _self.checkingFactExplanation : checkingFactExplanation // ignore: cast_nullable_to_non_nullable
as bool,factExplanationChecked: null == factExplanationChecked ? _self.factExplanationChecked : factExplanationChecked // ignore: cast_nullable_to_non_nullable
as bool,loadingFactExplanation: null == loadingFactExplanation ? _self.loadingFactExplanation : loadingFactExplanation // ignore: cast_nullable_to_non_nullable
as bool,factExplanationLoaded: null == factExplanationLoaded ? _self.factExplanationLoaded : factExplanationLoaded // ignore: cast_nullable_to_non_nullable
as bool,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as Option<FactExplanation>,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Option<FactsFailure>,
  ));
}

}


/// Adds pattern-matching-related methods to [FactExplanationState].
extension FactExplanationStatePatterns on FactExplanationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FactExplanationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FactExplanationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FactExplanationState value)  $default,){
final _that = this;
switch (_that) {
case _FactExplanationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FactExplanationState value)?  $default,){
final _that = this;
switch (_that) {
case _FactExplanationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool checkingFactExplanation,  bool factExplanationChecked,  bool loadingFactExplanation,  bool factExplanationLoaded,  Option<FactExplanation> explanation,  Option<FactsFailure> failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FactExplanationState() when $default != null:
return $default(_that.checkingFactExplanation,_that.factExplanationChecked,_that.loadingFactExplanation,_that.factExplanationLoaded,_that.explanation,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool checkingFactExplanation,  bool factExplanationChecked,  bool loadingFactExplanation,  bool factExplanationLoaded,  Option<FactExplanation> explanation,  Option<FactsFailure> failure)  $default,) {final _that = this;
switch (_that) {
case _FactExplanationState():
return $default(_that.checkingFactExplanation,_that.factExplanationChecked,_that.loadingFactExplanation,_that.factExplanationLoaded,_that.explanation,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool checkingFactExplanation,  bool factExplanationChecked,  bool loadingFactExplanation,  bool factExplanationLoaded,  Option<FactExplanation> explanation,  Option<FactsFailure> failure)?  $default,) {final _that = this;
switch (_that) {
case _FactExplanationState() when $default != null:
return $default(_that.checkingFactExplanation,_that.factExplanationChecked,_that.loadingFactExplanation,_that.factExplanationLoaded,_that.explanation,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _FactExplanationState extends FactExplanationState with DiagnosticableTreeMixin {
  const _FactExplanationState({this.checkingFactExplanation = false, this.factExplanationChecked = false, this.loadingFactExplanation = false, this.factExplanationLoaded = false, this.explanation = const None(), this.failure = const None()}): super._();
  

@override@JsonKey() final  bool checkingFactExplanation;
@override@JsonKey() final  bool factExplanationChecked;
@override@JsonKey() final  bool loadingFactExplanation;
@override@JsonKey() final  bool factExplanationLoaded;
@override@JsonKey() final  Option<FactExplanation> explanation;
@override@JsonKey() final  Option<FactsFailure> failure;

/// Create a copy of FactExplanationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FactExplanationStateCopyWith<_FactExplanationState> get copyWith => __$FactExplanationStateCopyWithImpl<_FactExplanationState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FactExplanationState'))
    ..add(DiagnosticsProperty('checkingFactExplanation', checkingFactExplanation))..add(DiagnosticsProperty('factExplanationChecked', factExplanationChecked))..add(DiagnosticsProperty('loadingFactExplanation', loadingFactExplanation))..add(DiagnosticsProperty('factExplanationLoaded', factExplanationLoaded))..add(DiagnosticsProperty('explanation', explanation))..add(DiagnosticsProperty('failure', failure));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FactExplanationState&&(identical(other.checkingFactExplanation, checkingFactExplanation) || other.checkingFactExplanation == checkingFactExplanation)&&(identical(other.factExplanationChecked, factExplanationChecked) || other.factExplanationChecked == factExplanationChecked)&&(identical(other.loadingFactExplanation, loadingFactExplanation) || other.loadingFactExplanation == loadingFactExplanation)&&(identical(other.factExplanationLoaded, factExplanationLoaded) || other.factExplanationLoaded == factExplanationLoaded)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,checkingFactExplanation,factExplanationChecked,loadingFactExplanation,factExplanationLoaded,explanation,failure);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FactExplanationState(checkingFactExplanation: $checkingFactExplanation, factExplanationChecked: $factExplanationChecked, loadingFactExplanation: $loadingFactExplanation, factExplanationLoaded: $factExplanationLoaded, explanation: $explanation, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FactExplanationStateCopyWith<$Res> implements $FactExplanationStateCopyWith<$Res> {
  factory _$FactExplanationStateCopyWith(_FactExplanationState value, $Res Function(_FactExplanationState) _then) = __$FactExplanationStateCopyWithImpl;
@override @useResult
$Res call({
 bool checkingFactExplanation, bool factExplanationChecked, bool loadingFactExplanation, bool factExplanationLoaded, Option<FactExplanation> explanation, Option<FactsFailure> failure
});




}
/// @nodoc
class __$FactExplanationStateCopyWithImpl<$Res>
    implements _$FactExplanationStateCopyWith<$Res> {
  __$FactExplanationStateCopyWithImpl(this._self, this._then);

  final _FactExplanationState _self;
  final $Res Function(_FactExplanationState) _then;

/// Create a copy of FactExplanationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkingFactExplanation = null,Object? factExplanationChecked = null,Object? loadingFactExplanation = null,Object? factExplanationLoaded = null,Object? explanation = null,Object? failure = null,}) {
  return _then(_FactExplanationState(
checkingFactExplanation: null == checkingFactExplanation ? _self.checkingFactExplanation : checkingFactExplanation // ignore: cast_nullable_to_non_nullable
as bool,factExplanationChecked: null == factExplanationChecked ? _self.factExplanationChecked : factExplanationChecked // ignore: cast_nullable_to_non_nullable
as bool,loadingFactExplanation: null == loadingFactExplanation ? _self.loadingFactExplanation : loadingFactExplanation // ignore: cast_nullable_to_non_nullable
as bool,factExplanationLoaded: null == factExplanationLoaded ? _self.factExplanationLoaded : factExplanationLoaded // ignore: cast_nullable_to_non_nullable
as bool,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as Option<FactExplanation>,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Option<FactsFailure>,
  ));
}


}

// dart format on
