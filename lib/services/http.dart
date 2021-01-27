// import 'dart:convert' as convert;
// import 'package:http/http.dart' as http;

// void main(List<String> arguments) async{
//   var url = 'dio.options.baseUrl = "https://api-etanee.herokuapp.com';
//   var response = await http.get(url);
//   if(response.statusCode ==200){
//     var jsonResponse = convert.jsonDecode(response.body);
//     var itemCount = jsonResponse['totalItems'];
//     print('Number of books about http: $itemCount.');
//   }
//   else{
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }