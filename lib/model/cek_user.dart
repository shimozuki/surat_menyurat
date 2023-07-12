class LoginResponseModel {
  final bool status;
  final String message;
  final Data data;

  LoginResponseModel(
      {required this.status, required this.message, required this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String nik;

  Data({required this.nik});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      nik: json['nik'],
    );
  }
}
