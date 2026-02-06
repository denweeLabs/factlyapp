import 'package:denwee/core/auth/domain/entity/email.dart';
import 'package:denwee/core/auth/domain/entity/third_party_login_body.dart';
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

  @JsonKey(name: 'avatar_url') 
  final String? avatarUrl;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(
    name: 'is_anonymous', 
    defaultValue: false,
  )
  final bool isAnonymous;

  @JsonKey(
    name: 'unlocked_background_ids', 
    defaultValue: [],
  )
  final List<int> unlockedBackgrounds;

  @JsonKey(
    name: 'raw_app_meta_data',
    fromJson: _authProviderFromJson,
    toJson: _authProviderToJson,
  )
  final String authProvider;

  const ProfileDto({
    required this.id,
    required this.email,
    required this.name,
    required this.avatarUrl,
    required this.createdAt,
    required this.isAnonymous,
    required this.unlockedBackgrounds,
    required this.authProvider,
  });

  factory ProfileDto.fromDomain(Profile profile) {
    return ProfileDto(
      id: profile.id.value,
      email: profile.email.toNullable()?.value,
      name: profile.name.toNullable()?.value,
      avatarUrl: profile.avatarUrl.toNullable()?.value,
      createdAt: profile.createdAt.toNullable(),
      isAnonymous: profile.isAnonymous,
      unlockedBackgrounds: profile.unlockedBackgrounds.map((e) => e.value).toList(),
      authProvider: profile.authProvider.name,
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
      unlockedBackgrounds: unlockedBackgrounds.map(UniqueId.fromValue).toList(),
      authProvider: AppSupportedAuthProvider.fromString(authProvider),
    );
  }

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}

String _authProviderFromJson(dynamic json) {
  if (json is Map<String, dynamic>) {
    final provider = json['provider'];
    if (provider != null && provider is String && provider.isNotEmpty) {
      return provider;
    }
  }
  return AppSupportedAuthProvider.email.name;
}

Map<String, dynamic> _authProviderToJson(String provider) {
  return {'provider': provider};
}
