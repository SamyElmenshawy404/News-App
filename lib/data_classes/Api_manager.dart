import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data_classes/model/news_response.dart';
import 'package:news_app/data_classes/model/sources_response.dart';

class ApiManager {
  static const String apiKey = '656f5508859d4350b9cb4542bd37b8a0';
  static const String baseUrl = 'newsapi.org';

  static Future<SourcesResponse> loadNewsSources(String category) async {
    var params = {'apiKey': apiKey, 'category': category};
    var uri = Uri.https(baseUrl, '/v2/top-headlines/sources', params);
    var response = await http.get(uri);
    var sourcesResponse = SourcesResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print(response.body);
      return sourcesResponse;
    }
    if (sourcesResponse.message != null) {
      print(sourcesResponse.message);
      throw Exception(sourcesResponse.message);
    }
    throw Exception('error loading news ');
  }

  static Future<NewsResponse> loadNews(
      {String? sources, String? query, int? page = 1}) async {
    var params = {
      'apiKey': apiKey,
      'sources': sources,
      'q': query,
      'page': '$page'
    };
    var uri = Uri.https(baseUrl, '/v2/everything', params);
    var response = await http.get(uri);
    var newsResponse = NewsResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return newsResponse;
    }
    if (newsResponse.message != null) {
      print(newsResponse.message);
      throw Exception(newsResponse.message);
    }
    throw Exception('error loading news ');
  }
}
