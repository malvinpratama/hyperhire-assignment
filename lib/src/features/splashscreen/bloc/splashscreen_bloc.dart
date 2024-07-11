import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/models.dart';
import '../../../repositories/repositories.dart';
import '../../pages.dart';

part 'splashscreen_state.dart';

class SplashscreenBloc extends Cubit<SplashscreenState> {
  SplashscreenBloc(SettingsRepository settingsRepository)
      : _settingsRepository = settingsRepository,
        super(const SplashscreenState()) {
    getFirstTime();
  }

  final SettingsRepository _settingsRepository;

  getFirstTime() {
    _settingsRepository.getSettingByKey('first_time').then(
      (result) {
        Future.delayed(const Duration(seconds: 3)).then(
          (_) {
            if (result?.value == '1') {
              emit(
                state.copyWith(
                  viewStatus: ViewStatusModel.success,
                  nextRoute: IntroPage.route,
                ),
              );
            } else {
              emit(
                state.copyWith(
                  viewStatus: ViewStatusModel.success,
                  nextRoute: MainPage.route,
                ),
              );
            }
          },
        );
      },
    ).onError(
      (error, _) {
        Future.delayed(const Duration(seconds: 3)).then(
          (_) {
            emit(
              state.copyWith(
                viewStatus: ViewStatusModel.failure,
              ),
            );
          },
        );
      },
    );
  }
}
