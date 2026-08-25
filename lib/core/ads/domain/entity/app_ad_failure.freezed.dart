// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_ad_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppAdFailure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppAdFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppAdFailure()';
}


}

/// @nodoc
class $AppAdFailureCopyWith<$Res>  {
$AppAdFailureCopyWith(AppAdFailure _, $Res Function(AppAdFailure) __);
}


/// Adds pattern-matching-related methods to [AppAdFailure].
extension AppAdFailurePatterns on AppAdFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Closed value)?  closed,TResult Function( _Connection value)?  connection,TResult Function( _NoAdAvailable value)?  noAdAvailable,TResult Function( _FailedToLoad value)?  failedToLoad,TResult Function( _FailedToShow value)?  failedToShow,TResult Function( _Unexpected value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Closed() when closed != null:
return closed(_that);case _Connection() when connection != null:
return connection(_that);case _NoAdAvailable() when noAdAvailable != null:
return noAdAvailable(_that);case _FailedToLoad() when failedToLoad != null:
return failedToLoad(_that);case _FailedToShow() when failedToShow != null:
return failedToShow(_that);case _Unexpected() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Closed value)  closed,required TResult Function( _Connection value)  connection,required TResult Function( _NoAdAvailable value)  noAdAvailable,required TResult Function( _FailedToLoad value)  failedToLoad,required TResult Function( _FailedToShow value)  failedToShow,required TResult Function( _Unexpected value)  unexpected,}){
final _that = this;
switch (_that) {
case _Closed():
return closed(_that);case _Connection():
return connection(_that);case _NoAdAvailable():
return noAdAvailable(_that);case _FailedToLoad():
return failedToLoad(_that);case _FailedToShow():
return failedToShow(_that);case _Unexpected():
return unexpected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Closed value)?  closed,TResult? Function( _Connection value)?  connection,TResult? Function( _NoAdAvailable value)?  noAdAvailable,TResult? Function( _FailedToLoad value)?  failedToLoad,TResult? Function( _FailedToShow value)?  failedToShow,TResult? Function( _Unexpected value)?  unexpected,}){
final _that = this;
switch (_that) {
case _Closed() when closed != null:
return closed(_that);case _Connection() when connection != null:
return connection(_that);case _NoAdAvailable() when noAdAvailable != null:
return noAdAvailable(_that);case _FailedToLoad() when failedToLoad != null:
return failedToLoad(_that);case _FailedToShow() when failedToShow != null:
return failedToShow(_that);case _Unexpected() when unexpected != null:
return unexpected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  closed,TResult Function( String error)?  connection,TResult Function( String error)?  noAdAvailable,TResult Function( String error)?  failedToLoad,TResult Function( String error)?  failedToShow,TResult Function( String error)?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Closed() when closed != null:
return closed();case _Connection() when connection != null:
return connection(_that.error);case _NoAdAvailable() when noAdAvailable != null:
return noAdAvailable(_that.error);case _FailedToLoad() when failedToLoad != null:
return failedToLoad(_that.error);case _FailedToShow() when failedToShow != null:
return failedToShow(_that.error);case _Unexpected() when unexpected != null:
return unexpected(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  closed,required TResult Function( String error)  connection,required TResult Function( String error)  noAdAvailable,required TResult Function( String error)  failedToLoad,required TResult Function( String error)  failedToShow,required TResult Function( String error)  unexpected,}) {final _that = this;
switch (_that) {
case _Closed():
return closed();case _Connection():
return connection(_that.error);case _NoAdAvailable():
return noAdAvailable(_that.error);case _FailedToLoad():
return failedToLoad(_that.error);case _FailedToShow():
return failedToShow(_that.error);case _Unexpected():
return unexpected(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  closed,TResult? Function( String error)?  connection,TResult? Function( String error)?  noAdAvailable,TResult? Function( String error)?  failedToLoad,TResult? Function( String error)?  failedToShow,TResult? Function( String error)?  unexpected,}) {final _that = this;
switch (_that) {
case _Closed() when closed != null:
return closed();case _Connection() when connection != null:
return connection(_that.error);case _NoAdAvailable() when noAdAvailable != null:
return noAdAvailable(_that.error);case _FailedToLoad() when failedToLoad != null:
return failedToLoad(_that.error);case _FailedToShow() when failedToShow != null:
return failedToShow(_that.error);case _Unexpected() when unexpected != null:
return unexpected(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Closed extends AppAdFailure {
  const _Closed(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Closed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppAdFailure.closed()';
}


}




/// @nodoc


class _Connection extends AppAdFailure {
  const _Connection(this.error): super._();
  

 final  String error;

/// Create a copy of AppAdFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionCopyWith<_Connection> get copyWith => __$ConnectionCopyWithImpl<_Connection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connection&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AppAdFailure.connection(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ConnectionCopyWith<$Res> implements $AppAdFailureCopyWith<$Res> {
  factory _$ConnectionCopyWith(_Connection value, $Res Function(_Connection) _then) = __$ConnectionCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$ConnectionCopyWithImpl<$Res>
    implements _$ConnectionCopyWith<$Res> {
  __$ConnectionCopyWithImpl(this._self, this._then);

  final _Connection _self;
  final $Res Function(_Connection) _then;

/// Create a copy of AppAdFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Connection(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NoAdAvailable extends AppAdFailure {
  const _NoAdAvailable(this.error): super._();
  

 final  String error;

/// Create a copy of AppAdFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoAdAvailableCopyWith<_NoAdAvailable> get copyWith => __$NoAdAvailableCopyWithImpl<_NoAdAvailable>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoAdAvailable&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AppAdFailure.noAdAvailable(error: $error)';
}


}

/// @nodoc
abstract mixin class _$NoAdAvailableCopyWith<$Res> implements $AppAdFailureCopyWith<$Res> {
  factory _$NoAdAvailableCopyWith(_NoAdAvailable value, $Res Function(_NoAdAvailable) _then) = __$NoAdAvailableCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$NoAdAvailableCopyWithImpl<$Res>
    implements _$NoAdAvailableCopyWith<$Res> {
  __$NoAdAvailableCopyWithImpl(this._self, this._then);

  final _NoAdAvailable _self;
  final $Res Function(_NoAdAvailable) _then;

/// Create a copy of AppAdFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_NoAdAvailable(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FailedToLoad extends AppAdFailure {
  const _FailedToLoad(this.error): super._();
  

 final  String error;

/// Create a copy of AppAdFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailedToLoadCopyWith<_FailedToLoad> get copyWith => __$FailedToLoadCopyWithImpl<_FailedToLoad>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailedToLoad&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AppAdFailure.failedToLoad(error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailedToLoadCopyWith<$Res> implements $AppAdFailureCopyWith<$Res> {
  factory _$FailedToLoadCopyWith(_FailedToLoad value, $Res Function(_FailedToLoad) _then) = __$FailedToLoadCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$FailedToLoadCopyWithImpl<$Res>
    implements _$FailedToLoadCopyWith<$Res> {
  __$FailedToLoadCopyWithImpl(this._self, this._then);

  final _FailedToLoad _self;
  final $Res Function(_FailedToLoad) _then;

/// Create a copy of AppAdFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_FailedToLoad(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FailedToShow extends AppAdFailure {
  const _FailedToShow(this.error): super._();
  

 final  String error;

/// Create a copy of AppAdFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailedToShowCopyWith<_FailedToShow> get copyWith => __$FailedToShowCopyWithImpl<_FailedToShow>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FailedToShow&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AppAdFailure.failedToShow(error: $error)';
}


}

/// @nodoc
abstract mixin class _$FailedToShowCopyWith<$Res> implements $AppAdFailureCopyWith<$Res> {
  factory _$FailedToShowCopyWith(_FailedToShow value, $Res Function(_FailedToShow) _then) = __$FailedToShowCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$FailedToShowCopyWithImpl<$Res>
    implements _$FailedToShowCopyWith<$Res> {
  __$FailedToShowCopyWithImpl(this._self, this._then);

  final _FailedToShow _self;
  final $Res Function(_FailedToShow) _then;

/// Create a copy of AppAdFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_FailedToShow(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unexpected extends AppAdFailure {
  const _Unexpected(this.error): super._();
  

 final  String error;

/// Create a copy of AppAdFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnexpectedCopyWith<_Unexpected> get copyWith => __$UnexpectedCopyWithImpl<_Unexpected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unexpected&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AppAdFailure.unexpected(error: $error)';
}


}

/// @nodoc
abstract mixin class _$UnexpectedCopyWith<$Res> implements $AppAdFailureCopyWith<$Res> {
  factory _$UnexpectedCopyWith(_Unexpected value, $Res Function(_Unexpected) _then) = __$UnexpectedCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$UnexpectedCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(this._self, this._then);

  final _Unexpected _self;
  final $Res Function(_Unexpected) _then;

/// Create a copy of AppAdFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Unexpected(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
