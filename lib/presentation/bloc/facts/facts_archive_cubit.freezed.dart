// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facts_archive_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FactsArchiveState implements DiagnosticableTreeMixin {

 bool get isFetching; bool get isFetchingMore; int get archiveListTotalCount; Set<UniqueId> get archiveIds; List<ArchivedFact> get archiveList; Option<FactsFailure> get failure;
/// Create a copy of FactsArchiveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FactsArchiveStateCopyWith<FactsArchiveState> get copyWith => _$FactsArchiveStateCopyWithImpl<FactsArchiveState>(this as FactsArchiveState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FactsArchiveState'))
    ..add(DiagnosticsProperty('isFetching', isFetching))..add(DiagnosticsProperty('isFetchingMore', isFetchingMore))..add(DiagnosticsProperty('archiveListTotalCount', archiveListTotalCount))..add(DiagnosticsProperty('archiveIds', archiveIds))..add(DiagnosticsProperty('archiveList', archiveList))..add(DiagnosticsProperty('failure', failure));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FactsArchiveState&&(identical(other.isFetching, isFetching) || other.isFetching == isFetching)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.archiveListTotalCount, archiveListTotalCount) || other.archiveListTotalCount == archiveListTotalCount)&&const DeepCollectionEquality().equals(other.archiveIds, archiveIds)&&const DeepCollectionEquality().equals(other.archiveList, archiveList)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,isFetching,isFetchingMore,archiveListTotalCount,const DeepCollectionEquality().hash(archiveIds),const DeepCollectionEquality().hash(archiveList),failure);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FactsArchiveState(isFetching: $isFetching, isFetchingMore: $isFetchingMore, archiveListTotalCount: $archiveListTotalCount, archiveIds: $archiveIds, archiveList: $archiveList, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FactsArchiveStateCopyWith<$Res>  {
  factory $FactsArchiveStateCopyWith(FactsArchiveState value, $Res Function(FactsArchiveState) _then) = _$FactsArchiveStateCopyWithImpl;
@useResult
$Res call({
 bool isFetching, bool isFetchingMore, int archiveListTotalCount, Set<UniqueId> archiveIds, List<ArchivedFact> archiveList, Option<FactsFailure> failure
});




}
/// @nodoc
class _$FactsArchiveStateCopyWithImpl<$Res>
    implements $FactsArchiveStateCopyWith<$Res> {
  _$FactsArchiveStateCopyWithImpl(this._self, this._then);

  final FactsArchiveState _self;
  final $Res Function(FactsArchiveState) _then;

/// Create a copy of FactsArchiveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isFetching = null,Object? isFetchingMore = null,Object? archiveListTotalCount = null,Object? archiveIds = null,Object? archiveList = null,Object? failure = null,}) {
  return _then(_self.copyWith(
isFetching: null == isFetching ? _self.isFetching : isFetching // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,archiveListTotalCount: null == archiveListTotalCount ? _self.archiveListTotalCount : archiveListTotalCount // ignore: cast_nullable_to_non_nullable
as int,archiveIds: null == archiveIds ? _self.archiveIds : archiveIds // ignore: cast_nullable_to_non_nullable
as Set<UniqueId>,archiveList: null == archiveList ? _self.archiveList : archiveList // ignore: cast_nullable_to_non_nullable
as List<ArchivedFact>,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Option<FactsFailure>,
  ));
}

}


