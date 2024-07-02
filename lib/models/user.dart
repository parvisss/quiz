import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  String name;
  String image;
  int currectAnswers;
  User({
    required this.name,
    required this.image,
    required this.currectAnswers,
    required this.id,
  });
  factory User.fromMap(QueryDocumentSnapshot query) {
    return User(
      name: query["name"],
      image: query["image"],
      currectAnswers: query["currectAnswers"],
      id: query.id,
    );
  }
}
