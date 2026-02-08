// ignore_for_file: unused_field

import 'package:denwee/core/profile/domain/entity/profile.dart';
import 'package:denwee/core/profile/domain/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  final ProfileRepo _profileRepo;

  AuthCubit(this._profileRepo) : super(_initialState(_profileRepo.getProfileLocal()));

  static AuthState _initialState(Option<Profile> localProfile) {
    final nullableProfile = localProfile.toNullable();

    if (nullableProfile != null) {
      return nullableProfile.isAnonymous
          ? const AuthState.anonymous()
          : const AuthState.authenticated();
    }
    return const AuthState.unauthenticated();
  }

  Future<void> setAuthenticated() async {
    emit(const AuthState.authenticated());
  }

  Future<void> setUnauthenticated() async {
    emit(const AuthState.unauthenticated());
  }

  Future<void> setAnonymous() async {
    emit(const AuthState.anonymous());
  }
}
