// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_language.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppLanguage {

 Locale get locale; String get nativeName; String get englishName;
/// Create a copy of AppLanguage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppLanguageCopyWith<AppLanguage> get copyWith => _$AppLanguageCopyWithImpl<AppLanguage>(this as AppLanguage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLanguage&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.nativeName, nativeName) || other.nativeName == nativeName)&&(identical(other.englishName, englishName) || other.englishName == englishName));
}


@override
int get hashCode => Object.hash(runtimeType,locale,nativeName,englishName);

@override
String toString() {
  return 'AppLanguage(locale: $locale, nativeName: $nativeName, englishName: $englishName)';
}


}

/// @nodoc
abstract mixin class $AppLanguageCopyWith<$Res>  {
  factory $AppLanguageCopyWith(AppLanguage value, $Res Function(AppLanguage) _then) = _$AppLanguageCopyWithImpl;
@useResult
$Res call({
 Locale locale, String nativeName, String englishName
});




}
/// @nodoc
class _$AppLanguageCopyWithImpl<$Res>
    implements $AppLanguageCopyWith<$Res> {
  _$AppLanguageCopyWithImpl(this._self, this._then);

  final AppLanguage _self;
  final $Res Function(AppLanguage) _then;

/// Create a copy of AppLanguage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,Object? nativeName = null,Object? englishName = null,}) {
  return _then(_self.copyWith(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,nativeName: null == nativeName ? _self.nativeName : nativeName // ignore: cast_nullable_to_non_nullable
as String,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppLanguage].
extension AppLanguagePatterns on AppLanguage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppLanguage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppLanguage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppLanguage value)  $default,){
final _that = this;
switch (_that) {
case _AppLanguage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppLanguage value)?  $default,){
final _that = this;
switch (_that) {
case _AppLanguage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Locale locale,  String nativeName,  String englishName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppLanguage() when $default != null:
return $default(_that.locale,_that.nativeName,_that.englishName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Locale locale,  String nativeName,  String englishName)  $default,) {final _that = this;
switch (_that) {
case _AppLanguage():
return $default(_that.locale,_that.nativeName,_that.englishName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Locale locale,  String nativeName,  String englishName)?  $default,) {final _that = this;
switch (_that) {
case _AppLanguage() when $default != null:
return $default(_that.locale,_that.nativeName,_that.englishName);case _:
  return null;

}
}

}

/// @nodoc


class _AppLanguage implements AppLanguage {
  const _AppLanguage({required this.locale, required this.nativeName, required this.englishName});
  

@override final  Locale locale;
@override final  String nativeName;
@override final  String englishName;

/// Create a copy of AppLanguage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppLanguageCopyWith<_AppLanguage> get copyWith => __$AppLanguageCopyWithImpl<_AppLanguage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppLanguage&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.nativeName, nativeName) || other.nativeName == nativeName)&&(identical(other.englishName, englishName) || other.englishName == englishName));
}


@override
int get hashCode => Object.hash(runtimeType,locale,nativeName,englishName);

@override
String toString() {
  return 'AppLanguage(locale: $locale, nativeName: $nativeName, englishName: $englishName)';
}


}

/// @nodoc
abstract mixin class _$AppLanguageCopyWith<$Res> implements $AppLanguageCopyWith<$Res> {
  factory _$AppLanguageCopyWith(_AppLanguage value, $Res Function(_AppLanguage) _then) = __$AppLanguageCopyWithImpl;
@override @useResult
$Res call({
 Locale locale, String nativeName, String englishName
});




}
/// @nodoc
class __$AppLanguageCopyWithImpl<$Res>
    implements _$AppLanguageCopyWith<$Res> {
  __$AppLanguageCopyWithImpl(this._self, this._then);

  final _AppLanguage _self;
  final $Res Function(_AppLanguage) _then;

/// Create a copy of AppLanguage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = null,Object? nativeName = null,Object? englishName = null,}) {
  return _then(_AppLanguage(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,nativeName: null == nativeName ? _self.nativeName : nativeName // ignore: cast_nullable_to_non_nullable
as String,englishName: null == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
