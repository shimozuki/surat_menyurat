import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:surat_meyurat/model/news_model.dart';

class NewsService {
  Future<List<NewsModel>> fetchNewsList() async {
    final response = await http.get(
        Uri.parse('https://api-brangrea.jaksparohserver.my.id/berita/list'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'] as List<dynamic>;
      return data.map((item) => NewsModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
