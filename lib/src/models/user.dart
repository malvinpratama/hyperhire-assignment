class User {
  final String avatar;
  final String name;
  final int rank;
  final int totalReview;
  final String? note;

  const User({
    required this.avatar,
    required this.name,
    required this.rank,
    required this.totalReview,
    this.note,
  });
}
