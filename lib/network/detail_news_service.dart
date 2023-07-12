import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:surat_meyurat/model/detailnews_model.dart';

class DetailNewsService {
  Future<DetailNewsModel> fetchDetailNews(String idNews) async {
    final url =
        'https://api-brangrea.jaksparohserver.my.id/berita/list/$idNews';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'][0];
      return DetailNewsModel.fromJson(data);
    } else {
      print('https://api-brangrea.jaksparohserver.my.id/berita/list/$idNews');
      throw Exception('Failed to load detail news');
    }
  }
}
