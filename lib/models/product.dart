class Product{
  String id;
  String foto;
  String namaProduk;
  String kodeProduk;
  int stok;
  int bobotProduk;
  int harga;
  String infromasiProduk;

  Product({
    this.id,
    this.foto,
    this.namaProduk,
    this.kodeProduk,
    this.stok,
    this.bobotProduk,
    this.harga,
    this.infromasiProduk,
  });

  factory Product.fromMap(Map data){
    return Product(
      id: data['_id'],
      foto: data['foto'],
      namaProduk: data['namaProduk'],
      kodeProduk: data['kodeProduk'],
      stok: data['stok'],
      bobotProduk: data['bobotProduk'],
      harga: data['harga'],
      infromasiProduk: data['informasiProduk']
    );
  }
}