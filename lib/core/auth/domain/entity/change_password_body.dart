import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_body.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class ChangePasswordBody with _$ChangePasswordBody {
  const factory ChangePasswordBody({
    required Password oldPassword,
    required Password newPassword,
  }) = _ChangePasswordBody;
}
