import 'package:flutter/material.dart';
import 'package:ketiga/models/pesanan.dart';
import 'package:ketiga/models/product.dart';
import 'package:ketiga/services/pesanan_masuk_service.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';
import 'package:ketiga/screens/ui/deliver_product.dart';
import 'package:ketiga/screens/ui/order_detail.dart';
import 'package:ketiga/services/product_service.dart';

class DeliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Pesanan Masuk',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Pesanan>>(
          future: PesananService().getPesanan(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) return Container();
            List<Pesanan> pesanan = snapshot.data;
            return ListView.builder(
              itemCount: pesanan.length,
              itemBuilder: (BuildContext context, int index) => 
              (pesanan.isEmpty) ? 
              Container(child: Center(child: Text("Belum ada pesanan masuk"),),):
              Column(
                children: <Widget>[
                  (pesanan[index].product.isEmpty) ?
                  Container():
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetail(index),
                          ),
                        );
                      },
                      child: Card(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        pesanan[index].idProduct,
                                        style:
                                            TextStyle(color: Color(0xff68C93E)),
                                      ),
                                      Text(
                                        pesanan[index].tanggalPesanan,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Jumlah :',
                                  ),
                                  Text(
                                    '${pesanan[index].product[0].stok}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 215),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                OrderDetail(index),
                                          ),
                                        );
                                      },
                                      child: Icon(Icons.navigate_next))
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Stack(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Penerima : '),
                                      Text(
                                        pesanan[index].pemesan,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text('Pengantar : '),
                                  Text(
                                    pesanan[index].pengirim,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
// return Scaffold(
// appBar: AppBar(
//   iconTheme: IconThemeData(color: Colors.black),
//   elevation: 1,
//   backgroundColor: Colors.white,
//   title: Row(
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         'Pesanan Masuk',
//         style: TextStyle(fontSize: 20.0, color: Colors.black),
//       ),
//     ],
//   ),
//   ),
// body: Padding(
//   padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
//   child: ListView(
//     children: <Widget>[
//       Card(
//         child: Container(
//           margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Stack(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text(
//                         'ABC-C 01',
//                         style: TextStyle(color: Color(0xff68C93E)),
//                       ),
//                       Text(
//                         pesanan[index].idProduct,
//                       ),
//                       Text(
//                         '02 Januari 2020, 09:00',
//                         style:
//                             TextStyle(color: Colors.grey, fontSize: 12.0),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 40.0,
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Text('Jumlah : '),
//                   Text(
//                     '5 Pesanan',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   Padding(padding: EdgeInsets.only(left:175),),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => OrderDetail(),
//                       ),
//                     );
//                     },
//                     child: Icon(Icons.navigate_next))
//                 ],
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Stack(
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       Text('Penerima : '),
//                       Text(
//                         'Darko',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Text('Pengantar : '),
//                   Text(
//                     'Herman',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//         Card(
//           child: Container(
//             margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Stack(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                           'ABC-C 01',
//                           style: TextStyle(color: Color(0xff68C93E)),
//                         ),
//                         Text(
//                           '02 Januari 2020, 09:00',
//                           style:
//                               TextStyle(color: Colors.grey, fontSize: 12.0),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 40.0,
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Text('Jumlah : '),
//                     Text(
//                       '10 Pesanan',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Padding(padding: EdgeInsets.only(left:165),),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => OrderDetail(),
//                         ),
//                       );
//                       },
//                       child: Icon(Icons.navigate_next))
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Stack(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Text('Penerima : '),
//                         Text(
//                           'Amin',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Text('Pengantar : '),
//                     Text(
//                       'Gusta',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Card(
//           child: Container(
//             margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Stack(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         Text(
//                           'ABC-C 01',
//                           style: TextStyle(color: Color(0xff68C93E)),
//                         ),
//                         Text(
//                           '02 Januari 2020, 09:00',
//                           style:
//                               TextStyle(color: Colors.grey, fontSize: 12.0),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 40.0,
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Text('Jumlah : '),
//                     Text(
//                       '15 Pesanan',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),Padding(padding: EdgeInsets.only(left:165),),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => OrderDetail(),
//                         ),
//                       );
//                       },
//                       child: Icon(Icons.navigate_next))
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Stack(
//                   children: <Widget>[
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         Text('Penerima : '),
//                         Text(
//                           'Rozak',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Text('Pengantar : '),
//                     Text(
//                       'Riki',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 20.0,
//         ),
// ButtonTheme(
//   minWidth: 380.0,
//   height: 40.0,
//   child: RaisedButton(
//     textColor: Colors.white,
//     color: Color(0xff68C93E),
//     child: Text('Scan Pesanan Masukkk'),
//     onPressed: () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Status(),
//         ),
//       );
//     },
//   ),
// ),
//       ],
//     ),
//   ),
// );

//   }
// }
// }