/// Adds pattern-matching-related methods to [FactsArchiveState].
extension FactsArchiveStatePatterns on FactsArchiveState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FactsArchiveState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FactsArchiveState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FactsArchiveState value)  $default,){
final _that = this;
switch (_that) {
case _FactsArchiveState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FactsArchiveState value)?  $default,){
final _that = this;
switch (_that) {
case _FactsArchiveState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isFetching,  bool isFetchingMore,  int archiveListTotalCount,  Set<UniqueId> archiveIds,  List<ArchivedFact> archiveList,  Option<FactsFailure> failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FactsArchiveState() when $default != null:
return $default(_that.isFetching,_that.isFetchingMore,_that.archiveListTotalCount,_that.archiveIds,_that.archiveList,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isFetching,  bool isFetchingMore,  int archiveListTotalCount,  Set<UniqueId> archiveIds,  List<ArchivedFact> archiveList,  Option<FactsFailure> failure)  $default,) {final _that = this;
switch (_that) {
case _FactsArchiveState():
return $default(_that.isFetching,_that.isFetchingMore,_that.archiveListTotalCount,_that.archiveIds,_that.archiveList,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isFetching,  bool isFetchingMore,  int archiveListTotalCount,  Set<UniqueId> archiveIds,  List<ArchivedFact> archiveList,  Option<FactsFailure> failure)?  $default,) {final _that = this;
switch (_that) {
case _FactsArchiveState() when $default != null:
return $default(_that.isFetching,_that.isFetchingMore,_that.archiveListTotalCount,_that.archiveIds,_that.archiveList,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _FactsArchiveState extends FactsArchiveState with DiagnosticableTreeMixin {
  const _FactsArchiveState({this.isFetching = false, this.isFetchingMore = false, this.archiveListTotalCount = 0, final  Set<UniqueId> archiveIds = const <UniqueId>{}, final  List<ArchivedFact> archiveList = const <ArchivedFact>[], this.failure = const None()}): _archiveIds = archiveIds,_archiveList = archiveList,super._();
  

@override@JsonKey() final  bool isFetching;
@override@JsonKey() final  bool isFetchingMore;
@override@JsonKey() final  int archiveListTotalCount;
 final  Set<UniqueId> _archiveIds;
@override@JsonKey() Set<UniqueId> get archiveIds {
  if (_archiveIds is EqualUnmodifiableSetView) return _archiveIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_archiveIds);
}

 final  List<ArchivedFact> _archiveList;
@override@JsonKey() List<ArchivedFact> get archiveList {
  if (_archiveList is EqualUnmodifiableListView) return _archiveList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_archiveList);
}

@override@JsonKey() final  Option<FactsFailure> failure;

/// Create a copy of FactsArchiveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FactsArchiveStateCopyWith<_FactsArchiveState> get copyWith => __$FactsArchiveStateCopyWithImpl<_FactsArchiveState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FactsArchiveState'))
    ..add(DiagnosticsProperty('isFetching', isFetching))..add(DiagnosticsProperty('isFetchingMore', isFetchingMore))..add(DiagnosticsProperty('archiveListTotalCount', archiveListTotalCount))..add(DiagnosticsProperty('archiveIds', archiveIds))..add(DiagnosticsProperty('archiveList', archiveList))..add(DiagnosticsProperty('failure', failure));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FactsArchiveState&&(identical(other.isFetching, isFetching) || other.isFetching == isFetching)&&(identical(other.isFetchingMore, isFetchingMore) || other.isFetchingMore == isFetchingMore)&&(identical(other.archiveListTotalCount, archiveListTotalCount) || other.archiveListTotalCount == archiveListTotalCount)&&const DeepCollectionEquality().equals(other._archiveIds, _archiveIds)&&const DeepCollectionEquality().equals(other._archiveList, _archiveList)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,isFetching,isFetchingMore,archiveListTotalCount,const DeepCollectionEquality().hash(_archiveIds),const DeepCollectionEquality().hash(_archiveList),failure);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FactsArchiveState(isFetching: $isFetching, isFetchingMore: $isFetchingMore, archiveListTotalCount: $archiveListTotalCount, archiveIds: $archiveIds, archiveList: $archiveList, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FactsArchiveStateCopyWith<$Res> implements $FactsArchiveStateCopyWith<$Res> {
  factory _$FactsArchiveStateCopyWith(_FactsArchiveState value, $Res Function(_FactsArchiveState) _then) = __$FactsArchiveStateCopyWithImpl;
@override @useResult
$Res call({
 bool isFetching, bool isFetchingMore, int archiveListTotalCount, Set<UniqueId> archiveIds, List<ArchivedFact> archiveList, Option<FactsFailure> failure
});




}
/// @nodoc
class __$FactsArchiveStateCopyWithImpl<$Res>
    implements _$FactsArchiveStateCopyWith<$Res> {
  __$FactsArchiveStateCopyWithImpl(this._self, this._then);

  final _FactsArchiveState _self;
  final $Res Function(_FactsArchiveState) _then;

/// Create a copy of FactsArchiveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isFetching = null,Object? isFetchingMore = null,Object? archiveListTotalCount = null,Object? archiveIds = null,Object? archiveList = null,Object? failure = null,}) {
  return _then(_FactsArchiveState(
isFetching: null == isFetching ? _self.isFetching : isFetching // ignore: cast_nullable_to_non_nullable
as bool,isFetchingMore: null == isFetchingMore ? _self.isFetchingMore : isFetchingMore // ignore: cast_nullable_to_non_nullable
as bool,archiveListTotalCount: null == archiveListTotalCount ? _self.archiveListTotalCount : archiveListTotalCount // ignore: cast_nullable_to_non_nullable
as int,archiveIds: null == archiveIds ? _self._archiveIds : archiveIds // ignore: cast_nullable_to_non_nullable
as Set<UniqueId>,archiveList: null == archiveList ? _self._archiveList : archiveList // ignore: cast_nullable_to_non_nullable
as List<ArchivedFact>,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Option<FactsFailure>,
  ));
}


}

// dart format on
