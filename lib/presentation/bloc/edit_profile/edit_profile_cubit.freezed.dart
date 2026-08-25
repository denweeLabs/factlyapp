// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditProfileState {

 Option<Username> get name; Email get email; bool get isNameChanged; bool get isEmailChanged; bool get isSaving; bool get isAccountDeleting; Option<Either<ProfileFailure, Profile>> get saveFailureOrSuccess; Option<Either<CommonApiFailure, Unit>> get accountDeleteFailureOrSuccess;
/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditProfileStateCopyWith<EditProfileState> get copyWith => _$EditProfileStateCopyWithImpl<EditProfileState>(this as EditProfileState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProfileState&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.isNameChanged, isNameChanged) || other.isNameChanged == isNameChanged)&&(identical(other.isEmailChanged, isEmailChanged) || other.isEmailChanged == isEmailChanged)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isAccountDeleting, isAccountDeleting) || other.isAccountDeleting == isAccountDeleting)&&(identical(other.saveFailureOrSuccess, saveFailureOrSuccess) || other.saveFailureOrSuccess == saveFailureOrSuccess)&&(identical(other.accountDeleteFailureOrSuccess, accountDeleteFailureOrSuccess) || other.accountDeleteFailureOrSuccess == accountDeleteFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,isNameChanged,isEmailChanged,isSaving,isAccountDeleting,saveFailureOrSuccess,accountDeleteFailureOrSuccess);

@override
String toString() {
  return 'EditProfileState(name: $name, email: $email, isNameChanged: $isNameChanged, isEmailChanged: $isEmailChanged, isSaving: $isSaving, isAccountDeleting: $isAccountDeleting, saveFailureOrSuccess: $saveFailureOrSuccess, accountDeleteFailureOrSuccess: $accountDeleteFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class $EditProfileStateCopyWith<$Res>  {
  factory $EditProfileStateCopyWith(EditProfileState value, $Res Function(EditProfileState) _then) = _$EditProfileStateCopyWithImpl;
@useResult
$Res call({
 Option<Username> name, Email email, bool isNameChanged, bool isEmailChanged, bool isSaving, bool isAccountDeleting, Option<Either<ProfileFailure, Profile>> saveFailureOrSuccess, Option<Either<CommonApiFailure, Unit>> accountDeleteFailureOrSuccess
});




}
/// @nodoc
class _$EditProfileStateCopyWithImpl<$Res>
    implements $EditProfileStateCopyWith<$Res> {
  _$EditProfileStateCopyWithImpl(this._self, this._then);

  final EditProfileState _self;
  final $Res Function(EditProfileState) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? isNameChanged = null,Object? isEmailChanged = null,Object? isSaving = null,Object? isAccountDeleting = null,Object? saveFailureOrSuccess = null,Object? accountDeleteFailureOrSuccess = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Option<Username>,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,isNameChanged: null == isNameChanged ? _self.isNameChanged : isNameChanged // ignore: cast_nullable_to_non_nullable
as bool,isEmailChanged: null == isEmailChanged ? _self.isEmailChanged : isEmailChanged // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isAccountDeleting: null == isAccountDeleting ? _self.isAccountDeleting : isAccountDeleting // ignore: cast_nullable_to_non_nullable
as bool,saveFailureOrSuccess: null == saveFailureOrSuccess ? _self.saveFailureOrSuccess : saveFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<ProfileFailure, Profile>>,accountDeleteFailureOrSuccess: null == accountDeleteFailureOrSuccess ? _self.accountDeleteFailureOrSuccess : accountDeleteFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<CommonApiFailure, Unit>>,
  ));
}

}


