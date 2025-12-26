import 'package:denwee/core/auth/domain/entity/password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_body.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class ResetPasswordBody with _$ResetPasswordBody {
  const factory ResetPasswordBody({
    required String accessToken,
    required Password newPassword,
  }) = _ResetPasswordBody;
}
