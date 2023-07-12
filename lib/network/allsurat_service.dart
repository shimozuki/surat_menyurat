import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:surat_meyurat/model/allsurat_model.dart';

class AllSuratService {
  Future<List<AllSuratModel>> fetchAllSurat() async {
    final url =
        Uri.https('api-brangrea.jaksparohserver.my.id', '/surat/getSurat');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData.map((data) => AllSuratModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch all surat');
    }
  }
}
