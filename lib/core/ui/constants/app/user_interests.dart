import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// E.g prompt to generate history image
// Realistic image of ancient historical landmarks like the Colosseum, pyramids, with warm golden tones and a soft vintage filter. No text. Ideal for mobile app small enlonged card element. Resolution: 1024 × 1536

class UserInterests {
  static const historyId = 1;
  static const techAndScienceId = 2;
  static const spaceId = 3;
  static const natureAnimalsId = 4;
  static const geographyId = 5;
  static const healthWellnessId = 6;
  static const artCultureId = 7;
  static const moviesMusicId = 8;
  static const psychologyId = 9;
  static const foodCookingId = 10;
  static const randomCuriositiesId = 11;

  static final list = <UserInterest>[
    UserInterest(id: UniqueId.fromValue(historyId), englishName: 'History'),
    UserInterest(id: UniqueId.fromValue(techAndScienceId), englishName: 'Science'),
    UserInterest(id: UniqueId.fromValue(spaceId), englishName: 'Space'),
    UserInterest(id: UniqueId.fromValue(moviesMusicId), englishName: 'Movies & Music'),
    UserInterest(id: UniqueId.fromValue(artCultureId), englishName: 'Art & Culture'),
    UserInterest(id: UniqueId.fromValue(geographyId), englishName: 'Geography'),
    UserInterest(id: UniqueId.fromValue(natureAnimalsId), englishName: 'Nature & Animals'),
    UserInterest(id: UniqueId.fromValue(healthWellnessId), englishName: 'Health & Wellness'),
    UserInterest(id: UniqueId.fromValue(psychologyId), englishName: 'Psychology'),
    UserInterest(id: UniqueId.fromValue(foodCookingId), englishName: 'Food & Cooking'),
    UserInterest(id: UniqueId.fromValue(randomCuriositiesId), englishName: 'Random Curiosities'),
  ];
}

extension UserInterestsX on UserInterest {
  String? tryTranslate(BuildContext context) {
    switch (id.value) {
      case UserInterests.historyId: return context.tr(LocaleKeys.user_interest_history);
      case UserInterests.techAndScienceId: return context.tr(LocaleKeys.user_interest_tech_and_science);
      case UserInterests.spaceId: return context.tr(LocaleKeys.user_interest_space);
      case UserInterests.natureAnimalsId: return context.tr(LocaleKeys.user_interest_nature_animals);
      case UserInterests.geographyId: return context.tr(LocaleKeys.user_interest_geography);
      case UserInterests.healthWellnessId: return context.tr(LocaleKeys.user_interest_health_wellness);
      case UserInterests.artCultureId: return context.tr(LocaleKeys.user_interest_art_culture);
      case UserInterests.moviesMusicId: return context.tr(LocaleKeys.user_interest_movies_music);
      case UserInterests.psychologyId: return context.tr(LocaleKeys.user_interest_psychology);
      case UserInterests.foodCookingId: return context.tr(LocaleKeys.user_interest_food_cooking);
      case UserInterests.randomCuriositiesId: return context.tr(LocaleKeys.user_interest_random_curiosities);
    }

    return null;
  }

  String? emoji(BuildContext context) {
    switch (id.value) {
      case UserInterests.historyId: return "📜";
      case UserInterests.techAndScienceId: return "🔬";
      case UserInterests.spaceId: return "🚀";
      case UserInterests.natureAnimalsId: return "🌿";
      case UserInterests.geographyId: return "🌍";
      case UserInterests.healthWellnessId: return "💪";
      case UserInterests.artCultureId: return "🎨";
      case UserInterests.moviesMusicId: return "🎬";
      case UserInterests.psychologyId: return "🧠";
      case UserInterests.foodCookingId: return "🍳";
      case UserInterests.randomCuriositiesId: return "❓";
    }

    return null;
  }
}
