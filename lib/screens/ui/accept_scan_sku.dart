import 'package:flutter/material.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';
import 'package:ketiga/screens/ui/accept_sku.dart';
// import 'package:ketiga/screens/ui/home_page.dart';

class AcceptScanSku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/ayam1.png',
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AcceptOfSku(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'ABC - 01',
                      style: TextStyle(color: Color(0xff68C93E)),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      'Ayam 0.8 - 0. Kg Potong 10 Bagian [1 Karton isi 15 Pack]',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Informasi Penerimaan SKU',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Jumlah '),
                        Text(
                          '100',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Stok'),
                        Text('1000'),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Tanggal Terima'),
                        Text('02 Januari 2020'),
                      ],
                    ),
                    SizedBox(
                      height: 96.0,
                    ),
                    Center(
                      child: ButtonTheme(
                        minWidth: 400.0,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Color(0xff68C93E),
                          child: Text('Scan Penerimaan Sku'),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => BottomNav(0)),
                                (Route<dynamic> route) => false);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
