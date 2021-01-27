class Pengiriman {
  String idPesanan;
  String foto;
  String namaProduk;
  String kodeProduk;
  String informasiProduk;
  int stok;
  int harga;
  int bobotProduk;
  List<RiwayatPengiriman> pesanan;

  Pengiriman({
    this.idPesanan,
    this.foto,
    this.namaProduk,
    this.kodeProduk,
    this.informasiProduk,
    this.stok,
    this.harga,
    this.bobotProduk,
    this.pesanan,
  });

  factory Pengiriman.fromMap(Map<String, dynamic> data) {
    List<RiwayatPengiriman> pesanan = (data['pesanan'] as List)
        .map((x) => RiwayatPengiriman.fromJson(x))
        .toList();
    return Pengiriman(
        idPesanan: data['idPesanan'],
        foto: data['foto'],
        namaProduk: data['namaProduk'],
        kodeProduk: data['kodeProduk'],
        informasiProduk: data['informasiProduk'],
        stok: data['stok'],
        harga: data['harga'],
        bobotProduk: data['bobotProduk'],
        pesanan: pesanan);
  }
}

class RiwayatPengiriman {
  String pemesan;
  String pengirim;
  String tanggalPesanan;

  RiwayatPengiriman({
    this.pemesan,
    this.pengirim,
    this.tanggalPesanan,
  });

  factory RiwayatPengiriman.fromJson(Map<String, dynamic> data) {
    return RiwayatPengiriman(
      pemesan: data['pemesan'],
      pengirim: data['pengirim'],
      tanggalPesanan: data['tanggalPesanan'],
    );
  }
}
