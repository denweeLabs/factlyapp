// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_list_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArchiveListResultDto _$ArchiveListResultDtoFromJson(
  Map<String, dynamic> json,
) => ArchiveListResultDto(
  items: (json['items'] as List<dynamic>)
      .map((e) => ArchivedFactDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
);

Map<String, dynamic> _$ArchiveListResultDtoToJson(
  ArchiveListResultDto instance,
) => <String, dynamic>{
  'items': instance.items,
  'total': instance.total,
  'page': instance.page,
};
