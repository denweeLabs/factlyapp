// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_packages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PremiumPackages {

 PremiumPackage get weekly; PremiumPackage? get monthly; PremiumPackage get yearly;
/// Create a copy of PremiumPackages
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumPackagesCopyWith<PremiumPackages> get copyWith => _$PremiumPackagesCopyWithImpl<PremiumPackages>(this as PremiumPackages, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumPackages&&(identical(other.weekly, weekly) || other.weekly == weekly)&&(identical(other.monthly, monthly) || other.monthly == monthly)&&(identical(other.yearly, yearly) || other.yearly == yearly));
}


@override
int get hashCode => Object.hash(runtimeType,weekly,monthly,yearly);

@override
String toString() {
  return 'PremiumPackages(weekly: $weekly, monthly: $monthly, yearly: $yearly)';
}


}

/// @nodoc
abstract mixin class $PremiumPackagesCopyWith<$Res>  {
  factory $PremiumPackagesCopyWith(PremiumPackages value, $Res Function(PremiumPackages) _then) = _$PremiumPackagesCopyWithImpl;
@useResult
$Res call({
 PremiumPackage weekly, PremiumPackage? monthly, PremiumPackage yearly
});


$PremiumPackageCopyWith<$Res> get weekly;$PremiumPackageCopyWith<$Res>? get monthly;$PremiumPackageCopyWith<$Res> get yearly;

}
/// @nodoc
class _$PremiumPackagesCopyWithImpl<$Res>
    implements $PremiumPackagesCopyWith<$Res> {
  _$PremiumPackagesCopyWithImpl(this._self, this._then);

  final PremiumPackages _self;
  final $Res Function(PremiumPackages) _then;

/// Create a copy of PremiumPackages
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekly = null,Object? monthly = freezed,Object? yearly = null,}) {
  return _then(_self.copyWith(
weekly: null == weekly ? _self.weekly : weekly // ignore: cast_nullable_to_non_nullable
as PremiumPackage,monthly: freezed == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as PremiumPackage?,yearly: null == yearly ? _self.yearly : yearly // ignore: cast_nullable_to_non_nullable
as PremiumPackage,
  ));
}
/// Create a copy of PremiumPackages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PremiumPackageCopyWith<$Res> get weekly {
  
  return $PremiumPackageCopyWith<$Res>(_self.weekly, (value) {
    return _then(_self.copyWith(weekly: value));
  });
}/// Create a copy of PremiumPackages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PremiumPackageCopyWith<$Res>? get monthly {
    if (_self.monthly == null) {
    return null;
  }

  return $PremiumPackageCopyWith<$Res>(_self.monthly!, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}/// Create a copy of PremiumPackages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PremiumPackageCopyWith<$Res> get yearly {
  
  return $PremiumPackageCopyWith<$Res>(_self.yearly, (value) {
    return _then(_self.copyWith(yearly: value));
  });
}
}


/// Adds pattern-matching-related methods to [PremiumPackages].
extension PremiumPackagesPatterns on PremiumPackages {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PremiumPackages value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PremiumPackages() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PremiumPackages value)  $default,){
final _that = this;
switch (_that) {
case _PremiumPackages():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PremiumPackages value)?  $default,){
final _that = this;
switch (_that) {
case _PremiumPackages() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PremiumPackage weekly,  PremiumPackage? monthly,  PremiumPackage yearly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PremiumPackages() when $default != null:
return $default(_that.weekly,_that.monthly,_that.yearly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PremiumPackage weekly,  PremiumPackage? monthly,  PremiumPackage yearly)  $default,) {final _that = this;
switch (_that) {
case _PremiumPackages():
return $default(_that.weekly,_that.monthly,_that.yearly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PremiumPackage weekly,  PremiumPackage? monthly,  PremiumPackage yearly)?  $default,) {final _that = this;
switch (_that) {
case _PremiumPackages() when $default != null:
return $default(_that.weekly,_that.monthly,_that.yearly);case _:
  return null;

}
}

}

/// @nodoc


class _PremiumPackages extends PremiumPackages {
  const _PremiumPackages({required this.weekly, required this.monthly, required this.yearly}): super._();
  

@override final  PremiumPackage weekly;
@override final  PremiumPackage? monthly;
@override final  PremiumPackage yearly;

/// Create a copy of PremiumPackages
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PremiumPackagesCopyWith<_PremiumPackages> get copyWith => __$PremiumPackagesCopyWithImpl<_PremiumPackages>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PremiumPackages&&(identical(other.weekly, weekly) || other.weekly == weekly)&&(identical(other.monthly, monthly) || other.monthly == monthly)&&(identical(other.yearly, yearly) || other.yearly == yearly));
}


@override
int get hashCode => Object.hash(runtimeType,weekly,monthly,yearly);

@override
String toString() {
  return 'PremiumPackages(weekly: $weekly, monthly: $monthly, yearly: $yearly)';
}


}

