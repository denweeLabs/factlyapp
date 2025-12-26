import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/network/domain/entity/network_link.dart';
import 'package:denwee/core/ui/constants/formatters/common_formatters.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_fact_dto.g.dart';

@JsonSerializable(includeIfNull: false)
@immutable
class DailyFactDto {
  static const naValue = 'N/A';
  
  final int id;
  final String title;
  final String content;
  final String? source;
  @JsonKey(name: 'language_code') final String language;
  @JsonKey(name: 'interest_id') final int interestId;
  @JsonKey(name: 'historical_date') final String? historicalDate;
  @JsonKey(name: 'fact_region') final String? factRegion;
  @JsonKey(name: 'related_topics') final List<String>? relatedTopics;

  const DailyFactDto({
    required this.id,
    required this.content,
    required this.source,
    required this.language,
    required this.interestId,
    required this.title,
    required this.historicalDate,
    required this.factRegion,
    required this.relatedTopics,
  });

  factory DailyFactDto.fromDomain(DailyFact domain) {
    return DailyFactDto(
      id: domain.id.value,
      interestId: domain.interest.id.value,
      content: domain.content,
      title: domain.title,
      language: domain.language.toString(),
      source: domain.source.toNullable()?.value,
      historicalDate: domain.date.fold(() => null, (date) => yyyy_MM_dd.format(date)),
      factRegion: domain.region.toNullable(),
      relatedTopics: domain.relatedTopics.toNullable(),
    );
  }

  DailyFact toDomain() {
    return DailyFact(
      id: UniqueId.fromValue(id),
      interest: UserInterests.list.firstWhere((e) => e.id.value == interestId),
      content: content,
      title: title,
      language: Locale(language),
      source: _validateSource(source),
      date: _validateDate(historicalDate),
      region: _validateRegion(factRegion),
      relatedTopics: optionOf(relatedTopics),
    );
  }

  factory DailyFactDto.fromJson(Map<String, dynamic> json) =>
      _$DailyFactDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DailyFactDtoToJson(this);

  static Option<NetworkLink> _validateSource(String? string) {
    final value = _filterRawString(string);
    if (value == null) return const None();
    return Some(NetworkLink.pure(value));
  }

  static Option<DateTime> _validateDate(String? string) {
    final value = _filterRawString(string);
    final parsedDate = value != null ? yyyy_MM_dd.tryParse(value) : null;
    if (parsedDate == null) return const None();
    return Some(parsedDate);
  }

  static Option<String> _validateRegion(String? string) {
    final value = _filterRawString(string);
    return optionOf(value);
  }

  static String? _filterRawString(String? string) {
    final value = string?.trim();
    if (value == null ||
        value.toLowerCase() == 'null' ||
        value.startsWith('/') ||
        value.toLowerCase() == DailyFactDto.naValue.toLowerCase()) {
      return null;
    }
    return value;
  }
}
