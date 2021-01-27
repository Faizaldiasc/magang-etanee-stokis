import 'package:ketiga/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:ketiga/models/stock.dart';

class StockService {
  Future<List<Stock>> getStock() async {
    Response response = await DioConfig.get().get("/stock");
    List map = response.data["content"];
    return map.map((s) => Stock.fromMap(s)).toList();
  }
}