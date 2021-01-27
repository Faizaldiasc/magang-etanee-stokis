import 'package:flutter/material.dart';
import 'package:ketiga/models/pesanan_detail.dart';
import 'package:ketiga/screens/scanner/order_scanner.dart';
import 'package:ketiga/services/detail_pesanan_service.dart';

class OrderDetail extends StatelessWidget {
  final int index;
  const OrderDetail(this.index, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text('Detail Pesanan')],
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<DetailPesanan>>(
          future: DetailPesananService().getdetailPesanan(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) return Container();
            List<DetailPesanan> dp = snapshot.data;
            return Container(
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        "Order id : ${dp[this.index].idPesanan}",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        dp[index].pemesan,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFFF4873D)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Tanggal Pengeluaran : ${dp[this.index].tanggalPesanan}',
                        style: TextStyle(
                          color: Color(0XFF828282),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.black,
                      thickness: 0.9,
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Color(0xfff9f6f7).withOpacity(1.0),
                          spreadRadius: 20,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 15),
                              Container(
                                  width: 90,
                                  height: 70,
                                  child: Image.network(
                                      dp[this.index].product[0].foto),
                              ),
                              SizedBox(width: 15),
                              Text(
                                  "Nama Produk : ${dp[this.index].product[0].namaProduk}"),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    ButtonTheme(
                      minWidth: 330.0,
                      height: 40.0,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff68C93E),
                        child: Text('Scan Produk'),
                        onPressed: () {
                          print("test");
                          print('${dp[this.index].product[0].namaProduk}');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScanPengeluaran(
                                '${dp[this.index].id}',
                                '${dp[this.index].product[0].foto}',
                                '${dp[this.index].product[0].namaProduk}',
                                '${dp[this.index].product[0].kodeProduk}',
                                '${dp[this.index].product[0].informasiProduk}',
                                dp[this.index].product[0].harga,
                                dp[this.index].product[0].bobotProduk,
                                dp[this.index].product[0].stok,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
