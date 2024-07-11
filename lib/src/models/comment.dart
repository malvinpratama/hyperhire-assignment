class Comment {
  final String product;
  final String model;
  final double rating;
  final DateTime createdAt;
  final List<String>? tag;
  final List<String>? comments;
  final List<String>? image;

  const Comment({
    required this.product,
    required this.model,
    required this.rating,
    required this.createdAt,
    this.tag,
    this.comments,
    this.image,
  });
}
