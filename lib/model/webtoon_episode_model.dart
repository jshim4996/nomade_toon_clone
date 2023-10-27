class WebtoonEpisaodModel {
  final String id, title, rating, date;

  WebtoonEpisaodModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
