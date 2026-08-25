// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apply_background_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplyBackgroundResult {

 ActiveBackground get activeBackground; bool get isPurchased; int get starsBalance; List<UniqueId> get unlockedBackgroundIds;
/// Create a copy of ApplyBackgroundResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplyBackgroundResultCopyWith<ApplyBackgroundResult> get copyWith => _$ApplyBackgroundResultCopyWithImpl<ApplyBackgroundResult>(this as ApplyBackgroundResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplyBackgroundResult&&(identical(other.activeBackground, activeBackground) || other.activeBackground == activeBackground)&&(identical(other.isPurchased, isPurchased) || other.isPurchased == isPurchased)&&(identical(other.starsBalance, starsBalance) || other.starsBalance == starsBalance)&&const DeepCollectionEquality().equals(other.unlockedBackgroundIds, unlockedBackgroundIds));
}


@override
int get hashCode => Object.hash(runtimeType,activeBackground,isPurchased,starsBalance,const DeepCollectionEquality().hash(unlockedBackgroundIds));

@override
String toString() {
  return 'ApplyBackgroundResult(activeBackground: $activeBackground, isPurchased: $isPurchased, starsBalance: $starsBalance, unlockedBackgroundIds: $unlockedBackgroundIds)';
}


}

/// @nodoc
abstract mixin class $ApplyBackgroundResultCopyWith<$Res>  {
  factory $ApplyBackgroundResultCopyWith(ApplyBackgroundResult value, $Res Function(ApplyBackgroundResult) _then) = _$ApplyBackgroundResultCopyWithImpl;
@useResult
$Res call({
 ActiveBackground activeBackground, bool isPurchased, int starsBalance, List<UniqueId> unlockedBackgroundIds
});


$ActiveBackgroundCopyWith<$Res> get activeBackground;

}
/// @nodoc
class _$ApplyBackgroundResultCopyWithImpl<$Res>
    implements $ApplyBackgroundResultCopyWith<$Res> {
  _$ApplyBackgroundResultCopyWithImpl(this._self, this._then);

  final ApplyBackgroundResult _self;
  final $Res Function(ApplyBackgroundResult) _then;

/// Create a copy of ApplyBackgroundResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeBackground = null,Object? isPurchased = null,Object? starsBalance = null,Object? unlockedBackgroundIds = null,}) {
  return _then(_self.copyWith(
activeBackground: null == activeBackground ? _self.activeBackground : activeBackground // ignore: cast_nullable_to_non_nullable
as ActiveBackground,isPurchased: null == isPurchased ? _self.isPurchased : isPurchased // ignore: cast_nullable_to_non_nullable
as bool,starsBalance: null == starsBalance ? _self.starsBalance : starsBalance // ignore: cast_nullable_to_non_nullable
as int,unlockedBackgroundIds: null == unlockedBackgroundIds ? _self.unlockedBackgroundIds : unlockedBackgroundIds // ignore: cast_nullable_to_non_nullable
as List<UniqueId>,
  ));
}
/// Create a copy of ApplyBackgroundResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActiveBackgroundCopyWith<$Res> get activeBackground {
  
  return $ActiveBackgroundCopyWith<$Res>(_self.activeBackground, (value) {
    return _then(_self.copyWith(activeBackground: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplyBackgroundResult].
extension ApplyBackgroundResultPatterns on ApplyBackgroundResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplyBackgroundResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplyBackgroundResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplyBackgroundResult value)  $default,){
final _that = this;
switch (_that) {
case _ApplyBackgroundResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplyBackgroundResult value)?  $default,){
final _that = this;
switch (_that) {
case _ApplyBackgroundResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActiveBackground activeBackground,  bool isPurchased,  int starsBalance,  List<UniqueId> unlockedBackgroundIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplyBackgroundResult() when $default != null:
return $default(_that.activeBackground,_that.isPurchased,_that.starsBalance,_that.unlockedBackgroundIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActiveBackground activeBackground,  bool isPurchased,  int starsBalance,  List<UniqueId> unlockedBackgroundIds)  $default,) {final _that = this;
switch (_that) {
case _ApplyBackgroundResult():
return $default(_that.activeBackground,_that.isPurchased,_that.starsBalance,_that.unlockedBackgroundIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActiveBackground activeBackground,  bool isPurchased,  int starsBalance,  List<UniqueId> unlockedBackgroundIds)?  $default,) {final _that = this;
switch (_that) {
case _ApplyBackgroundResult() when $default != null:
return $default(_that.activeBackground,_that.isPurchased,_that.starsBalance,_that.unlockedBackgroundIds);case _:
  return null;

}
}

}

/// @nodoc


class _ApplyBackgroundResult implements ApplyBackgroundResult {
  const _ApplyBackgroundResult({required this.activeBackground, required this.isPurchased, required this.starsBalance, required final  List<UniqueId> unlockedBackgroundIds}): _unlockedBackgroundIds = unlockedBackgroundIds;
  

@override final  ActiveBackground activeBackground;
@override final  bool isPurchased;
@override final  int starsBalance;
 final  List<UniqueId> _unlockedBackgroundIds;
@override List<UniqueId> get unlockedBackgroundIds {
  if (_unlockedBackgroundIds is EqualUnmodifiableListView) return _unlockedBackgroundIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unlockedBackgroundIds);
}


/// Create a copy of ApplyBackgroundResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplyBackgroundResultCopyWith<_ApplyBackgroundResult> get copyWith => __$ApplyBackgroundResultCopyWithImpl<_ApplyBackgroundResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplyBackgroundResult&&(identical(other.activeBackground, activeBackground) || other.activeBackground == activeBackground)&&(identical(other.isPurchased, isPurchased) || other.isPurchased == isPurchased)&&(identical(other.starsBalance, starsBalance) || other.starsBalance == starsBalance)&&const DeepCollectionEquality().equals(other._unlockedBackgroundIds, _unlockedBackgroundIds));
}


@override
int get hashCode => Object.hash(runtimeType,activeBackground,isPurchased,starsBalance,const DeepCollectionEquality().hash(_unlockedBackgroundIds));

@override
String toString() {
  return 'ApplyBackgroundResult(activeBackground: $activeBackground, isPurchased: $isPurchased, starsBalance: $starsBalance, unlockedBackgroundIds: $unlockedBackgroundIds)';
}


}

