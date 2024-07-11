part of 'main_bloc.dart';

class MainState extends Equatable {
  final ViewStatusModel viewStatusModel;
  final int index;

  const MainState({
    this.viewStatusModel = ViewStatusModel.loading,
    this.index = 0,
  });

  MainState copyWith({
    ViewStatusModel? viewStatusModel,
    int? index,
  }) {
    return MainState(
      viewStatusModel: viewStatusModel ?? this.viewStatusModel,
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [
        viewStatusModel,
        index,
      ];
}
