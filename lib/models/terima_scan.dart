import 'package:flutter/foundation.dart';

// class TerimaScan{
//   String success;
//   List<TerimaScanBaru> dataScan = [];

//   TerimaScan({
//     this.success,
//     this.dataScan,
//   });

//   factory TerimaScan.fromJson(Map<String, dynamic> data){
//     List<TerimaScanBaru> hasil = (data['data'] as List)
//     .map((x) => TerimaScanBaru.fromMap(x))
//     .toList();
//     return TerimaScan(
//       success: data['success'],
//       dataScan : hasil
//     );
//       // product: data != null ? new List<DetailProduct>.from(data.map((x) => DetailProduct.fromJson(x))) : List<DetailProduct>();
//       // product: DetailProduct.fromJson(data["product"]));
// }

// factory TerimaScan.fromJson(Map<String, dynamic> data){
//     List<TerimaScanBaru> hasil = (data['data'] as List)
//     .map((x) => TerimaScanBaru.fromJson(x))
//     .toList();
//     return TerimaScan(
//       success: data['success'],
//       dataScan: hasil
      
//     );
//       // product: data != null ? new List<DetailProduct>.from(data.map((x) => DetailProduct.fromJson(x))) : List<DetailProduct>();
//       // product: DetailProduct.fromJson(data["product"]));
// }
// }

// class TerimaScanBaru{
//   String id;
//   String foto;
//   String namaProduk;
//   String kodeProduk;
//   int stok;
//   int bobotProduk;
//   String informasiProduk;

//   TerimaScanBaru({
//     this.id,
//     this.foto,
//     this.namaProduk,
//     this.kodeProduk,
//     this.stok,
//     this.bobotProduk,
//     this.informasiProduk,
//   });

//   factory TerimaScanBaru.fromJson(Map<String, dynamic>data){
//     return TerimaScanBaru(
//       id: data['_id'],
//       foto: data['foto'],
//       namaProduk: data['namaProduk'],
//       kodeProduk: data['kodeProduk'],
//       informasiProduk: data['informasiProduk'],
//     );
//   }
// }

// class TerimaScan{
//   String success;
//   List<TerimaScanBaru> dataScan;

//   // String foto;
//   // String namaProduk;

//   TerimaScan({
//   this.success,
//   this.dataScan,

//   });

//   factory TerimaScan.fromMap(Map data){
//     List<TerimaScanBaru> product = (data['product'] as List)
//     .map((x) => TerimaScan.fromJson(x))
//     .toList();
//     return TerimaScan(
//       // _id: data["data"]['_id'],
//       idProduct: data['idProduct'],
//       pemesan: data['pemesan'],
//       pengirim: data['pengirim'],
//       tanggalPesanan: data['tanggalPesanan'],
//       product: product,
//       // foto: data['foto'],
//       // namaProduk: data['namaProduk']
//     );
//   }
// }
//   class TerimaScanBaru{
//   int stok;

//   TerimaScanBaru({
//   this.stok,
//   });

//   factory TerimaScanBaru.fromJson(Map<String, dynamic> data){
//     return TerimaScanBaru(
//       stok: data['stok'],
//     );
//   }
// }