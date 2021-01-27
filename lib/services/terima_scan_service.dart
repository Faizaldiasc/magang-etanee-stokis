import 'package:dio/dio.dart';
// import 'package:ketiga/dio_config.dart';
import 'package:ketiga/models/terima_scan.dart';
import 'package:ketiga/services/dio2_config.dart';

// class TerimaScanService {
//   Future<List<TerimaScan>> getTerimaPesanan() async {
//     Response response = await DioConfig2.get().get("/product");
//     List maps = response.data["content"];
//     // return map.map((terimaScan) => TerimaScan.fromJson(terimaScan)).toList();
//     List<TerimaScan> terimaScan = maps.map((x) => TerimaScan.fromJson(x)).toList();
//     return terimaScan;
//   }
// }