import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/username.dart';
import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/network/domain/entity/network_link.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class ProfileDto {
  final int id;
  final String? email;
  final String? name;
  @JsonKey(name: 'avatar_url') final String? avatarUrl;
  @JsonKey(name: 'created_at') final DateTime? createdAt;
  @JsonKey(name: 'is_anonymous', defaultValue: false) final bool isAnonymous;

  const ProfileDto({
    required this.id,
    required this.email,
    required this.name,
    required this.avatarUrl,
    required this.createdAt,
    required this.isAnonymous,
  });

  factory ProfileDto.fromDomain(Profile profile) {
    return ProfileDto(
      id: profile.id.value,
      email: profile.email.toNullable()?.value,
      name: profile.name.toNullable()?.value,
      avatarUrl: profile.avatarUrl.toNullable()?.value,
      createdAt: profile.createdAt.toNullable(),
      isAnonymous: profile.isAnonymous,
    );
  }

  Profile toDomain() {
    return Profile(
      id: UniqueId.fromValue(id),
      email: Option.when(
        email != null && email!.isNotEmpty,
        Email.pure(email ?? ''),
      ),
      name: Option.when(
        name != null && name!.isNotEmpty,
        Username.pure(name ?? ''),
      ),
      avatarUrl: Option.when(
        avatarUrl != null && avatarUrl!.isNotEmpty,
        NetworkLink.pure(avatarUrl ?? ''),
      ),
      createdAt: optionOf(createdAt),
      isAnonymous: isAnonymous,
    );
  }

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}
