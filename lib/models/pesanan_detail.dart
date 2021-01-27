class DetailPesanan{
  String id;
  String idPesanan;
  String foto;
  String pemesan;
  String tanggalPesanan;
  List <DetailProduct> product;

DetailPesanan({
  this.id,
  this.idPesanan,
  this.foto,
  this.pemesan,
  this.product,
  this.tanggalPesanan,
});

factory DetailPesanan.fromJson(Map<String, dynamic> data){
    List<DetailProduct> product = (data['product'] as List)
    .map((x) => DetailProduct.fromJson(x))
    .toList();
    return DetailPesanan(
      id: data['_id'],
      idPesanan: data['idPesanan'],
      pemesan: data['pemesan'],
      foto: data['foto'],
      tanggalPesanan: data['tanggalPesanan'],
      product: product
    );
      
}
}
class DetailProduct{
  String namaProduk;
  String foto;
  String kodeProduk;
  String informasiProduk;
  int stok;
  int harga;
  int bobotProduk;

  DetailProduct({
  this.namaProduk,
  this.foto,
  this.kodeProduk,
  this.informasiProduk,
  this.stok,
  this.harga,
  this.bobotProduk
  });

  factory DetailProduct.fromJson(Map<String, dynamic> data){
    return DetailProduct(
      namaProduk: data['namaProduk'],
      foto: data['foto'],
      stok: data['stok'],
      kodeProduk: data['kodeProduk'],
      informasiProduk: data['informasiProduk'],
      harga: data['harga'],
      bobotProduk: data['bobotProduk'],
    );
  }
}

