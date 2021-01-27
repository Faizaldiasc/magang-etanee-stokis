import 'package:dio/dio.dart';
import 'package:ketiga/models/pesanan.dart';
import 'package:ketiga/services/dio2_config.dart';

class PesananService {
  Future<List<Pesanan>> getPesanan() async {
    Response response = await DioConfig2.get().get("/pesanan");
    List maps = response.data["data"];
    List<Pesanan> pesanan = maps.map((p) => Pesanan.fromMap(p)).toList();
    return pesanan;
  }
}

// class PesananDetailService {
//   Future<List<Pesanan>> getPesanDetail() async{
//     Response response = await DioConfig2.get().get("/pesanan");
//     List maps = response.data["data"];
//     List<Pesanan> detailPesanan = maps.map((dp) => Pesanan.dariMap(dp)).toList();
//     return detailPesanan;
//   }
// }