import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_di/features/time_service/time_service.dart';

part 'current_time_cubit.freezed.dart';

class CurrentTimeCubit extends Cubit<CurrentTimeState> {
  CurrentTimeCubit({
    required this.timeService,
  }) : super(const CurrentTimeState.initial());

  final TimeService timeService;

  Future<void> fetch() async {
    if (state is CurrentTimeStateLoading) {
      return;
    }

    emit(const CurrentTimeState.loading());

    await Future<void>.delayed(const Duration(seconds: 1));

    emit(CurrentTimeState.success(timeService.now));
  }
}

@freezed
class CurrentTimeState with _$CurrentTimeState {
  const factory CurrentTimeState.initial() = CurrentTimeStateInitial;
  const factory CurrentTimeState.loading() = CurrentTimeStateLoading;
  const factory CurrentTimeState.success(DateTime time) =
      CurrentTimeStateSuccess;
}
