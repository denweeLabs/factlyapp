// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPreferences {

 List<UserInterest> get interests; Locale get language; NotificationsPreferences get notifications; BackgroundPreferences get background; ThemePreferences get theme; MiscPreferences get misc;
/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<UserPreferences> get copyWith => _$UserPreferencesCopyWithImpl<UserPreferences>(this as UserPreferences, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreferences&&const DeepCollectionEquality().equals(other.interests, interests)&&(identical(other.language, language) || other.language == language)&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.background, background) || other.background == background)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.misc, misc) || other.misc == misc));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(interests),language,notifications,background,theme,misc);

@override
String toString() {
  return 'UserPreferences(interests: $interests, language: $language, notifications: $notifications, background: $background, theme: $theme, misc: $misc)';
}


}

/// @nodoc
abstract mixin class $UserPreferencesCopyWith<$Res>  {
  factory $UserPreferencesCopyWith(UserPreferences value, $Res Function(UserPreferences) _then) = _$UserPreferencesCopyWithImpl;
@useResult
$Res call({
 List<UserInterest> interests, Locale language, NotificationsPreferences notifications, BackgroundPreferences background, ThemePreferences theme, MiscPreferences misc
});


$NotificationsPreferencesCopyWith<$Res> get notifications;$BackgroundPreferencesCopyWith<$Res> get background;$ThemePreferencesCopyWith<$Res> get theme;$MiscPreferencesCopyWith<$Res> get misc;

}
/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._self, this._then);

  final UserPreferences _self;
  final $Res Function(UserPreferences) _then;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interests = null,Object? language = null,Object? notifications = null,Object? background = null,Object? theme = null,Object? misc = null,}) {
  return _then(_self.copyWith(
interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<UserInterest>,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Locale,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as NotificationsPreferences,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as BackgroundPreferences,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as ThemePreferences,misc: null == misc ? _self.misc : misc // ignore: cast_nullable_to_non_nullable
as MiscPreferences,
  ));
}
/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationsPreferencesCopyWith<$Res> get notifications {
  
  return $NotificationsPreferencesCopyWith<$Res>(_self.notifications, (value) {
    return _then(_self.copyWith(notifications: value));
  });
}/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundPreferencesCopyWith<$Res> get background {
  
  return $BackgroundPreferencesCopyWith<$Res>(_self.background, (value) {
    return _then(_self.copyWith(background: value));
  });
}/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemePreferencesCopyWith<$Res> get theme {
  
  return $ThemePreferencesCopyWith<$Res>(_self.theme, (value) {
    return _then(_self.copyWith(theme: value));
  });
}/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MiscPreferencesCopyWith<$Res> get misc {
  
  return $MiscPreferencesCopyWith<$Res>(_self.misc, (value) {
    return _then(_self.copyWith(misc: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserPreferences].
extension UserPreferencesPatterns on UserPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreferences value)  $default,){
final _that = this;
switch (_that) {
case _UserPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserInterest> interests,  Locale language,  NotificationsPreferences notifications,  BackgroundPreferences background,  ThemePreferences theme,  MiscPreferences misc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that.interests,_that.language,_that.notifications,_that.background,_that.theme,_that.misc);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserInterest> interests,  Locale language,  NotificationsPreferences notifications,  BackgroundPreferences background,  ThemePreferences theme,  MiscPreferences misc)  $default,) {final _that = this;
switch (_that) {
case _UserPreferences():
return $default(_that.interests,_that.language,_that.notifications,_that.background,_that.theme,_that.misc);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserInterest> interests,  Locale language,  NotificationsPreferences notifications,  BackgroundPreferences background,  ThemePreferences theme,  MiscPreferences misc)?  $default,) {final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that.interests,_that.language,_that.notifications,_that.background,_that.theme,_that.misc);case _:
  return null;

}
}

}

/// @nodoc


class _UserPreferences implements UserPreferences {
  const _UserPreferences({required final  List<UserInterest> interests, required this.language, required this.notifications, required this.background, required this.theme, required this.misc}): _interests = interests;
  

 final  List<UserInterest> _interests;
@override List<UserInterest> get interests {
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interests);
}

@override final  Locale language;
@override final  NotificationsPreferences notifications;
@override final  BackgroundPreferences background;
@override final  ThemePreferences theme;
@override final  MiscPreferences misc;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferencesCopyWith<_UserPreferences> get copyWith => __$UserPreferencesCopyWithImpl<_UserPreferences>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreferences&&const DeepCollectionEquality().equals(other._interests, _interests)&&(identical(other.language, language) || other.language == language)&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.background, background) || other.background == background)&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.misc, misc) || other.misc == misc));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_interests),language,notifications,background,theme,misc);

@override
String toString() {
  return 'UserPreferences(interests: $interests, language: $language, notifications: $notifications, background: $background, theme: $theme, misc: $misc)';
}


}

/// @nodoc
abstract mixin class _$UserPreferencesCopyWith<$Res> implements $UserPreferencesCopyWith<$Res> {
  factory _$UserPreferencesCopyWith(_UserPreferences value, $Res Function(_UserPreferences) _then) = __$UserPreferencesCopyWithImpl;
@override @useResult
$Res call({
 List<UserInterest> interests, Locale language, NotificationsPreferences notifications, BackgroundPreferences background, ThemePreferences theme, MiscPreferences misc
});


@override $NotificationsPreferencesCopyWith<$Res> get notifications;@override $BackgroundPreferencesCopyWith<$Res> get background;@override $ThemePreferencesCopyWith<$Res> get theme;@override $MiscPreferencesCopyWith<$Res> get misc;

}
/// @nodoc
class __$UserPreferencesCopyWithImpl<$Res>
    implements _$UserPreferencesCopyWith<$Res> {
  __$UserPreferencesCopyWithImpl(this._self, this._then);

  final _UserPreferences _self;
  final $Res Function(_UserPreferences) _then;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interests = null,Object? language = null,Object? notifications = null,Object? background = null,Object? theme = null,Object? misc = null,}) {
  return _then(_UserPreferences(
interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<UserInterest>,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as Locale,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as NotificationsPreferences,background: null == background ? _self.background : background // ignore: cast_nullable_to_non_nullable
as BackgroundPreferences,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as ThemePreferences,misc: null == misc ? _self.misc : misc // ignore: cast_nullable_to_non_nullable
as MiscPreferences,
  ));
}

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationsPreferencesCopyWith<$Res> get notifications {
  
  return $NotificationsPreferencesCopyWith<$Res>(_self.notifications, (value) {
    return _then(_self.copyWith(notifications: value));
  });
}/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BackgroundPreferencesCopyWith<$Res> get background {
  
  return $BackgroundPreferencesCopyWith<$Res>(_self.background, (value) {
    return _then(_self.copyWith(background: value));
  });
}/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ThemePreferencesCopyWith<$Res> get theme {
  
  return $ThemePreferencesCopyWith<$Res>(_self.theme, (value) {
    return _then(_self.copyWith(theme: value));
  });
}/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MiscPreferencesCopyWith<$Res> get misc {
  
  return $MiscPreferencesCopyWith<$Res>(_self.misc, (value) {
    return _then(_self.copyWith(misc: value));
  });
}
}

// dart format on
