class SubmitProduk{
  String idProduct;
  String foto;
  String namaProduk;
  String kodeProduk;
  int stok;
  int bobotProduk;
  int harga;
  String informasiProduk;


SubmitProduk({
    this.idProduct,
    this.foto,
    this.namaProduk,
    this.kodeProduk,
    this.stok,
    this.bobotProduk,
    this.harga,
    this.informasiProduk,
  });

  factory SubmitProduk.fromMap(Map <String, dynamic>  data){
    return SubmitProduk(
      idProduct: data['idProduct'],
      foto: data['foto'],
      namaProduk: data['namaProduk'],
      kodeProduk: data['kodeProduk'],
      stok: data['stok'],
      bobotProduk: data['bobotProduk'],
      harga: data['harga'],
      informasiProduk: data['informasiProduk']
    );
  }
}