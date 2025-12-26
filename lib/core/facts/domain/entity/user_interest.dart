import 'package:denwee/core/misc/domain/entity/i_entity.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/ui/constants/app/user_interests.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_interest.freezed.dart';

@freezed
abstract class UserInterest with _$UserInterest implements IEntity {
  const UserInterest._();
  const factory UserInterest({
    required UniqueId id,
    required String englishName,
  }) = _UserInterest;

  bool get isHistory => id.value == UserInterests.historyId;
}

extension ListOfUserInterestX on List<UserInterest> {
  List<String> get ids => map((interest) => interest.id.stringValue).toList();
}
