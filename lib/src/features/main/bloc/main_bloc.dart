import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/models.dart';

part 'main_state.dart';

class MainBloc extends Cubit<MainState> {
  MainBloc() : super(const MainState()) {
    init();
  }

  init() {}

  changeIndex(int index) {
    emit(
      state.copyWith(index: index),
    );
  }
}
