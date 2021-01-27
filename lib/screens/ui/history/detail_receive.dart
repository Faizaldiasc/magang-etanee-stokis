import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/services/detail_pesanan_service.dart';
import 'package:ketiga/models/pesanan_detail.dart';

class DetailReceive extends StatelessWidget {
  final int index;
  const DetailReceive(this.index, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Rincian Penerimaan Produk'),
        ),
        body: FutureBuilder<List<DetailPesanan>>(
            future: DetailPesananService().getdetailPesanan(),
            builder: (_, snapshot) {
              if (!snapshot.hasData) return Container();
              List<DetailPesanan> dp = snapshot.data;
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 300.0,
                              child: dp[index].product[0].foto != null
                              ? Image.network(dp[index].product[0].foto)
                              : SvgPicture.asset('assets/svg/scalaton.svg')
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        '${dp[index].product[0].namaProduk}',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Jumlah'),
                                      Text('${dp[index].product[0].stok}')
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Kode SKU'),
                                      Text('${dp[this.index].product[0].kodeProduk}')
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 16),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),

        // Column(
        //   children: <Widget>[
        //     Expanded(
        //       child: Column(
        //         children: <Widget>[
        //           Stack(
        //             children: <Widget>[
        //               Container(
        //                 height: 300.0,
        //                 child: SvgPicture.asset(
        //                 'assets/svg/scalaton.svg',
        //                 height: 300.0,
        //           ),
        //               ),
        //             ],
        //           ),
        //           Padding(
        //             padding: EdgeInsets.all(16.0),
        //             child: Column(
        //               children: <Widget>[
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: <Widget>[
        //                     Column(
        //                       children: <Widget>[
        //                         Text(
        //                           'Ayam 0.8 - 0.9 Kg Potong 10 Bagian [1 Karton isi 15 Pack]',
        //                           style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),
        //                         ),
        //                       ],
        //                     ),
        //                     Divider(
        //                       color: Colors.black,
        //                     ),
        //                     SizedBox(height:10),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: <Widget>[
        //                         Text('Jumlah'),
        //                         Text('10 karton')
        //                       ],
        //                     ),
        //                     SizedBox(height:10),
        //                     Divider(
        //                       color: Colors.black,
        //                     ),
        //                     SizedBox(height:10),
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                       children: <Widget>[
        //                         Text('Kode SKU'),
        //                         Text('01 Januari 2020')
        //                       ],
        //                     ),
        //                     SizedBox(height:10),
        //                     Divider(
        //                       color: Colors.black,
        //                     ),
        //                     SizedBox(height:16),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
