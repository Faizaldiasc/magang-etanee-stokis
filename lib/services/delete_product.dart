
import 'package:dio/dio.dart';
import 'package:ketiga/services/dio2_config.dart';

class DeleteProductService {
  Future<void> delete(String kodeProduk) async {
    Response response = await DioConfig2.get().delete("/product/delete/$kodeProduk");
  }
}