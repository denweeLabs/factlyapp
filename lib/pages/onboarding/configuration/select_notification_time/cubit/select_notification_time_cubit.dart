import 'package:denwee/core/ui/constants/app/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:denwee/core/user_preferences/domain/entity/notifications_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'select_notification_time_state.dart';
part 'select_notification_time_cubit.freezed.dart';

@Injectable()
class SelectNotificationTimeCubit extends Cubit<SelectNotificationTimeState> {
  SelectNotificationTimeCubit() : super(SelectNotificationTimeState.initial());

  void changeTime(DateTime time) {
    emit(state.copyWith(time: time));
  }
}
