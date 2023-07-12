class SuratModel {
  final String idSuratDesa;
  final String nik;
  final String jenisSurat;
  final String dateCreated;
  final String status;

  SuratModel({
    required this.idSuratDesa,
    required this.nik,
    required this.jenisSurat,
    required this.dateCreated,
    required this.status,
  });

  factory SuratModel.fromJson(Map<String, dynamic> json) {
    return SuratModel(
      idSuratDesa: json['id_suratdesa'],
      nik: json['nik'],
      jenisSurat: json['jenis_surat'],
      dateCreated: json['date_created'],
      status: json['status'],
    );
  }
}
