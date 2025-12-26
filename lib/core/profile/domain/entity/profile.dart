import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/username.dart';
import 'package:denwee/core/misc/domain/entity/i_entity.dart';
import 'package:denwee/core/network/domain/entity/network_link.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@Freezed(toJson: false, fromJson: false)
abstract class Profile with _$Profile implements IEntity {
  const Profile._();
  const factory Profile({
    required UniqueId id,
    required Option<Email> email,
    required Option<Username> name,
    required Option<NetworkLink> avatarUrl,
    required Option<DateTime> createdAt,
    required bool isAnonymous,
  }) = _Profile;
}
