import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserInterests {
  static const historyId = 1;
  static const scienceId = 2;
  static const spaceId = 3;
  static const natureId = 4;
  static const societyId = 5;
  static const humanBodyId = 6;
  static const artId = 7;
  static const moviesMusicId = 8;
  static const mindId = 9;
  static const foodId = 10;
  static const randomCuriositiesId = 11;
  static const technologyId = 12;
  static const moneyId = 13;
  static const habitsId = 14;

  static final list = <UserInterest>[
    UserInterest(id: UniqueId.fromValue(mindId), englishName: 'Mind'),
    UserInterest(id: UniqueId.fromValue(moneyId), englishName: 'Money'),
    UserInterest(id: UniqueId.fromValue(habitsId), englishName: 'Habits'),
    UserInterest(id: UniqueId.fromValue(scienceId), englishName: 'Science'),
    UserInterest(id: UniqueId.fromValue(spaceId), englishName: 'Space'),
    UserInterest(id: UniqueId.fromValue(societyId), englishName: 'Society'),
    UserInterest(id: UniqueId.fromValue(historyId), englishName: 'History'),
    UserInterest(id: UniqueId.fromValue(humanBodyId), englishName: 'Human Body'),
    UserInterest(id: UniqueId.fromValue(technologyId), englishName: 'Technology'),
    UserInterest(id: UniqueId.fromValue(moviesMusicId), englishName: 'Movies & Music'),
    UserInterest(id: UniqueId.fromValue(artId), englishName: 'Art'),
    UserInterest(id: UniqueId.fromValue(foodId), englishName: 'Food'),
    UserInterest(id: UniqueId.fromValue(natureId), englishName: 'Nature'),
    UserInterest(id: UniqueId.fromValue(randomCuriositiesId), englishName: 'Random Facts'),
  ];
}

extension UserInterestsX on UserInterest {
  String? tryTranslate(BuildContext context) {
    switch (id.value) {
      case UserInterests.historyId: return context.tr(LocaleKeys.user_interest_history);
      case UserInterests.scienceId: return context.tr(LocaleKeys.user_interest_science);
      case UserInterests.spaceId: return context.tr(LocaleKeys.user_interest_space);
      case UserInterests.natureId: return context.tr(LocaleKeys.user_interest_nature);
      case UserInterests.societyId: return context.tr(LocaleKeys.user_interest_society);
      case UserInterests.humanBodyId: return context.tr(LocaleKeys.user_interest_human_body);
      case UserInterests.artId: return context.tr(LocaleKeys.user_interest_art);
      case UserInterests.moviesMusicId: return context.tr(LocaleKeys.user_interest_movies_music);
      case UserInterests.mindId: return context.tr(LocaleKeys.user_interest_mind);
      case UserInterests.foodId: return context.tr(LocaleKeys.user_interest_food);
      case UserInterests.randomCuriositiesId: return context.tr(LocaleKeys.user_interest_random_curiosities);
      case UserInterests.technologyId: return context.tr(LocaleKeys.user_interest_technology);
      case UserInterests.moneyId: return context.tr(LocaleKeys.user_interest_money);
      case UserInterests.habitsId: return context.tr(LocaleKeys.user_interest_habits);
    }

    return null;
  }

  String? get emoji {
    switch (id.value) {
      case UserInterests.historyId: return "📜";
      case UserInterests.scienceId: return "🔬";
      case UserInterests.spaceId: return "🚀";
      case UserInterests.natureId: return "🌿";
      case UserInterests.societyId: return "🌍";
      case UserInterests.humanBodyId: return "💪🏼";
      case UserInterests.artId: return "🎨";
      case UserInterests.moviesMusicId: return "🎬";
      case UserInterests.mindId: return "🧠";
      case UserInterests.foodId: return "🍽️";
      case UserInterests.technologyId: return "💡";
      case UserInterests.moneyId: return "💵";
      case UserInterests.habitsId: return "⏳";
      case UserInterests.randomCuriositiesId: return "❓";
    }

    return null;
  }
}

extension UserInterestsOrderX on UserInterests {
  static final Map<int, int> orderIndex = {
    for (var i = 0; i < UserInterests.list.length; i++)
      UserInterests.list[i].id.value: i,
  };
}