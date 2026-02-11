import 'package:denwee/core/misc/domain/entity/unique_id.dart';
import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/profile/domain/entity/profile_failure.dart';
import 'package:denwee/core/profile/domain/repo/profile_repo.dart';
import 'package:denwee/core/profile/domain/use_case/get_profile_use_case.dart';
import 'package:denwee/presentation/shared/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@LazySingleton()
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  final GetProfileUseCase _getProfileUseCase;

  ProfileCubit(this._profileRepo, this._getProfileUseCase)
      : super(_initialState(_profileRepo.getProfileLocal()));

  static ProfileState _initialState(Option<Profile> localProfile) {
    return ProfileState.initial().copyWith(profile: localProfile);
  }

  Future<void> checkProfile() async {
    final failureOrSuccess = await _getProfileUseCase.execute();
    emit(
      failureOrSuccess.fold(
        (failure) => state.copyWith(failure: Some(failure)),
        (success) => state.copyWith(profile: Some(success)),
      ),
    );
  }

  Future<void> updateUnlockedBackgroundIds(List<UniqueId> ids) async {
    var profile = state.profile.toNullable();
    if (profile != null) {
      profile = profile.copyWith(unlockedBackgrounds: ids.toSet());
      return emitPreserveProfile(profile);
    }
  }

  void raiseFailure(ProfileFailure failure) {
    emit(state.copyWith(failure: Some(failure)));
  }

  Future<void> emitPreserveProfile(Profile data) async {
    emit(state.copyWith(profile: Some(data)));
    await _profileRepo.storeProfileLocal(data);
  }

  void clearState() {
    emit(ProfileState.initial());
  }
}