/// Adds pattern-matching-related methods to [EditProfileState].
extension EditProfileStatePatterns on EditProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditProfileState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditProfileState value)  $default,){
final _that = this;
switch (_that) {
case _EditProfileState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditProfileState value)?  $default,){
final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Option<Username> name,  Email email,  bool isNameChanged,  bool isEmailChanged,  bool isSaving,  bool isAccountDeleting,  Option<Either<ProfileFailure, Profile>> saveFailureOrSuccess,  Option<Either<CommonApiFailure, Unit>> accountDeleteFailureOrSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
return $default(_that.name,_that.email,_that.isNameChanged,_that.isEmailChanged,_that.isSaving,_that.isAccountDeleting,_that.saveFailureOrSuccess,_that.accountDeleteFailureOrSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Option<Username> name,  Email email,  bool isNameChanged,  bool isEmailChanged,  bool isSaving,  bool isAccountDeleting,  Option<Either<ProfileFailure, Profile>> saveFailureOrSuccess,  Option<Either<CommonApiFailure, Unit>> accountDeleteFailureOrSuccess)  $default,) {final _that = this;
switch (_that) {
case _EditProfileState():
return $default(_that.name,_that.email,_that.isNameChanged,_that.isEmailChanged,_that.isSaving,_that.isAccountDeleting,_that.saveFailureOrSuccess,_that.accountDeleteFailureOrSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Option<Username> name,  Email email,  bool isNameChanged,  bool isEmailChanged,  bool isSaving,  bool isAccountDeleting,  Option<Either<ProfileFailure, Profile>> saveFailureOrSuccess,  Option<Either<CommonApiFailure, Unit>> accountDeleteFailureOrSuccess)?  $default,) {final _that = this;
switch (_that) {
case _EditProfileState() when $default != null:
return $default(_that.name,_that.email,_that.isNameChanged,_that.isEmailChanged,_that.isSaving,_that.isAccountDeleting,_that.saveFailureOrSuccess,_that.accountDeleteFailureOrSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _EditProfileState extends EditProfileState {
  const _EditProfileState({this.name = const None(), this.email = const Email.pure(), this.isNameChanged = false, this.isEmailChanged = false, this.isSaving = false, this.isAccountDeleting = false, this.saveFailureOrSuccess = const None(), this.accountDeleteFailureOrSuccess = const None()}): super._();
  

@override@JsonKey() final  Option<Username> name;
@override@JsonKey() final  Email email;
@override@JsonKey() final  bool isNameChanged;
@override@JsonKey() final  bool isEmailChanged;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool isAccountDeleting;
@override@JsonKey() final  Option<Either<ProfileFailure, Profile>> saveFailureOrSuccess;
@override@JsonKey() final  Option<Either<CommonApiFailure, Unit>> accountDeleteFailureOrSuccess;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditProfileStateCopyWith<_EditProfileState> get copyWith => __$EditProfileStateCopyWithImpl<_EditProfileState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditProfileState&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.isNameChanged, isNameChanged) || other.isNameChanged == isNameChanged)&&(identical(other.isEmailChanged, isEmailChanged) || other.isEmailChanged == isEmailChanged)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.isAccountDeleting, isAccountDeleting) || other.isAccountDeleting == isAccountDeleting)&&(identical(other.saveFailureOrSuccess, saveFailureOrSuccess) || other.saveFailureOrSuccess == saveFailureOrSuccess)&&(identical(other.accountDeleteFailureOrSuccess, accountDeleteFailureOrSuccess) || other.accountDeleteFailureOrSuccess == accountDeleteFailureOrSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,name,email,isNameChanged,isEmailChanged,isSaving,isAccountDeleting,saveFailureOrSuccess,accountDeleteFailureOrSuccess);

@override
String toString() {
  return 'EditProfileState(name: $name, email: $email, isNameChanged: $isNameChanged, isEmailChanged: $isEmailChanged, isSaving: $isSaving, isAccountDeleting: $isAccountDeleting, saveFailureOrSuccess: $saveFailureOrSuccess, accountDeleteFailureOrSuccess: $accountDeleteFailureOrSuccess)';
}


}

/// @nodoc
abstract mixin class _$EditProfileStateCopyWith<$Res> implements $EditProfileStateCopyWith<$Res> {
  factory _$EditProfileStateCopyWith(_EditProfileState value, $Res Function(_EditProfileState) _then) = __$EditProfileStateCopyWithImpl;
@override @useResult
$Res call({
 Option<Username> name, Email email, bool isNameChanged, bool isEmailChanged, bool isSaving, bool isAccountDeleting, Option<Either<ProfileFailure, Profile>> saveFailureOrSuccess, Option<Either<CommonApiFailure, Unit>> accountDeleteFailureOrSuccess
});




}
/// @nodoc
class __$EditProfileStateCopyWithImpl<$Res>
    implements _$EditProfileStateCopyWith<$Res> {
  __$EditProfileStateCopyWithImpl(this._self, this._then);

  final _EditProfileState _self;
  final $Res Function(_EditProfileState) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? isNameChanged = null,Object? isEmailChanged = null,Object? isSaving = null,Object? isAccountDeleting = null,Object? saveFailureOrSuccess = null,Object? accountDeleteFailureOrSuccess = null,}) {
  return _then(_EditProfileState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Option<Username>,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as Email,isNameChanged: null == isNameChanged ? _self.isNameChanged : isNameChanged // ignore: cast_nullable_to_non_nullable
as bool,isEmailChanged: null == isEmailChanged ? _self.isEmailChanged : isEmailChanged // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,isAccountDeleting: null == isAccountDeleting ? _self.isAccountDeleting : isAccountDeleting // ignore: cast_nullable_to_non_nullable
as bool,saveFailureOrSuccess: null == saveFailureOrSuccess ? _self.saveFailureOrSuccess : saveFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<ProfileFailure, Profile>>,accountDeleteFailureOrSuccess: null == accountDeleteFailureOrSuccess ? _self.accountDeleteFailureOrSuccess : accountDeleteFailureOrSuccess // ignore: cast_nullable_to_non_nullable
as Option<Either<CommonApiFailure, Unit>>,
  ));
}


}

// dart format on
