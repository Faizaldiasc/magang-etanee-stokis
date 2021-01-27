import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';
import 'package:ketiga/screens/order/main_sku_page.dart';
import 'package:ketiga/screens/ui/home_page.dart';


class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.white,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 70.0),
                  child: SvgPicture.asset('assets/svg/checklist.svg'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    'Berhasil',
                    style: TextStyle(
                      color: Color(0xFF68C93E),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text('Produk berhasil disimpan, stok sudah bertambah'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  textColor: Color(0xff68C93E),
                  color: Colors.white,
                  child: Center(
                    child: Text('Ke Halaman Utama'),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (_) => BottomNav(0)),
                        (Route<dynamic> route) => false);
                  },
                ),
                SizedBox(height: 5),
                RaisedButton(
                  textColor: Colors.white,
                  color: Color(0xff68C93E),
                  child: Center(
                    child: Text('Lihat Stok'),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => MainSkuPage(),),);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}