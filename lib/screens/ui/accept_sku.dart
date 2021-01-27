import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ketiga/screens/scanner/order_scanner.dart';
import 'package:ketiga/screens/scanner/scanner.dart';
import 'package:ketiga/screens/ui/accept_detail_sku.dart';
// import 'package:ketiga/screens/ui/home_page.dart';

class AcceptOfSku extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Text(
              'Daftar Penerimaan SKU',
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 15),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                ),
                Expanded(
                  child: Container(
                    height: 60.0,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF2F2F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Cari nama SKU disini",
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Icon(Icons.format_list_bulleted)
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey,
            ),
            SizedBox(height: 10),
            Center(
                child: Text(
              'Belum ada produk masuk',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            SizedBox(height: 20),
            Container(
              height: 40,
              child: RaisedButton(
                textColor: Colors.white,
                child: Text('Scan Penerimaan Produk'),
                color: Color(0xff68C93E),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScanPenerimaan(),
                    ),
                  );
                },
              ),
            ),
            // AcceptDetailSku(),
          ],
        ),
      ),
    );
  }
}
