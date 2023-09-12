class Review {
  int? id;
  String? reviewId;
  String? reviewer;
  String? stars;
  String? profile;

  Review({
    this.id,
    this.reviewId,
    this.reviewer,
    this.stars,
    this.profile
  });

  // Convert a Review object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reviewId': reviewId,
      'reviewer': reviewer,
      'stars': stars,
      'profile':profile
    };
  }

  // Create a Review object from a JSON map
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as int?,
      reviewId: json['reviewId'] as String?,
      reviewer: json['reviewer'] as String?,
      stars: json['stars'] as String?,
      profile: json['profile'] as String?
    );
  }
}
