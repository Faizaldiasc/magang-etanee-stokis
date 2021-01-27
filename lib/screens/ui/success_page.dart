
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/screens/ui/home_page.dart';
// import 'package:barcode_scan/barcode_scan.dart';


class SuccessOfProduct extends StatefulWidget {
  @override
  _SuccessOfProductState createState() => _SuccessOfProductState();
  
}

class _SuccessOfProductState extends State<SuccessOfProduct> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                Text(barcode, textAlign: TextAlign.center),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, left: 20.0, right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Tanggal Terima',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                '01 Januari 2021',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 16.0, left: 20.0, right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nama Supplier',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                'Fanny Rifqi',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16.0, left: 20.0, right: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nama SKU',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                'Ayam 0.8 - 0.9 Kg Potong 10 Bagian [1 Karton isi 15 Pack]',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.0, left: 20.0, right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Kode SKU',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                '123456',
                                style: TextStyle(color: Color(0xff68C93E)),
                              ),
                              SizedBox(
                                height: 16.0,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Jumlah', style: TextStyle(fontSize: 16.0 ),),
                              SizedBox(width: 250,),
                              Text('Stok', style: TextStyle(fontSize: 16.0 ),),
                              Divider(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('100', style: TextStyle(fontSize: 16.0 ),),
                              SizedBox(width: 262,),
                              Text('10', style: TextStyle(fontSize: 16.0 ),),
                            ],
                          ),
                        ),
                        Divider(),
                        Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Tanggal Kadaluarsa',
                              ),
                              subtitle: Text(
                                '10 Maret 2020',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Icon(Icons.crop_original),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                'Tanggal Kadaluarsa',
                              ),
                              subtitle: Text(
                                '10 Maret 2020',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Icon(Icons.crop_original),
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
                ButtonTheme(
                  minWidth: 380.0,
                  height: 40.0,
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Color(0xff68C93E),
                    child: Text('Ke Halaman Utama'),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
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

// class SuccessOfProduct extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: EdgeInsets.only(top: 70.0),
//                   child: SvgPicture.asset('assets/svg/checklist.svg'),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Center(
//                   child: Text(
//                     'Berhasil',
//                     style: TextStyle(
//                       color: Color(0xFF68C93E),
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Text(barcode),
//                 Container(
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
//                   child: Card(
//                     child: Column(
//                       children: <Widget>[
//                         Padding(
//                           padding: EdgeInsets.only(
//                               top: 16.0, left: 20.0, right: 20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 'Tanggal Terima',
//                                 style: TextStyle(fontSize: 16.0),
//                               ),
//                               SizedBox(
//                                 height: 8.0,
//                               ),
//                               Text(
//                                 '01 Januari 2021',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 8.0,
//                               ),
//                               Divider(),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               top: 16.0, left: 20.0, right: 20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 'Nama Supplier',
//                                 style: TextStyle(fontSize: 16.0),
//                               ),
//                               SizedBox(
//                                 height: 8.0,
//                               ),
//                               Text(
//                                 'Fanny Rifqi',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 8.0,
//                               ),
//                               Divider(),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(top: 16.0, left: 20.0, right: 24.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 'Nama SKU',
//                                 style: TextStyle(fontSize: 16.0),
//                               ),
//                               SizedBox(
//                                 height: 8.0,
//                               ),
//                               Text(
//                                 'Ayam 0.8 - 0.9 Kg Potong 10 Bagian [1 Karton isi 15 Pack]',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 10.0,
//                               ),
//                               Divider(),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                               top: 10.0, left: 20.0, right: 20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                 'Kode SKU',
//                                 style: TextStyle(fontSize: 16.0),
//                               ),
//                               SizedBox(
//                                 height: 8.0,
//                               ),
//                               Text(
//                                 '123456',
//                                 style: TextStyle(color: Color(0xff68C93E)),
//                               ),
//                               SizedBox(
//                                 height: 16.0,
//                               ),
//                               Divider(),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Text('Jumlah', style: TextStyle(fontSize: 16.0 ),),
//                               SizedBox(width: 250,),
//                               Text('Stok', style: TextStyle(fontSize: 16.0 ),),
//                               Divider(),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Text('100', style: TextStyle(fontSize: 16.0 ),),
//                               SizedBox(width: 262,),
//                               Text('10', style: TextStyle(fontSize: 16.0 ),),
//                             ],
//                           ),
//                         ),
//                         Divider(),
//                         Column(
//                           children: <Widget>[
//                             ListTile(
//                               title: Text(
//                                 'Tanggal Kadaluarsa',
//                               ),
//                               subtitle: Text(
//                                 '10 Maret 2020',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               trailing: Icon(Icons.crop_original),
//                             ),
//                             Divider(),
//                             ListTile(
//                               title: Text(
//                                 'Tanggal Kadaluarsa',
//                               ),
//                               subtitle: Text(
//                                 '10 Maret 2020',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               trailing: Icon(Icons.crop_original),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 ButtonTheme(
//                   minWidth: 380.0,
//                   height: 40.0,
//                   child: RaisedButton(
//                     textColor: Colors.white,
//                     color: Color(0xff68C93E),
//                     child: Text('Ke Halaman Utama'),
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => HomePage(),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }