class User {
  int id;
  String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['custom_id'],
      name: json['name'],
    );
  }
}

class Establishment {
  int id;
  String pathImage;
  String name;
  String location;
  String category;
  String description;
  String address;
  String aiScript;

  Establishment({
    required this.id,
    required this.pathImage,
    required this.name,
    required this.location,
    required this.category,
    required this.description,
    required this.address,
    required this.aiScript,
  });

  factory Establishment.fromJson(Map<String, dynamic> json) {
    return Establishment(
      id: json['custom_id'],
      pathImage: json['path_image'],
      name: json['name'],
      location: json['location'],
      category: json['category'],
      description: json['description'],
      address: json['address'],
      aiScript: json['ai_script'],
    );
  }
}

class Reviews {
  int id;
  String reviewComment;
  double starRating;
  String imagePath;
  int userId;
  int establishmentId;

  Reviews({
    required this.id,
    required this.reviewComment,
    required this.starRating,
    required this.imagePath,
    required this.userId,
    required this.establishmentId,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
        id: json['custom_id'],
        reviewComment: json['review_comment'],
        starRating: json['star_rating'].toDouble(),
        imagePath: json['image_path'],
        userId: json['user'],
        establishmentId: json['establishment']);
  }
}
