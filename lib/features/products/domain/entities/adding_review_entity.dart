class AddingReviewEntity {
  final String? token;
  final String? productId;
  final String? review;
  final String? username;
  final String? userId;
  final String? reviewId;
  final double rating;

  AddingReviewEntity({
    this.token,
    this.productId,
    this.review,
    this.username,
    this.userId,
    this.reviewId,
    required this.rating,
  });
}
