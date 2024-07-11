part of 'user_bloc.dart';

class UserState extends Equatable {
  final ViewStatusModel viewStatusModel;
  final User? user;
  final List<Comment> comments;

  const UserState({
    this.viewStatusModel = ViewStatusModel.idle,
    this.user,
    this.comments = const <Comment>[],
  });

  UserState copyWith({
    ViewStatusModel? viewStatusModel,
    User? user,
    List<Comment>? comments,
  }) {
    return UserState(
      viewStatusModel: viewStatusModel ?? this.viewStatusModel,
      user: user ?? this.user,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object?> get props => [
        viewStatusModel,
        user,
        comments,
      ];
}
