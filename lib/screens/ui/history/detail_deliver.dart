import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/screens/scanner/order_scanner.dart';
import 'package:ketiga/screens/scanner/scanner.dart';
import 'package:ketiga/screens/ui/deliver_product.dart';
import 'package:ketiga/screens/ui/home_page.dart';

class DetailDeliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Detail Pesanan')
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.only(top: 20),
                // ),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Order Id : ABC - 12345',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Tanggal Penerimaan : 22 Januari 2020',
                          style: TextStyle(
                            color: Color(0XFF828282),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 16.0,
                          offset: Offset(
                            0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Informasi Pengiriman',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Nama Penerima",
                                        // stocks[index].quantity.toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Text(
                                        'Akbar',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height:10),
                                  Divider(color: Colors.grey,),
                                  SizedBox(height:10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Nama Pengirim',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                        ),),
                                      Text(
                                        'Faizal',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                        ),
                                      ),  
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height:5),
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 16.0,
                          offset: Offset(
                            0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(children: <Widget>[
                          Text('Nama Produk', style: TextStyle(fontWeight: FontWeight.bold),)
                        ],),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Container(
                                width: 56.0,
                                height: 56.0,
                                color: Color(0xff68C93E),
                                child: SvgPicture.asset(
                                    'assets/svg/scalaton.svg')),
                            SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Ayam 0.8 - 0.9 Kg Potong 10 Bagian [1 Karton isi 15 Pack]',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Jumlah : 2",
                                        // stocks[index].quantity.toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:10),
                        Divider(color: Colors.grey,),
                        Row(
                          children: <Widget>[
                            Container(
                                width: 56.0,
                                height: 56.0,
                                color: Color(0xff68C93E),
                                child: SvgPicture.asset(
                                    'assets/svg/scalaton.svg')),
                            SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Ayam 0.8 - 0.9 Kg Potong 10 Bagian [1 Karton isi 15 Pack]',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Jumlah : 2",
                                        // stocks[index].quantity.toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
