class BerkasModel {
  final String idBerkas;
  final String nik;
  final String ktp;
  final String kartuKeluarga;

  BerkasModel({
    required this.idBerkas,
    required this.nik,
    required this.ktp,
    required this.kartuKeluarga,
  });

  factory BerkasModel.fromJson(Map<String, dynamic> json) {
    return BerkasModel(
      idBerkas: json['id_berkas'],
      nik: json['nik'],
      ktp: json['ktp'],
      kartuKeluarga: json['kartu_keluarga'],
    );
  }
}
