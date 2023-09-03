// bfe4106310f640d4a39e25dd124d29e3

import 'dart:convert';

import 'package:news/models/news_model.dart';
import "package:http/http.dart" as http;

class NewsAPI {
  static Future<List<NewsModel>> fetchNews(String category) async {
    http.Response res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=bfe4106310f640d4a39e25dd124d29e3"));

    if (res.statusCode == 200) {
      List data = jsonDecode(res.body)["articles"];
      List<NewsModel> tmpData = [];
      for (var item in data) {
        tmpData.add(NewsModel.fromMap(item));
      }
      return tmpData;
    } else {
      return [];
    }
  }
}
