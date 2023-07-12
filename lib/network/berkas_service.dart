import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:surat_meyurat/model/berkas_model.dart';

class BerkasService {
  static const String baseUrl = 'https://api-brangrea.jaksparohserver.my.id';

  Future<List<BerkasModel>> getBerkas(String nik) async {
    final url = Uri.parse('$baseUrl/berkas/getBerkas?nik=${nik}');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      print('responseData.length');
      return responseData.map((json) => BerkasModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch berkas');
    }
  }
}
