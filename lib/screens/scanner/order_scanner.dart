import 'package:flutter/material.dart';
import 'package:ketiga/services/delete_product.dart';
import 'package:toast/toast.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:ketiga/models/pesanan_detail.dart';
import 'package:ketiga/models/product.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';
import 'package:ketiga/screens/ui/deliver_product.dart';
import 'package:ketiga/screens/ui/hasil_scan_sku.dart';
import 'package:ketiga/services/detail_pesanan_service.dart';
import 'package:ketiga/services/product_service.dart';
import 'package:ketiga/services/terima_pesanan_service.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

class ScanPengeluaran extends StatefulWidget {
  final String idPesanan;
  final String foto;
  final String namaProduk;
  final String kodeProduk;
  final String informasiProduk;
  final int stok;
  final int bobotProduk;
  final int harga;

  const ScanPengeluaran(
      this.idPesanan,
      this.foto,
      this.namaProduk,
      this.kodeProduk,
      this.informasiProduk,
      this.stok,
      this.bobotProduk,
      this.harga,
      {Key key})
      : super(key: key);

  @override
  _ScanPengeluaranState createState() => _ScanPengeluaranState();
}

class _ScanPengeluaranState extends State<ScanPengeluaran> {
  GlobalKey qrKey = GlobalKey();
  var qrText = "";
  //String idPesanan, foto, namaProduk, kodeProduk, informasiProduk;
  //int stok, bobotProduk, harga;
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
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => BottomNav(0)),
                                (Route<dynamic> route) => false);
                          },
                          child: Icon(Icons.close)),
                      SizedBox(width: 20),
                      Text(
                        'Scan Pesanan Masuk',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
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
                  SizedBox(height: 10),
                  Text('Atau masukkan kode di bawah ini'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 10),
                      ),
                      Container(
                        height: 70,
                        width: 198,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: TextFormField(
                            maxLines: null,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: ('$qrText' == "")
                                    ? "masukkan kode produk"
                                    : "$qrText"),
                            onChanged: (value) {
                              qrText = "$value";
                            }),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Container(
                          height: 55,
                          width: 123,
                          child: InkWell(
                              child: RaisedButton(
                                  child: Text(
                                    'Validasi',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color(0xff34DE6E),
                                  onPressed: () {
                                    print(widget.idPesanan);
                                    print(widget.namaProduk);
                                    print(widget.foto);
                                    print(widget.kodeProduk);
                                    print(widget.informasiProduk);
                                    print(widget.stok);
                                    print(widget.harga);
                                    print(widget.bobotProduk);
                                    CreateHistoryService().getCreateHistory(
                                      widget.idPesanan,
                                      widget.namaProduk,
                                      widget.foto,
                                      widget.kodeProduk,
                                      widget.informasiProduk,
                                      widget.stok,
                                      widget.harga,
                                      widget.bobotProduk,
                                    );
                                    DeleteProductService()
                                        .delete(widget.kodeProduk);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Status()));
                                  })),
                        ),
                      ),
                    ],
                  )
                ],
              )),
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
