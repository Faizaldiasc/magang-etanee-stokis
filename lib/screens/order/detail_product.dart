import 'package:flutter/material.dart';
import 'package:ketiga/models/stock.dart';
import 'package:ketiga/models/product.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';

class DetailProduct extends StatelessWidget {
  final Product products;
  DetailProduct(this.products);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: products.foto != null
                                ? NetworkImage(products.foto)
                                : SvgPicture.asset('assets/svg/scalaton.svg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.42, top: 20.41),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (_) => BottomNav(0)),
                              (Route<dynamic> route) => false);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          products.namaProduk,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                'Informasi SKU',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(height: 16.0),
                              Text("${products.infromasiProduk}"),
                              SizedBox(height: 16.0),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Kode SKU',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                products.kodeProduk,
                                style: TextStyle(color: Color(0xff68C93E)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Stok Tersisa',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('${products.stok}'),
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Bobot Product',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('${products.bobotProduk} Gram')
                            ],
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Harga',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Rp ${products.harga}')
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Center(
                                child: ButtonTheme(
                                  minWidth: 400.0,
                                  child: RaisedButton(
                                    textColor: Colors.white,
                                    color: Color(0xff68C93E),
                                    child: Text('Ke Halaman Utama'),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => BottomNav(0)),
                                          (Route<dynamic> route) => false);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
