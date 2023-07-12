class AllSuratModel {
  final String idSuratDesa;
  final String nik;
  final String jenisSurat;
  final String dateCreated;
  final String status;

  AllSuratModel({
    required this.idSuratDesa,
    required this.nik,
    required this.jenisSurat,
    required this.dateCreated,
    required this.status,
  });

  factory AllSuratModel.fromJson(Map<String, dynamic> json) {
    return AllSuratModel(
      idSuratDesa: json['id_suratdesa'],
      nik: json['nik'],
      jenisSurat: json['jenis_surat'],
      dateCreated: json['date_created'],
      status: json['status'],
    );
  }
}
