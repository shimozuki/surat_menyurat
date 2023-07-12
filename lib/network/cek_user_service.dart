import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:surat_meyurat/model/cek_user.dart';

Future<String> getToken(String idUser) async {
  final url =
      'https://api-brangrea.jaksparohserver.my.id/getNikByIdUser/${idUser}';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    final loginResponse = LoginResponseModel.fromJson(jsonResponse);

    return loginResponse.data.nik;
  } else {
    throw Exception('Gagal mendapatkan token');
  }
}
