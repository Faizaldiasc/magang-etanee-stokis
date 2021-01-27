import 'package:flutter/material.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';
import 'package:ketiga/screens/ui/hasil_scan_sku.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

class ScanPenerimaan extends StatefulWidget {
  @override
  _ScanPenerimaanState createState() => _ScanPenerimaanState();
}

class _ScanPenerimaanState extends State<ScanPenerimaan> {
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xff68C93E),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                              builder: (_) => BottomNav(0)), (Route<dynamic> route) => false);
                        },
                        child: Icon(Icons.close)),
                      SizedBox(width: 20),
                      Text(
                        'Scan untuk menerima produk',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Row(
          //     children: <Widget>[
          //       Icon(Icons.close),
          //       SizedBox(width: 20.0)
          //     ],
          //   ),
          // ),
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                borderRadius: 5,
                borderColor: Color(0xff34DE6E),
                borderLength: 10,
                borderWidth: 10,
                cutOutSize: 250,
              ),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height:10),
                  Text('Atau masukkan kode di bawah ini'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 20, right:10),),
                      Container(
                        height: 70,
                        width: 198,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: TextField(
                          maxLines: null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: ('$qrText' == "") ? "masukkan kode produk" : "$qrText" 
                          ),
                        ),
                      ),
                      SizedBox(width:3),
                      Container(
                        height: 55,
                        width: 123,
                         child: InkWell(
                          child: RaisedButton(
                           child: Text('Validasi', style: TextStyle(color: Colors.white),),
                           color: Color(0xff34DE6E), 
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => HasilScanPenerimaan('$qrText')
                              ));
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }


  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
