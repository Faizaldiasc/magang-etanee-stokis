import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/screens/ui/accept_scan_sku.dart';

class AcceptDetailSku extends StatelessWidget {
  final List<String> kode = [
    "ABC - 01",
    "ABC - 02",
    "ABC - 03",
  ];
  final List date = [
    "02 Januari 2020, 09:00",
    "03 Januari 2020, 19:00",
    "04 Januari 2020, 20:00",
  ];
  final List produk = [
    "Ayam 0.8 - 0.9 Kg Potong 10 Bagian [1 Karton isi 15 Pack]",
    "Ayam Horeka [0.7 - 0.9 Ons]",
    "Lectuce Head 250 Gram",
  ];
  final List quantity = [
    "100",
    '200',
    "300",
  ];
  final List driver = [
    "darkoooo",
    "amin",
    "rozak",
  ];
  @override
  Widget build(BuildContext context) {
    // return FutureBuilder<List<Stock>>(
    //     future: StockService().getStock(),
    //     builder: (_, snapshot) {
    //       if (!snapshot.hasData) return Container();
    //       List<Stock> stocks = snapshot.data;
          return ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: produk.length,
            itemBuilder: (BuildContext context, int index) => Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            kode[index],
                            style: TextStyle(color: Color(0xff68C93E)),
                          ),
                          Text(date[index]),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AcceptScanSku(),
                                    ),
                                  );
                                },
                              child: Container(
                                width: 70.0,
                                height: 70.0,
                                color: Color(0xff68C93E),
                                child: SvgPicture.asset('assets/svg/scalaton.svg'),
                              ),
                            ),
                            SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  produk[index],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Jumlah'),
                          Text(
                            quantity[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Suplier'),
                          Text(
                            driver[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
  }