/// @nodoc
abstract mixin class _$PremiumPackagesCopyWith<$Res> implements $PremiumPackagesCopyWith<$Res> {
  factory _$PremiumPackagesCopyWith(_PremiumPackages value, $Res Function(_PremiumPackages) _then) = __$PremiumPackagesCopyWithImpl;
@override @useResult
$Res call({
 PremiumPackage weekly, PremiumPackage? monthly, PremiumPackage yearly
});


@override $PremiumPackageCopyWith<$Res> get weekly;@override $PremiumPackageCopyWith<$Res>? get monthly;@override $PremiumPackageCopyWith<$Res> get yearly;

}
/// @nodoc
class __$PremiumPackagesCopyWithImpl<$Res>
    implements _$PremiumPackagesCopyWith<$Res> {
  __$PremiumPackagesCopyWithImpl(this._self, this._then);

  final _PremiumPackages _self;
  final $Res Function(_PremiumPackages) _then;

/// Create a copy of PremiumPackages
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekly = null,Object? monthly = freezed,Object? yearly = null,}) {
  return _then(_PremiumPackages(
weekly: null == weekly ? _self.weekly : weekly // ignore: cast_nullable_to_non_nullable
as PremiumPackage,monthly: freezed == monthly ? _self.monthly : monthly // ignore: cast_nullable_to_non_nullable
as PremiumPackage?,yearly: null == yearly ? _self.yearly : yearly // ignore: cast_nullable_to_non_nullable
as PremiumPackage,
  ));
}

/// Create a copy of PremiumPackages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PremiumPackageCopyWith<$Res> get weekly {
  
  return $PremiumPackageCopyWith<$Res>(_self.weekly, (value) {
    return _then(_self.copyWith(weekly: value));
  });
}/// Create a copy of PremiumPackages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PremiumPackageCopyWith<$Res>? get monthly {
    if (_self.monthly == null) {
    return null;
  }

  return $PremiumPackageCopyWith<$Res>(_self.monthly!, (value) {
    return _then(_self.copyWith(monthly: value));
  });
}/// Create a copy of PremiumPackages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PremiumPackageCopyWith<$Res> get yearly {
  
  return $PremiumPackageCopyWith<$Res>(_self.yearly, (value) {
    return _then(_self.copyWith(yearly: value));
  });
}
}

/// @nodoc
mixin _$PremiumPackage {

 PremiumPackageType get type; Package get data;
/// Create a copy of PremiumPackage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumPackageCopyWith<PremiumPackage> get copyWith => _$PremiumPackageCopyWithImpl<PremiumPackage>(this as PremiumPackage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumPackage&&(identical(other.type, type) || other.type == type)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,type,data);

@override
String toString() {
  return 'PremiumPackage(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class $PremiumPackageCopyWith<$Res>  {
  factory $PremiumPackageCopyWith(PremiumPackage value, $Res Function(PremiumPackage) _then) = _$PremiumPackageCopyWithImpl;
@useResult
$Res call({
 PremiumPackageType type, Package data
});




}
/// @nodoc
class _$PremiumPackageCopyWithImpl<$Res>
    implements $PremiumPackageCopyWith<$Res> {
  _$PremiumPackageCopyWithImpl(this._self, this._then);

  final PremiumPackage _self;
  final $Res Function(PremiumPackage) _then;

/// Create a copy of PremiumPackage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? data = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PremiumPackageType,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Package,
  ));
}

}


/// Adds pattern-matching-related methods to [PremiumPackage].
extension PremiumPackagePatterns on PremiumPackage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PremiumPackage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PremiumPackage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PremiumPackage value)  $default,){
final _that = this;
switch (_that) {
case _PremiumPackage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PremiumPackage value)?  $default,){
final _that = this;
switch (_that) {
case _PremiumPackage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PremiumPackageType type,  Package data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PremiumPackage() when $default != null:
return $default(_that.type,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PremiumPackageType type,  Package data)  $default,) {final _that = this;
switch (_that) {
case _PremiumPackage():
return $default(_that.type,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PremiumPackageType type,  Package data)?  $default,) {final _that = this;
switch (_that) {
case _PremiumPackage() when $default != null:
return $default(_that.type,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _PremiumPackage extends PremiumPackage {
  const _PremiumPackage({required this.type, required this.data}): super._();
  

@override final  PremiumPackageType type;
@override final  Package data;

/// Create a copy of PremiumPackage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PremiumPackageCopyWith<_PremiumPackage> get copyWith => __$PremiumPackageCopyWithImpl<_PremiumPackage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PremiumPackage&&(identical(other.type, type) || other.type == type)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,type,data);

@override
String toString() {
  return 'PremiumPackage(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PremiumPackageCopyWith<$Res> implements $PremiumPackageCopyWith<$Res> {
  factory _$PremiumPackageCopyWith(_PremiumPackage value, $Res Function(_PremiumPackage) _then) = __$PremiumPackageCopyWithImpl;
@override @useResult
$Res call({
 PremiumPackageType type, Package data
});




}
/// @nodoc
class __$PremiumPackageCopyWithImpl<$Res>
    implements _$PremiumPackageCopyWith<$Res> {
  __$PremiumPackageCopyWithImpl(this._self, this._then);

  final _PremiumPackage _self;
  final $Res Function(_PremiumPackage) _then;

/// Create a copy of PremiumPackage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? data = null,}) {
  return _then(_PremiumPackage(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PremiumPackageType,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Package,
  ));
}


}

// dart format on
