import 'package:denwee/pages/authentication/args/authentication_action_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_page_state.dart';
part 'authentication_page_cubit.freezed.dart';

@Injectable()
class AuthenticationPageCubit extends Cubit<AuthenticationPageState> {
  AuthenticationPageCubit() : super(AuthenticationPageState.initial());

  final navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context => navigatorKey.currentContext!;

  void setSuccessResult(AuthorizationActionResult result) {
    emit(AuthenticationPageState.success(result));
  }

  void pop() {
    emit(const AuthenticationPageState.popped());
  }

  @override
  void emit(AuthenticationPageState state) {
    if (isClosed) return;
    super.emit(state);
  }
}
