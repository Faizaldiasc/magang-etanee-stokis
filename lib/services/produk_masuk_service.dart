import 'package:dio/dio.dart';
import 'package:ketiga/models/terima_produk_masuk.dart';
import 'package:ketiga/services/dio2_config.dart';

class TerimaProdukService {
  Future<List<TerimaProduk>> getProdukMasuk() async {
    Response response = await DioConfig2.get().get("/productmasuk");
    List maps = response.data["data"];
    List<TerimaProduk> pesanan = maps.map((p) => TerimaProduk.fromMap(p)).toList();
    return pesanan;
  }
}