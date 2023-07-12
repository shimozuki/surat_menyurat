import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:surat_meyurat/model/user_model.dart';

class ApiService {
  final String baseUrl = "https://api-brangrea.jaksparohserver.my.id/";

  // ignore: body_might_complete_normally_nullable
  Future<User?> login(String email, String password) async {
    var url = baseUrl + "login";
    var response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": email, "password": password}));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(jsonEncode({"username": email, "password": password}));
      if (data['data'] != null) {
        var userData = User.fromJson(data['data']);
        return userData;
      } else {
        return null;
      }
    } else {
      throw Exception('Failed to login');
    }
  }

  getUser() {}
}
