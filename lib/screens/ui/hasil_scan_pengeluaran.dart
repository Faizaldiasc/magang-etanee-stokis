import 'package:flutter/material.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';
import 'package:ketiga/screens/ui/deliver_product.dart';
import 'package:flutter_svg/svg.dart';

class HasilScanPengeluaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        backgroundColor: Colors.white,),
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
                    Row(
                      children: <Widget>[
                        Container(
                            width: 56.0,
                            height: 56.0,
                            color: Color(0xff68C93E),
                            child: SvgPicture.asset('assets/svg/scalaton.svg')),
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
                                'Nama Productt',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "Stok : ",
                                // stocks[index].quantity.toString(),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
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
            SizedBox(
              height: 20.0,
            ),
            // ButtonTheme(
            //   minWidth: 380.0,
            //   height: 40.0,
            //   child: RaisedButton(
            //     textColor: Colors.white,
            //     color: Color(0xff68C93E),
            //     child: Text('Submit'),
            //     onPressed: () {
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Status(),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              height: 40.0,
              child: RaisedButton(
                textColor: Colors.white,
                color: Color(0xff68C93E),
                child: Text('Submit'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Status(),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
