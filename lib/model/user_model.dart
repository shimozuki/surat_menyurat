class User {
  final String idUser;
  final String username;
  final String level;
  final String idPenduduk;
  final String nik;

  User({
    required this.idUser,
    required this.username,
    required this.level,
    required this.idPenduduk,
    required this.nik,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['id_user'],
      username: json['username'],
      level: json['akses_level'],
      idPenduduk: json['id_penduduk'],
      nik: json['nik'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'username': username,
      'akses_level': level,
      'id_penduduk': idPenduduk,
      'nik': nik,
    };
  }
}
