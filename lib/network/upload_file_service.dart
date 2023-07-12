import 'dart:io';
import 'package:http/http.dart' as http;

class UploadFileService {
  Future<bool> uploadFiles(String nik, File fotoKTP, File fotoKK) async {
    String url = 'https://api-brangrea.jaksparohserver.my.id/berkas/postBerkas';

    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields['nik'] = nik;

    // Add the files
    request.files.add(http.MultipartFile(
      'ktp',
      fotoKTP.readAsBytes().asStream(),
      fotoKTP.lengthSync(),
      filename: 'foto_ktp.jpg',
    ));

    request.files.add(http.MultipartFile(
      'kartu_keluarga',
      fotoKK.readAsBytes().asStream(),
      fotoKK.lengthSync(),
      filename: 'foto_kk.jpg',
    ));

    var response = await request.send();

    if (response.statusCode == 200) {
      // Upload successful
      print(fotoKK);
      print('Upload successful');
      return true;
    } else {
      // Upload failed
      print('Upload failed with status code ${response.statusCode}');
      return false;
    }
  }
}
