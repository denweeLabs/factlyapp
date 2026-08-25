// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_fact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyFact {

 UniqueId get id; UserInterest get interest; String get content; String get title; Locale get language; Option<String> get source; Option<DateTime> get date; Option<String> get region; Option<List<String>> get relatedTopics;
/// Create a copy of DailyFact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyFactCopyWith<DailyFact> get copyWith => _$DailyFactCopyWithImpl<DailyFact>(this as DailyFact, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyFact&&(identical(other.id, id) || other.id == id)&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.content, content) || other.content == content)&&(identical(other.title, title) || other.title == title)&&(identical(other.language, language) || other.language == language)&&(identical(other.source, source) || other.source == source)&&(identical(other.date, date) || other.date == date)&&(identical(other.region, region) || other.region == region)&&(identical(other.relatedTopics, relatedTopics) || other.relatedTopics == relatedTopics));
}


@override
int get hashCode => Object.hash(runtimeType,id,interest,content,title,language,source,date,region,relatedTopics);

@override
String toString() {
  return 'DailyFact(id: $id, interest: $interest, content: $content, title: $title, language: $language, source: $source, date: $date, region: $region, relatedTopics: $relatedTopics)';
}


}

/// @nodoc
abstract mixin class $DailyFactCopyWith<$Res>  {
  factory $DailyFactCopyWith(DailyFact value, $Res Function(DailyFact) _then) = _$DailyFactCopyWithImpl;
@useResult
$Res call({
 UniqueId id, UserInterest interest, String content, String title, Locale language, Option<String> source, Option<DateTime> date, Option<String> region, Option<List<String>> relatedTopics
});


$UserInterestCopyWith<$Res> get interest;

}
/// @nodoc
class _$DailyFactCopyWithImpl<$Res>
    implements $DailyFactCopyWith<$Res> {
  _$DailyFactCopyWithImpl(this._self, this._then);

  final DailyFact _self;
  final $Res Function(DailyFact) _then;

/// Create a copy of DailyFact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? interest = null,Object? content = null,Object? title = null,Object? language = null,Object? source = null,Object? date = null,Object? region = null,Object? relatedTopics = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as UserInterest,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Locale,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Option<String>,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as Option<String>,relatedTopics: null == relatedTopics ? _self.relatedTopics : relatedTopics // ignore: cast_nullable_to_non_nullable
as Option<List<String>>,
  ));
}
/// Create a copy of DailyFact
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInterestCopyWith<$Res> get interest {
  
  return $UserInterestCopyWith<$Res>(_self.interest, (value) {
    return _then(_self.copyWith(interest: value));
  });
}
}


/// Adds pattern-matching-related methods to [DailyFact].
extension DailyFactPatterns on DailyFact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyFact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyFact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyFact value)  $default,){
final _that = this;
switch (_that) {
case _DailyFact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyFact value)?  $default,){
final _that = this;
switch (_that) {
case _DailyFact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UniqueId id,  UserInterest interest,  String content,  String title,  Locale language,  Option<String> source,  Option<DateTime> date,  Option<String> region,  Option<List<String>> relatedTopics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyFact() when $default != null:
return $default(_that.id,_that.interest,_that.content,_that.title,_that.language,_that.source,_that.date,_that.region,_that.relatedTopics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UniqueId id,  UserInterest interest,  String content,  String title,  Locale language,  Option<String> source,  Option<DateTime> date,  Option<String> region,  Option<List<String>> relatedTopics)  $default,) {final _that = this;
switch (_that) {
case _DailyFact():
return $default(_that.id,_that.interest,_that.content,_that.title,_that.language,_that.source,_that.date,_that.region,_that.relatedTopics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UniqueId id,  UserInterest interest,  String content,  String title,  Locale language,  Option<String> source,  Option<DateTime> date,  Option<String> region,  Option<List<String>> relatedTopics)?  $default,) {final _that = this;
switch (_that) {
case _DailyFact() when $default != null:
return $default(_that.id,_that.interest,_that.content,_that.title,_that.language,_that.source,_that.date,_that.region,_that.relatedTopics);case _:
  return null;

}
}

}

/// @nodoc


class _DailyFact extends DailyFact {
  const _DailyFact({required this.id, required this.interest, required this.content, required this.title, required this.language, required this.source, required this.date, required this.region, required this.relatedTopics}): super._();
  

@override final  UniqueId id;
@override final  UserInterest interest;
@override final  String content;
@override final  String title;
@override final  Locale language;
@override final  Option<String> source;
@override final  Option<DateTime> date;
@override final  Option<String> region;
@override final  Option<List<String>> relatedTopics;

/// Create a copy of DailyFact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyFactCopyWith<_DailyFact> get copyWith => __$DailyFactCopyWithImpl<_DailyFact>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyFact&&(identical(other.id, id) || other.id == id)&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.content, content) || other.content == content)&&(identical(other.title, title) || other.title == title)&&(identical(other.language, language) || other.language == language)&&(identical(other.source, source) || other.source == source)&&(identical(other.date, date) || other.date == date)&&(identical(other.region, region) || other.region == region)&&(identical(other.relatedTopics, relatedTopics) || other.relatedTopics == relatedTopics));
}


@override
int get hashCode => Object.hash(runtimeType,id,interest,content,title,language,source,date,region,relatedTopics);

@override
String toString() {
  return 'DailyFact(id: $id, interest: $interest, content: $content, title: $title, language: $language, source: $source, date: $date, region: $region, relatedTopics: $relatedTopics)';
}


}

/// @nodoc
abstract mixin class _$DailyFactCopyWith<$Res> implements $DailyFactCopyWith<$Res> {
  factory _$DailyFactCopyWith(_DailyFact value, $Res Function(_DailyFact) _then) = __$DailyFactCopyWithImpl;
@override @useResult
$Res call({
 UniqueId id, UserInterest interest, String content, String title, Locale language, Option<String> source, Option<DateTime> date, Option<String> region, Option<List<String>> relatedTopics
});


@override $UserInterestCopyWith<$Res> get interest;

}
/// @nodoc
class __$DailyFactCopyWithImpl<$Res>
    implements _$DailyFactCopyWith<$Res> {
  __$DailyFactCopyWithImpl(this._self, this._then);

  final _DailyFact _self;
  final $Res Function(_DailyFact) _then;

/// Create a copy of DailyFact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? interest = null,Object? content = null,Object? title = null,Object? language = null,Object? source = null,Object? date = null,Object? region = null,Object? relatedTopics = null,}) {
  return _then(_DailyFact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UniqueId,interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as UserInterest,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Locale,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Option<String>,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as Option<DateTime>,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as Option<String>,relatedTopics: null == relatedTopics ? _self.relatedTopics : relatedTopics // ignore: cast_nullable_to_non_nullable
as Option<List<String>>,
  ));
}

/// Create a copy of DailyFact
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInterestCopyWith<$Res> get interest {
  
  return $UserInterestCopyWith<$Res>(_self.interest, (value) {
    return _then(_self.copyWith(interest: value));
  });
}
}

// dart format on