/// @nodoc
abstract mixin class _$ApplyBackgroundResultCopyWith<$Res> implements $ApplyBackgroundResultCopyWith<$Res> {
  factory _$ApplyBackgroundResultCopyWith(_ApplyBackgroundResult value, $Res Function(_ApplyBackgroundResult) _then) = __$ApplyBackgroundResultCopyWithImpl;
@override @useResult
$Res call({
 ActiveBackground activeBackground, bool isPurchased, int starsBalance, List<UniqueId> unlockedBackgroundIds
});


@override $ActiveBackgroundCopyWith<$Res> get activeBackground;

}
/// @nodoc
class __$ApplyBackgroundResultCopyWithImpl<$Res>
    implements _$ApplyBackgroundResultCopyWith<$Res> {
  __$ApplyBackgroundResultCopyWithImpl(this._self, this._then);

  final _ApplyBackgroundResult _self;
  final $Res Function(_ApplyBackgroundResult) _then;

/// Create a copy of ApplyBackgroundResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeBackground = null,Object? isPurchased = null,Object? starsBalance = null,Object? unlockedBackgroundIds = null,}) {
  return _then(_ApplyBackgroundResult(
activeBackground: null == activeBackground ? _self.activeBackground : activeBackground // ignore: cast_nullable_to_non_nullable
as ActiveBackground,isPurchased: null == isPurchased ? _self.isPurchased : isPurchased // ignore: cast_nullable_to_non_nullable
as bool,starsBalance: null == starsBalance ? _self.starsBalance : starsBalance // ignore: cast_nullable_to_non_nullable
as int,unlockedBackgroundIds: null == unlockedBackgroundIds ? _self._unlockedBackgroundIds : unlockedBackgroundIds // ignore: cast_nullable_to_non_nullable
as List<UniqueId>,
  ));
}

/// Create a copy of ApplyBackgroundResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActiveBackgroundCopyWith<$Res> get activeBackground {
  
  return $ActiveBackgroundCopyWith<$Res>(_self.activeBackground, (value) {
    return _then(_self.copyWith(activeBackground: value));
  });
}
}

// dart format on
