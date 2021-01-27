class TerimaProduk{
  String id;
  String foto;
  String namaProduk;
  String kodeProduk;
  int stok;
  int bobotProduk;
  int harga;
  String informasiProduk;

  TerimaProduk({
    this.id,
    this.foto,
    this.namaProduk,
    this.kodeProduk,
    this.stok,
    this.bobotProduk,
    this.harga,
    this.informasiProduk,
  });

  factory TerimaProduk.fromMap(Map data){
    return TerimaProduk(
      id: data['_id'],
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