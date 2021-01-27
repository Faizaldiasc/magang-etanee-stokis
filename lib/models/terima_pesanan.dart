class CreateHistory{
  String idPesanan;
  String foto;
  String namaProduk;
  String kodeProduk;
  int stok;
  int bobotProduk;
  int harga;
  String informasiProduk;
  String id;


CreateHistory({
    this.idPesanan,
    this.foto,
    this.namaProduk,
    this.kodeProduk,
    this.stok,
    this.bobotProduk,
    this.harga,
    this.informasiProduk,
    this.id
  });

  factory CreateHistory.fromMap(Map <String, dynamic>  data){
    return CreateHistory(
      idPesanan: data['idPesanan'],
      foto: data['foto'],
      namaProduk: data['namaProduk'],
      kodeProduk: data['kodeProduk'],
      stok: data['stok'],
      bobotProduk: data['bobotProduk'],
      harga: data['harga'],
      informasiProduk: data['informasiProduk'],
      id: data['_id']
    );
  }
}