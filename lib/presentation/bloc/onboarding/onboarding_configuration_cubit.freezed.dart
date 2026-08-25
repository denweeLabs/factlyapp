// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_configuration_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingConfigurationState {

 ConfigurationStep get step; bool get submissionInProgress; bool get isSubmissionVisibilityForced; Option<Either<CommonApiFailure, Unit>> get submissionFailureOrSuccess;
/// Create a copy of OnboardingConfigurationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingConfigurationStateCopyWith<OnboardingConfigurationState> get copyWith => _$OnboardingConfigurationStateCopyWithImpl<OnboardingConfigurationState>(this as OnboardingConfigurationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingConfigurationState&&(identical(other.step, step) || other.step == step)&&(identical(other.submissionInProgress, submissionInProgress) || other.submissionInProgress == submissionInProgress)&&(identical(other.isSubmissionVisibilityForced, isSubmissionVisibilityForced) || other.isSubmissionVisibilityForced == isSubmissionVisibilityForced)&&(identical(other.submissionFailureOrSuccess, submissionFailureOrSuccess) || other.submissionFailureOrSuccess == submissionFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,step,submissionInProgress,isSubmissionVisibilityForced,submissionFailureOrSuccess);

@override
String toString() {
  return 'OnboardingConfigurationState(step: $step, submissionInProgress: $submissionInProgress, isSubmissionVisibilityForced: $isSubmissionVisibilityForced, submissionFailureOrSuccess: $submissionFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class $OnboardingConfigurationStateCopyWith<$Res>  {
  factory $OnboardingConfigurationStateCopyWith(OnboardingConfigurationState value, $Res Function(OnboardingConfigurationState) _then) = _$OnboardingConfigurationStateCopyWithImpl;
@useResult
$Res call({
 ConfigurationStep step, bool submissionInProgress, bool isSubmissionVisibilityForced, Option<Either<CommonApiFailure, Unit>> submissionFailureOrSuccess
});




}
/// @nodoc
class _$OnboardingConfigurationStateCopyWithImpl<$Res>
    implements $OnboardingConfigurationStateCopyWith<$Res> {
  _$OnboardingConfigurationStateCopyWithImpl(this._self, this._then);

  final OnboardingConfigurationState _self;
  final $Res Function(OnboardingConfigurationState) _then;

/// Create a copy of OnboardingConfigurationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? submissionInProgress = null,Object? isSubmissionVisibilityForced = null,Object? submissionFailureOrSuccess = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as ConfigurationStep,submissionInProgress: null == submissionInProgress ? _self.submissionInProgress : submissionInProgress // ignore: cast_nullable_to_non_nullable
as bool,isSubmissionVisibilityForced: null == isSubmissionVisibilityForced ? _self.isSubmissionVisibilityForced : isSubmissionVisibilityForced // ignore: cast_nullable_to_non_nullable
as bool,submissionFailureOrSuccess: null == submissionFailureOrSuccess ? _self.submissionFailureOrSuccess : submissionFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<CommonApiFailure, Unit>>,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingConfigurationState].
extension OnboardingConfigurationStatePatterns on OnboardingConfigurationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingConfigurationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingConfigurationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingConfigurationState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingConfigurationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingConfigurationState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingConfigurationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConfigurationStep step,  bool submissionInProgress,  bool isSubmissionVisibilityForced,  Option<Either<CommonApiFailure, Unit>> submissionFailureOrSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingConfigurationState() when $default != null:
return $default(_that.step,_that.submissionInProgress,_that.isSubmissionVisibilityForced,_that.submissionFailureOrSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConfigurationStep step,  bool submissionInProgress,  bool isSubmissionVisibilityForced,  Option<Either<CommonApiFailure, Unit>> submissionFailureOrSuccess)  $default,) {final _that = this;
switch (_that) {
case _OnboardingConfigurationState():
return $default(_that.step,_that.submissionInProgress,_that.isSubmissionVisibilityForced,_that.submissionFailureOrSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConfigurationStep step,  bool submissionInProgress,  bool isSubmissionVisibilityForced,  Option<Either<CommonApiFailure, Unit>> submissionFailureOrSuccess)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingConfigurationState() when $default != null:
return $default(_that.step,_that.submissionInProgress,_that.isSubmissionVisibilityForced,_that.submissionFailureOrSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingConfigurationState extends OnboardingConfigurationState {
  const _OnboardingConfigurationState({this.step = ConfigurationStep.selectInterests, this.submissionInProgress = false, this.isSubmissionVisibilityForced = false, this.submissionFailureOrSuccess = const None()}): super._();
  

@override@JsonKey() final  ConfigurationStep step;
@override@JsonKey() final  bool submissionInProgress;
@override@JsonKey() final  bool isSubmissionVisibilityForced;
@override@JsonKey() final  Option<Either<CommonApiFailure, Unit>> submissionFailureOrSuccess;

/// Create a copy of OnboardingConfigurationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingConfigurationStateCopyWith<_OnboardingConfigurationState> get copyWith => __$OnboardingConfigurationStateCopyWithImpl<_OnboardingConfigurationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingConfigurationState&&(identical(other.step, step) || other.step == step)&&(identical(other.submissionInProgress, submissionInProgress) || other.submissionInProgress == submissionInProgress)&&(identical(other.isSubmissionVisibilityForced, isSubmissionVisibilityForced) || other.isSubmissionVisibilityForced == isSubmissionVisibilityForced)&&(identical(other.submissionFailureOrSuccess, submissionFailureOrSuccess) || other.submissionFailureOrSuccess == submissionFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,step,submissionInProgress,isSubmissionVisibilityForced,submissionFailureOrSuccess);

@override
String toString() {
  return 'OnboardingConfigurationState(step: $step, submissionInProgress: $submissionInProgress, isSubmissionVisibilityForced: $isSubmissionVisibilityForced, submissionFailureOrSuccess: $submissionFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class _$OnboardingConfigurationStateCopyWith<$Res> implements $OnboardingConfigurationStateCopyWith<$Res> {
  factory _$OnboardingConfigurationStateCopyWith(_OnboardingConfigurationState value, $Res Function(_OnboardingConfigurationState) _then) = __$OnboardingConfigurationStateCopyWithImpl;
@override @useResult
$Res call({
 ConfigurationStep step, bool submissionInProgress, bool isSubmissionVisibilityForced, Option<Either<CommonApiFailure, Unit>> submissionFailureOrSuccess
});




}
/// @nodoc
class __$OnboardingConfigurationStateCopyWithImpl<$Res>
    implements _$OnboardingConfigurationStateCopyWith<$Res> {
  __$OnboardingConfigurationStateCopyWithImpl(this._self, this._then);

  final _OnboardingConfigurationState _self;
  final $Res Function(_OnboardingConfigurationState) _then;

/// Create a copy of OnboardingConfigurationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? submissionInProgress = null,Object? isSubmissionVisibilityForced = null,Object? submissionFailureOrSuccess = null,}) {
  return _then(_OnboardingConfigurationState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as ConfigurationStep,submissionInProgress: null == submissionInProgress ? _self.submissionInProgress : submissionInProgress // ignore: cast_nullable_to_non_nullable
as bool,isSubmissionVisibilityForced: null == isSubmissionVisibilityForced ? _self.isSubmissionVisibilityForced : isSubmissionVisibilityForced // ignore: cast_nullable_to_non_nullable
as bool,submissionFailureOrSuccess: null == submissionFailureOrSuccess ? _self.submissionFailureOrSuccess : submissionFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<CommonApiFailure, Unit>>,
  ));
}


}

// dart format on
