import 'package:dio/dio.dart';
import 'package:ketiga/models/terima_pesanan.dart';
import 'package:ketiga/services/dio2_config.dart';

class CreateHistoryService {
  Future<void> getCreateHistory(String idPesanan,
  foto, namaProduk, kodeProduk, informasiProduk, int stok, harga, bobotProduk) async {
    Map param = {
      "idPesanan": idPesanan,
      "foto": foto,
      "namaProduk": namaProduk,
      "kodeProduk": kodeProduk,
      "stok" : stok,
      "harga": harga,
      "bobotProduk": bobotProduk,
      "informasiProduk": informasiProduk,
    };
    Response response = await DioConfig2.get().post("/history/register", data: param);
    print("test");
    print(namaProduk);
    // List map = response.data["content"];
    // return SubmitProduk.fromJson(json.decode(response.body));
    return CreateHistory.fromMap(response.data["data"]);
    // return map.map((s) => SubmitProduk.fromMap(s)).toList();
  }
}
// import 'dart:convert';

// import 'package:ketiga/models/terima_pesanan.dart';
// // import 'package:ketiga/services/dio2_config.dart';
// // import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;

// class ScanPesananService {
//   Future<void> getScanPesanan(String idPesanan, namaProduk, foto, kodeProduk,
//       informasiProduk, int stok, harga, bobotProduk) async {

//     Map <String, dynamic> param= {
//       "idPesanan": idPesanan,
//       "foto": foto,
//       "namaProduk": namaProduk,
//       "kodeProduk": kodeProduk,
//       "stok": stok,
//       "harga": harga,
//       "bobotProduk": bobotProduk,
//       "informasiProduk": informasiProduk,
//     };
//     final http.Response response = await http.post(Uri.encodeFull("http://api-etanee.herokuapp.com/history/register"), body: json.encode(param));
//   }
// }
