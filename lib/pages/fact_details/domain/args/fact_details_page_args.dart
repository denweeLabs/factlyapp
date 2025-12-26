import 'package:denwee/core/facts/data/model/daily_fact_dto.dart';
import 'package:denwee/core/facts/domain/entity/daily_fact.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fact_details_page_args.g.dart';

@JsonSerializable()
class FactDetailsPageArgs {
  @JsonKey(toJson: _toJson, fromJson: _fromJson)
  final DailyFact fact;

  const FactDetailsPageArgs({
    required this.fact,
  });

  factory FactDetailsPageArgs.fromJson(Map<String, dynamic> json) =>
      _$FactDetailsPageArgsFromJson(json);

  Map<String, dynamic> toJson() => _$FactDetailsPageArgsToJson(this);
}

Map<String, dynamic> _toJson(DailyFact fact) =>
    DailyFactDto.fromDomain(fact).toJson();
DailyFact _fromJson(Map<String, dynamic> json) =>
    DailyFactDto.fromJson(json).toDomain();
