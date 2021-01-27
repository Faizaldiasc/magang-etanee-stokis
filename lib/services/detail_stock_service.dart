
import 'package:dio/dio.dart';
import 'package:ketiga/dio_config.dart';
import 'package:ketiga/models/stock_detail.dart';

class DetailProductService {
  Future<List<DetailStock>> getStock() async {
    Response response = await DioConfig.get().get("/stock");
    List map = response.data["content"];
    return map.map((ds) => DetailStock.fromMap(ds)).toList();
  }
}