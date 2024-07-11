class Product {
  final String image;
  final String brand;
  final String name;
  final List<String> comments;
  final int totalComment;
  final double rating;
  final List<String> tags;

  const Product({
    required this.image,
    required this.brand,
    required this.name,
    required this.comments,
    required this.totalComment,
    required this.rating,
    required this.tags,
  });
}
