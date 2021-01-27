import 'package:flutter/material.dart';
import 'package:ketiga/models/pesanan.dart';
import 'package:ketiga/models/product.dart';
import 'package:ketiga/models/terima_produk_masuk.dart';
import 'package:ketiga/models/terima_scan.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';
import 'package:ketiga/screens/ui/deliver_product.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/services/pesanan_masuk_service.dart';
import 'package:ketiga/services/product_service.dart';
import 'package:ketiga/services/produk_masuk_service.dart';
import 'package:ketiga/services/terima_scan_service.dart';
import 'package:ketiga/services/submit_product.dart';

class HasilScanPenerimaan extends StatelessWidget {
  final String kodeProduk;
  const HasilScanPenerimaan(this.kodeProduk, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 1,
          backgroundColor: Color(0xff68C93E),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 15),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(Icons.arrow_back),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => BottomNav(0)),
                        (Route<dynamic> route) => false);
                  },
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Hasil Penerimaan SKU',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            FutureBuilder(
                future: TerimaProdukService().getProdukMasuk(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData) return Container();
                  List<TerimaProduk> produk = snapshot.data;
                  {
                    return ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: produk.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (produk[index].kodeProduk == this.kodeProduk) {
                            return Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 5.0),
                                  child: GestureDetector(
                                    // onTap: () {
                                    //   Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => DetailProduct(produk[index]),
                                    //     ),
                                    //   );
                                    // },
                                    child: Card(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
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
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          color: Colors.white,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Container(
                                                    width: 56.0,
                                                    height: 56.0,
                                                    child: produk[index].foto !=
                                                            null
                                                        ? Image.network(
                                                            produk[index].foto)
                                                        : SvgPicture.asset(
                                                            'assets/svg/scalaton.svg')),
                                                SizedBox(
                                                  width: 16.0,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: 8.0,
                                                      ),
                                                      Text(
                                                        produk[index]
                                                            .namaProduk,
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 8.0,
                                                      ),
                                                      Text(
                                                        "Stok : ${produk[index].stok}",
                                                        // stocks[index].quantity.toString(),
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 17.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, bottom: 10),
                                  height: 40.0,
                                  child: RaisedButton(
                                    textColor: Colors.white,
                                    color: Color(0xff68C93E),
                                    child: Text('Submit'),
                                    onPressed: () {
                                      SubmitProdukService().getSubmitProduk(
                                          produk[index].id,
                                          produk[index].foto,
                                          produk[index].namaProduk,
                                          produk[index].kodeProduk,
                                          produk[index].informasiProduk,
                                          produk[index].stok,
                                          produk[index].harga,
                                          produk[index].bobotProduk);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Status(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                          return Container();
                        });
                  }
                }),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
