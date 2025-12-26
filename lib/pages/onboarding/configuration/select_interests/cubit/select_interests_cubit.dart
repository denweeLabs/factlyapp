import 'package:denwee/core/facts/domain/entity/user_interest.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'select_interests_state.dart';
part 'select_interests_cubit.freezed.dart';

@Injectable()
class SelectInterestsCubit extends Cubit<SelectInterestsState> {
  final List<UserInterest>? selectedInterests;

  SelectInterestsCubit(@factoryParam this.selectedInterests)
      : super(SelectInterestsState.initial(
          initialInterests: selectedInterests,
        ));

  void selectInterest(UserInterest interest) {
    final currentInterests = [...state.selectedInterests];
    currentInterests.contains(interest)
        ? currentInterests.remove(interest)
        : currentInterests.add(interest);
    emit(state.copyWith(
      selectedInterests: currentInterests,
      validate: false,
    ));
  }

  void validateInterests() {
    emit(state.copyWith(validate: true));
  }
}
