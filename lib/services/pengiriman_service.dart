import 'package:dio/dio.dart';
import 'package:ketiga/services/dio2_config.dart';
import 'package:ketiga/models/pengiriman_model.dart';

class RiwayaPengirimanService {
  Future<List<Pengiriman>> getRiwayatPengiriman() async {
    Response response = await DioConfig2.get().get("/history");
    List maps = response.data["data"];
    List<Pengiriman> pengiriman = maps.map((p) => Pengiriman.fromMap(p)).toList();
    return pengiriman;
  }
}