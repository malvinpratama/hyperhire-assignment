part of 'splashscreen_bloc.dart';

class SplashscreenState extends Equatable {
  final ViewStatusModel viewStatus;
  final String? nextRoute;

  const SplashscreenState({
    this.viewStatus = ViewStatusModel.loading,
    this.nextRoute,
  });


  SplashscreenState copyWith({
    ViewStatusModel? viewStatus,
    String? nextRoute,
  }) {
    return SplashscreenState(
      viewStatus: viewStatus ?? this.viewStatus,
      nextRoute: nextRoute ?? this.nextRoute,
    );
  }
  
  @override
  List<Object?> get props => [
    viewStatus,
    nextRoute
  ];

  
}