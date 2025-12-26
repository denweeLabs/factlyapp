import 'package:denwee/core/profile/domain/entity/update_profile_body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_body_dto.g.dart';

@JsonSerializable(createFactory: false)
class UpdateProfileBodyDto {
  final String? name;
  final String email;

  const UpdateProfileBodyDto({
    required this.name,
    required this.email,
  });

  factory UpdateProfileBodyDto.fromDomain(UpdateProfileBody domain) {
    return UpdateProfileBodyDto(
      name: domain.name.fold(
        () => null,
        (name) => name.value.isNotEmpty ? name.value : null,
      ),
      email: domain.email.value,
    );
  }

  Map<String, dynamic> toJson() => _$UpdateProfileBodyDtoToJson(this);
}
