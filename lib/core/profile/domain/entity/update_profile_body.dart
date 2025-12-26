import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/username.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_body.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class UpdateProfileBody with _$UpdateProfileBody {
  const factory UpdateProfileBody({
    required Option<Username> name,
    required Email email,
  }) = _UpdateProfileBody;
}
