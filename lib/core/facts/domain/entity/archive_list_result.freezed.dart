// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archive_list_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArchiveListResult {

 List<ArchivedFact> get items; int get total; int get page;
/// Create a copy of ArchiveListResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchiveListResultCopyWith<ArchiveListResult> get copyWith => _$ArchiveListResultCopyWithImpl<ArchiveListResult>(this as ArchiveListResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveListResult&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),total,page);

@override
String toString() {
  return 'ArchiveListResult(items: $items, total: $total, page: $page)';
}


}

/// @nodoc
abstract mixin class $ArchiveListResultCopyWith<$Res>  {
  factory $ArchiveListResultCopyWith(ArchiveListResult value, $Res Function(ArchiveListResult) _then) = _$ArchiveListResultCopyWithImpl;
@useResult
$Res call({
 List<ArchivedFact> items, int total, int page
});




}
/// @nodoc
class _$ArchiveListResultCopyWithImpl<$Res>
    implements $ArchiveListResultCopyWith<$Res> {
  _$ArchiveListResultCopyWithImpl(this._self, this._then);

  final ArchiveListResult _self;
  final $Res Function(ArchiveListResult) _then;

/// Create a copy of ArchiveListResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? total = null,Object? page = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ArchivedFact>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ArchiveListResult].
extension ArchiveListResultPatterns on ArchiveListResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArchiveListResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArchiveListResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArchiveListResult value)  $default,){
final _that = this;
switch (_that) {
case _ArchiveListResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArchiveListResult value)?  $default,){
final _that = this;
switch (_that) {
case _ArchiveListResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ArchivedFact> items,  int total,  int page)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArchiveListResult() when $default != null:
return $default(_that.items,_that.total,_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ArchivedFact> items,  int total,  int page)  $default,) {final _that = this;
switch (_that) {
case _ArchiveListResult():
return $default(_that.items,_that.total,_that.page);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ArchivedFact> items,  int total,  int page)?  $default,) {final _that = this;
switch (_that) {
case _ArchiveListResult() when $default != null:
return $default(_that.items,_that.total,_that.page);case _:
  return null;

}
}

}

/// @nodoc


class _ArchiveListResult implements ArchiveListResult {
  const _ArchiveListResult({required final  List<ArchivedFact> items, required this.total, required this.page}): _items = items;
  

 final  List<ArchivedFact> _items;
@override List<ArchivedFact> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int total;
@override final  int page;

/// Create a copy of ArchiveListResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArchiveListResultCopyWith<_ArchiveListResult> get copyWith => __$ArchiveListResultCopyWithImpl<_ArchiveListResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchiveListResult&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.total, total) || other.total == total)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),total,page);

@override
String toString() {
  return 'ArchiveListResult(items: $items, total: $total, page: $page)';
}


}

/// @nodoc
abstract mixin class _$ArchiveListResultCopyWith<$Res> implements $ArchiveListResultCopyWith<$Res> {
  factory _$ArchiveListResultCopyWith(_ArchiveListResult value, $Res Function(_ArchiveListResult) _then) = __$ArchiveListResultCopyWithImpl;
@override @useResult
$Res call({
 List<ArchivedFact> items, int total, int page
});




}
/// @nodoc
class __$ArchiveListResultCopyWithImpl<$Res>
    implements _$ArchiveListResultCopyWith<$Res> {
  __$ArchiveListResultCopyWithImpl(this._self, this._then);

  final _ArchiveListResult _self;
  final $Res Function(_ArchiveListResult) _then;

/// Create a copy of ArchiveListResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? total = null,Object? page = null,}) {
  return _then(_ArchiveListResult(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ArchivedFact>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
