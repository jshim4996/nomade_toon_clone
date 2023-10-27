import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toon/model/webtoon_deatail_model.dart';
import 'package:toon/model/webtoon_episode_model.dart';
import 'package:toon/model/webtoon_model.dart';

class ApiService {
  static const baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = 'today';

  static Future<List<WebtoonModel>> getDoaysToos() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //List<dynamic> 생략 가능
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDeatilModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDeatilModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisaodModel>> getLatestEpisodeById(
      String id) async {
    List<WebtoonEpisaodModel> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisaodModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
