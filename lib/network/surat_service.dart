import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:surat_meyurat/model/surat_model.dart';

class SuratService {
  static const String baseUrl = 'https://api-brangrea.jaksparohserver.my.id';

  Future<List<SuratModel>> getSurat(String nik, String status) async {
    final url =
        Uri.parse('$baseUrl/surat/getSurat?nik=${nik}&status=${status}');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((json) => SuratModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch surat');
    }
  }
}
