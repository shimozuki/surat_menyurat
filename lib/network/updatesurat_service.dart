import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdateSuratService {
  Future<bool> updateSurat(String idsurat) async {
    final url = Uri.parse(
        'https://api-brangrea.jaksparohserver.my.id/surat/updateSurat');

    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'id_suratdesa': idsurat}),
      );

      if (response.statusCode == 200) {
        // Handle successful response
        print('Surat updated successfully.');
        return true;
      } else {
        // Handle error response
        print('Failed to update surat. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle network or other runtime errors
      print('Error: $e');
      return false;
    }
  }
}
