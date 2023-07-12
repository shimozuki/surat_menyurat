import 'dart:convert';
import 'package:http/http.dart' as http;

class PengajuanSuratService {
  Future<bool> submitSurat(String nik, String jenisSurat) async {
    String url = 'https://api-brangrea.jaksparohserver.my.id/surat/postSurat';

    var body = jsonEncode({
      'nik': nik,
      'jenis_surat': jenisSurat,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      // Pengajuan surat berhasil
      print('Pengajuan surat berhasil');
      return true;
    } else {
      // Pengajuan surat gagal
      print('Pengajuan surat gagal dengan status code ${response.statusCode}');
      return false;
    }
  }
}
