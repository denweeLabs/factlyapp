import 'dart:async';

import 'package:denwee/core/network/domain/repo/connectivity_repo.dart';
import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'connectivity_state.dart';
part 'connectivity_cubit.freezed.dart';

@LazySingleton()
class ConnectivityCubit extends Cubit<ConnectivityState> {
  final ConnectivityRepo _connectivityRepo;

  StreamSubscription<ConnectivityResult>? _radioSubscription;

  ConnectivityCubit(this._connectivityRepo)
    : super(ConnectivityState.initialState()) {
    _radioSubscription = _connectivityRepo.connectivityState().listen(_onRadioChanged);
  }

  Future<void> _onRadioChanged(ConnectivityResult event) async {
    if (state.connectivityState != event) {
      debugPrint('ConnectivityCubit radioChanged: $event');
      emit(state.copyWith(connectivityState: event));
    }
  }

  @override
  Future<void> close() async {
    _radioSubscription?.cancel();
    super.close();
  }
}
