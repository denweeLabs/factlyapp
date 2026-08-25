// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeviceInfo {

 String get deviceModel; String get operatingSystem; String get operatingSystemVersion; String get osVersionValue; int? get androidSdkInt; AppInfo get appInfo; String? get deviceId;
/// Create a copy of DeviceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceInfoCopyWith<DeviceInfo> get copyWith => _$DeviceInfoCopyWithImpl<DeviceInfo>(this as DeviceInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceInfo&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.operatingSystem, operatingSystem) || other.operatingSystem == operatingSystem)&&(identical(other.operatingSystemVersion, operatingSystemVersion) || other.operatingSystemVersion == operatingSystemVersion)&&(identical(other.osVersionValue, osVersionValue) || other.osVersionValue == osVersionValue)&&(identical(other.androidSdkInt, androidSdkInt) || other.androidSdkInt == androidSdkInt)&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}


@override
int get hashCode => Object.hash(runtimeType,deviceModel,operatingSystem,operatingSystemVersion,osVersionValue,androidSdkInt,appInfo,deviceId);

@override
String toString() {
  return 'DeviceInfo(deviceModel: $deviceModel, operatingSystem: $operatingSystem, operatingSystemVersion: $operatingSystemVersion, osVersionValue: $osVersionValue, androidSdkInt: $androidSdkInt, appInfo: $appInfo, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $DeviceInfoCopyWith<$Res>  {
  factory $DeviceInfoCopyWith(DeviceInfo value, $Res Function(DeviceInfo) _then) = _$DeviceInfoCopyWithImpl;
@useResult
$Res call({
 String deviceModel, String operatingSystem, String operatingSystemVersion, String osVersionValue, int? androidSdkInt, AppInfo appInfo, String? deviceId
});


$AppInfoCopyWith<$Res> get appInfo;

}
/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._self, this._then);

  final DeviceInfo _self;
  final $Res Function(DeviceInfo) _then;

