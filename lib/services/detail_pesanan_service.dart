import 'package:dio/dio.dart';
import 'package:ketiga/models/pesanan_detail.dart';
import 'package:ketiga/services/dio2_config.dart';


class DetailPesananService {
  Future<List<DetailPesanan>> getdetailPesanan() async {
    Response response = await DioConfig2.get().get("/pesanan");
    List maps = response.data["data"];
    List<DetailPesanan> detailPesanan = maps.map((p) => DetailPesanan.fromJson(p)).toList();
    return detailPesanan;
  }
}



