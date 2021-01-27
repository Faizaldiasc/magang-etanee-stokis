class Pesanan{
  String idProduct;
  String pemesan;
  String pengirim;
  String tanggalPesanan;
  List<DetailPesanan> product;

  Pesanan({
  this.idProduct,
  this.pemesan,
  this.pengirim,
  this.tanggalPesanan,
  this.product,
  });

  factory Pesanan.fromMap(Map data){
    List<DetailPesanan> product = (data['product'] as List)
    .map((x) => DetailPesanan.fromJson(x))
    .toList();
    return Pesanan(
      idProduct: data['idProduct'],
      pemesan: data['pemesan'],
      pengirim: data['pengirim'],
      tanggalPesanan: data['tanggalPesanan'],
      product: product,
    );
  }
}
  class DetailPesanan{
  int stok;
  String foto;
  String namaProduk;
  String kodeProduk;

  DetailPesanan({
  this.stok,
  this.foto,
  this.namaProduk,
  this.kodeProduk,
  });

  factory DetailPesanan.fromJson(Map<String, dynamic> data){
    return DetailPesanan(
      stok: data['stok'],
      foto: data['foto'],
      namaProduk: data['namaProduk'],
      kodeProduk: data['kodeProduk']
    );
  }
}

