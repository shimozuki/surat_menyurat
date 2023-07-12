class NewsModel {
  String idBerita;
  String idUser;
  String idPokja;
  String slugBerita;
  String namaBerita;
  String keterangan;
  String jenisBerita;
  String statusBerita;
  String gambar;
  String tanggalPost;
  String tanggal;

  NewsModel({
    required this.idBerita,
    required this.idUser,
    required this.idPokja,
    required this.slugBerita,
    required this.namaBerita,
    required this.keterangan,
    required this.jenisBerita,
    required this.statusBerita,
    required this.gambar,
    required this.tanggalPost,
    required this.tanggal,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      idBerita: json['id_berita'],
      idUser: json['id_user'],
      idPokja: json['id_pokja'],
      slugBerita: json['slug_berita'],
      namaBerita: json['nama_berita'],
      keterangan: json['keterangan'],
      jenisBerita: json['jenis_berita'],
      statusBerita: json['status_berita'],
      gambar: json['gambar'],
      tanggalPost: json['tanggal_post'],
      tanggal: json['tanggal'],
    );
  }
}