/// Create a copy of DeviceInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceModel = null,Object? operatingSystem = null,Object? operatingSystemVersion = null,Object? osVersionValue = null,Object? androidSdkInt = freezed,Object? appInfo = null,Object? deviceId = freezed,}) {
  return _then(_self.copyWith(
deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,operatingSystem: null == operatingSystem ? _self.operatingSystem : operatingSystem // ignore: cast_nullable_to_non_nullable
as String,operatingSystemVersion: null == operatingSystemVersion ? _self.operatingSystemVersion : operatingSystemVersion // ignore: cast_nullable_to_non_nullable
as String,osVersionValue: null == osVersionValue ? _self.osVersionValue : osVersionValue // ignore: cast_nullable_to_non_nullable
as String,androidSdkInt: freezed == androidSdkInt ? _self.androidSdkInt : androidSdkInt // ignore: cast_nullable_to_non_nullable
as int?,appInfo: null == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as AppInfo,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of DeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoCopyWith<$Res> get appInfo {
  
  return $AppInfoCopyWith<$Res>(_self.appInfo, (value) {
    return _then(_self.copyWith(appInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeviceInfo].
extension DeviceInfoPatterns on DeviceInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceInfo value)  $default,){
final _that = this;
switch (_that) {
case _DeviceInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceModel,  String operatingSystem,  String operatingSystemVersion,  String osVersionValue,  int? androidSdkInt,  AppInfo appInfo,  String? deviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceInfo() when $default != null:
return $default(_that.deviceModel,_that.operatingSystem,_that.operatingSystemVersion,_that.osVersionValue,_that.androidSdkInt,_that.appInfo,_that.deviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceModel,  String operatingSystem,  String operatingSystemVersion,  String osVersionValue,  int? androidSdkInt,  AppInfo appInfo,  String? deviceId)  $default,) {final _that = this;
switch (_that) {
case _DeviceInfo():
return $default(_that.deviceModel,_that.operatingSystem,_that.operatingSystemVersion,_that.osVersionValue,_that.androidSdkInt,_that.appInfo,_that.deviceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceModel,  String operatingSystem,  String operatingSystemVersion,  String osVersionValue,  int? androidSdkInt,  AppInfo appInfo,  String? deviceId)?  $default,) {final _that = this;
switch (_that) {
case _DeviceInfo() when $default != null:
return $default(_that.deviceModel,_that.operatingSystem,_that.operatingSystemVersion,_that.osVersionValue,_that.androidSdkInt,_that.appInfo,_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceInfo implements DeviceInfo {
  const _DeviceInfo({required this.deviceModel, required this.operatingSystem, required this.operatingSystemVersion, required this.osVersionValue, required this.androidSdkInt, required this.appInfo, required this.deviceId});
  

@override final  String deviceModel;
@override final  String operatingSystem;
@override final  String operatingSystemVersion;
@override final  String osVersionValue;
@override final  int? androidSdkInt;
@override final  AppInfo appInfo;
@override final  String? deviceId;

/// Create a copy of DeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceInfoCopyWith<_DeviceInfo> get copyWith => __$DeviceInfoCopyWithImpl<_DeviceInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceInfo&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.operatingSystem, operatingSystem) || other.operatingSystem == operatingSystem)&&(identical(other.operatingSystemVersion, operatingSystemVersion) || other.operatingSystemVersion == operatingSystemVersion)&&(identical(other.osVersionValue, osVersionValue) || other.osVersionValue == osVersionValue)&&(identical(other.androidSdkInt, androidSdkInt) || other.androidSdkInt == androidSdkInt)&&(identical(other.appInfo, appInfo) || other.appInfo == appInfo)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}


@override
int get hashCode => Object.hash(runtimeType,deviceModel,operatingSystem,operatingSystemVersion,osVersionValue,androidSdkInt,appInfo,deviceId);

@override
String toString() {
  return 'DeviceInfo(deviceModel: $deviceModel, operatingSystem: $operatingSystem, operatingSystemVersion: $operatingSystemVersion, osVersionValue: $osVersionValue, androidSdkInt: $androidSdkInt, appInfo: $appInfo, deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$DeviceInfoCopyWith<$Res> implements $DeviceInfoCopyWith<$Res> {
  factory _$DeviceInfoCopyWith(_DeviceInfo value, $Res Function(_DeviceInfo) _then) = __$DeviceInfoCopyWithImpl;
@override @useResult
$Res call({
 String deviceModel, String operatingSystem, String operatingSystemVersion, String osVersionValue, int? androidSdkInt, AppInfo appInfo, String? deviceId
});


@override $AppInfoCopyWith<$Res> get appInfo;

}
/// @nodoc
class __$DeviceInfoCopyWithImpl<$Res>
    implements _$DeviceInfoCopyWith<$Res> {
  __$DeviceInfoCopyWithImpl(this._self, this._then);

  final _DeviceInfo _self;
  final $Res Function(_DeviceInfo) _then;

/// Create a copy of DeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceModel = null,Object? operatingSystem = null,Object? operatingSystemVersion = null,Object? osVersionValue = null,Object? androidSdkInt = freezed,Object? appInfo = null,Object? deviceId = freezed,}) {
  return _then(_DeviceInfo(
deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,operatingSystem: null == operatingSystem ? _self.operatingSystem : operatingSystem // ignore: cast_nullable_to_non_nullable
as String,operatingSystemVersion: null == operatingSystemVersion ? _self.operatingSystemVersion : operatingSystemVersion // ignore: cast_nullable_to_non_nullable
as String,osVersionValue: null == osVersionValue ? _self.osVersionValue : osVersionValue // ignore: cast_nullable_to_non_nullable
as String,androidSdkInt: freezed == androidSdkInt ? _self.androidSdkInt : androidSdkInt // ignore: cast_nullable_to_non_nullable
as int?,appInfo: null == appInfo ? _self.appInfo : appInfo // ignore: cast_nullable_to_non_nullable
as AppInfo,deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of DeviceInfo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppInfoCopyWith<$Res> get appInfo {
  
  return $AppInfoCopyWith<$Res>(_self.appInfo, (value) {
    return _then(_self.copyWith(appInfo: value));
  });
}
}

/// @nodoc
mixin _$AppInfo {

 String get packageName; String get version; String get buildNumber;
/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppInfoCopyWith<AppInfo> get copyWith => _$AppInfoCopyWithImpl<AppInfo>(this as AppInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,version,buildNumber);



}

/// @nodoc
abstract mixin class $AppInfoCopyWith<$Res>  {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) _then) = _$AppInfoCopyWithImpl;
@useResult
$Res call({
 String packageName, String version, String buildNumber
});




}
/// @nodoc
class _$AppInfoCopyWithImpl<$Res>
    implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._self, this._then);

  final AppInfo _self;
  final $Res Function(AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packageName = null,Object? version = null,Object? buildNumber = null,}) {
  return _then(_self.copyWith(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppInfo].
extension AppInfoPatterns on AppInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppInfo value)  $default,){
final _that = this;
switch (_that) {
case _AppInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppInfo value)?  $default,){
final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String packageName,  String version,  String buildNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.packageName,_that.version,_that.buildNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String packageName,  String version,  String buildNumber)  $default,) {final _that = this;
switch (_that) {
case _AppInfo():
return $default(_that.packageName,_that.version,_that.buildNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String packageName,  String version,  String buildNumber)?  $default,) {final _that = this;
switch (_that) {
case _AppInfo() when $default != null:
return $default(_that.packageName,_that.version,_that.buildNumber);case _:
  return null;

}
}

}

/// @nodoc


class _AppInfo extends AppInfo {
  const _AppInfo({required this.packageName, required this.version, required this.buildNumber}): super._();
  

@override final  String packageName;
@override final  String version;
@override final  String buildNumber;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppInfoCopyWith<_AppInfo> get copyWith => __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppInfo&&(identical(other.packageName, packageName) || other.packageName == packageName)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber));
}


@override
int get hashCode => Object.hash(runtimeType,packageName,version,buildNumber);



}

/// @nodoc
abstract mixin class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) _then) = __$AppInfoCopyWithImpl;
@override @useResult
$Res call({
 String packageName, String version, String buildNumber
});




}
/// @nodoc
class __$AppInfoCopyWithImpl<$Res>
    implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(this._self, this._then);

  final _AppInfo _self;
  final $Res Function(_AppInfo) _then;

/// Create a copy of AppInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packageName = null,Object? version = null,Object? buildNumber = null,}) {
  return _then(_AppInfo(
packageName: null == packageName ? _self.packageName : packageName // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
