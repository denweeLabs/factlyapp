// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_interests_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectInterestsState {

 List<UserInterest> get selectedInterests; bool get validate;
/// Create a copy of SelectInterestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectInterestsStateCopyWith<SelectInterestsState> get copyWith => _$SelectInterestsStateCopyWithImpl<SelectInterestsState>(this as SelectInterestsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectInterestsState&&const DeepCollectionEquality().equals(other.selectedInterests, selectedInterests)&&(identical(other.validate, validate) || other.validate == validate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(selectedInterests),validate);

@override
String toString() {
  return 'SelectInterestsState(selectedInterests: $selectedInterests, validate: $validate)';
}


}

/// @nodoc
abstract mixin class $SelectInterestsStateCopyWith<$Res>  {
  factory $SelectInterestsStateCopyWith(SelectInterestsState value, $Res Function(SelectInterestsState) _then) = _$SelectInterestsStateCopyWithImpl;
@useResult
$Res call({
 List<UserInterest> selectedInterests, bool validate
});




}
/// @nodoc
class _$SelectInterestsStateCopyWithImpl<$Res>
    implements $SelectInterestsStateCopyWith<$Res> {
  _$SelectInterestsStateCopyWithImpl(this._self, this._then);

  final SelectInterestsState _self;
  final $Res Function(SelectInterestsState) _then;

/// Create a copy of SelectInterestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedInterests = null,Object? validate = null,}) {
  return _then(_self.copyWith(
selectedInterests: null == selectedInterests ? _self.selectedInterests : selectedInterests // ignore: cast_nullable_to_non_nullable
as List<UserInterest>,validate: null == validate ? _self.validate : validate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectInterestsState].
extension SelectInterestsStatePatterns on SelectInterestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectInterestsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectInterestsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectInterestsState value)  $default,){
final _that = this;
switch (_that) {
case _SelectInterestsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectInterestsState value)?  $default,){
final _that = this;
switch (_that) {
case _SelectInterestsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserInterest> selectedInterests,  bool validate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectInterestsState() when $default != null:
return $default(_that.selectedInterests,_that.validate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserInterest> selectedInterests,  bool validate)  $default,) {final _that = this;
switch (_that) {
case _SelectInterestsState():
return $default(_that.selectedInterests,_that.validate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserInterest> selectedInterests,  bool validate)?  $default,) {final _that = this;
switch (_that) {
case _SelectInterestsState() when $default != null:
return $default(_that.selectedInterests,_that.validate);case _:
  return null;

}
}

}

/// @nodoc


class _SelectInterestsState extends SelectInterestsState {
  const _SelectInterestsState({final  List<UserInterest> selectedInterests = const [], this.validate = false}): _selectedInterests = selectedInterests,super._();
  

 final  List<UserInterest> _selectedInterests;
@override@JsonKey() List<UserInterest> get selectedInterests {
  if (_selectedInterests is EqualUnmodifiableListView) return _selectedInterests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedInterests);
}

@override@JsonKey() final  bool validate;

/// Create a copy of SelectInterestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectInterestsStateCopyWith<_SelectInterestsState> get copyWith => __$SelectInterestsStateCopyWithImpl<_SelectInterestsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectInterestsState&&const DeepCollectionEquality().equals(other._selectedInterests, _selectedInterests)&&(identical(other.validate, validate) || other.validate == validate));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedInterests),validate);

@override
String toString() {
  return 'SelectInterestsState(selectedInterests: $selectedInterests, validate: $validate)';
}


}

/// @nodoc
abstract mixin class _$SelectInterestsStateCopyWith<$Res> implements $SelectInterestsStateCopyWith<$Res> {
  factory _$SelectInterestsStateCopyWith(_SelectInterestsState value, $Res Function(_SelectInterestsState) _then) = __$SelectInterestsStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserInterest> selectedInterests, bool validate
});




}
/// @nodoc
class __$SelectInterestsStateCopyWithImpl<$Res>
    implements _$SelectInterestsStateCopyWith<$Res> {
  __$SelectInterestsStateCopyWithImpl(this._self, this._then);

  final _SelectInterestsState _self;
  final $Res Function(_SelectInterestsState) _then;

/// Create a copy of SelectInterestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedInterests = null,Object? validate = null,}) {
  return _then(_SelectInterestsState(
selectedInterests: null == selectedInterests ? _self._selectedInterests : selectedInterests // ignore: cast_nullable_to_non_nullable
as List<UserInterest>,validate: null == validate ? _self.validate : validate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
