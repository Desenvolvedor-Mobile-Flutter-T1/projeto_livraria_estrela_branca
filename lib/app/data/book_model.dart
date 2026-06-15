import 'dart:convert';

class BookModel {
  final String title;
  final String author;
  final String imageUrl;
  BookModel({
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] as String,
      author: map['author'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
