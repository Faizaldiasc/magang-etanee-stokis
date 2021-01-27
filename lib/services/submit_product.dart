import 'package:ketiga/models/submit_product_model.dart';
import 'package:ketiga/services/dio2_config.dart';
import 'package:dio/dio.dart';

class SubmitProdukService {
  Future<void> getSubmitProduk(String idProduk, 
  foto, namaProduk, kodeProduk, informasiProduk, int stok, harga, bobotProduk) async {
    Map param = {
      "idProduct": idProduk,
      "foto": foto,
      "namaProduk": namaProduk,
      "kodeProduk": kodeProduk,
      "stok" : stok,
      "harga": harga,
      "bobotProduk": bobotProduk,
      "informasiProduk": informasiProduk,
    };
    Response response = await DioConfig2.get().post("/product/register", data: param);
    return SubmitProduk.fromMap(response.data["data"]);
  }
}