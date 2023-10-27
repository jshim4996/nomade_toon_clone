import 'dart:convert';

class WebtoonDeatilModel {
  final String title, about, genre, age;

  WebtoonDeatilModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
