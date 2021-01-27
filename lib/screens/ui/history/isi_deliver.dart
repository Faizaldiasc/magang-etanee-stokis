import 'package:flutter/material.dart';
import 'package:ketiga/models/pengiriman_model.dart';
import 'package:ketiga/models/pesanan.dart';
import 'package:ketiga/models/stock.dart';
import 'package:ketiga/screens/ui/history/detail_deliver.dart';
import 'package:ketiga/services/pengiriman_service.dart';
import 'package:ketiga/services/pesanan_masuk_service.dart';
import 'package:ketiga/services/stock_service.dart';

class IsiDeliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pengiriman>>(
        future: RiwayaPengirimanService().getRiwayatPengiriman(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) return Container();
          List<Pengiriman> pengiriman = snapshot.data;
          return ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: pengiriman.length,
            itemBuilder: (BuildContext context, int index) => (pengiriman[index]
                    .pesanan
                    .isEmpty)
                ? Container()
                : Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    child: Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 7.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  pengiriman[index].kodeProduk,
                                  style: TextStyle(color: Color(0xff68C93E)),
                                ),
                                Text(pengiriman[index]
                                    .pesanan[0]
                                    .tanggalPesanan),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Text('Nama Penerima  : '),
                                SizedBox(width: 5),
                                Text(
                                  pengiriman[index].pesanan[0].pemesan,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 140),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailDeliver()));
                                  },
                                  child: Icon(Icons.navigate_next),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text('Nama Pengemudi :'),
                                SizedBox(width: 5),
                                Text(
                                  pengiriman[index].pesanan[0].pengirim,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: <Widget>[
                                Text('Jumlah :'),
                                SizedBox(width: 5),
                                Text(
                                  '${pengiriman[index].stok}',
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
        });
  }
}
