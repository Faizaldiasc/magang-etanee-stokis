import 'package:dio/dio.dart';
import 'package:ketiga/models/product.dart';
import 'package:ketiga/services/dio2_config.dart';

class ProductService {
  Future<List<Product>> getProduct() async {
    Response response = await DioConfig2.get().get("/product");
    List maps = response.data["data"];
    List<Product> products = maps.map((p) => Product.fromMap(p)).toList();
    return products;
  }
}