// ignore_for_file: public_member_api_docs, sort_constructors_first
class StoreModel {
  final String title;
  final String description;
  final String image;
  final String price;
  final String rating;
  final String category;

  StoreModel({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.category,
  });
  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      rating: json['rating'],
      category: json['category'],
    );
  }
}
