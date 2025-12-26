import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/profile/domain/failure/profile_failure.dart';
import 'package:denwee/core/profile/domain/repo/profile_repo.dart';
import 'package:denwee/localization/locale_keys.g.dart';
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

  ProfileCubit(this._profileRepo)
      : super(_initialState(_profileRepo.getProfileLocal()));

  static ProfileState _initialState(Option<Profile> localProfile) {
    return ProfileState.initial().copyWith(profile: localProfile);
  }

  Future<void> checkProfile() async {
    final failureOrSuccess = await _profileRepo.getProfileRemote();
    failureOrSuccess.fold(
      (failure) => emit(state.copyWith(failure: Some(failure))),
      (profile) => emitPreserveProfile(profile),
    );
  }

  Future<void> emitPreserveProfile(Profile data) async {
    emit(state.copyWith(profile: Some(data)));
    await _profileRepo.storeProfileLocal(data);
  }

  void clearState() {
    emit(ProfileState.initial());
  }
}
