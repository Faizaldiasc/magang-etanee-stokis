import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/models/user_account.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';
import 'package:ketiga/screens/order/list_product_home.dart';
import 'package:ketiga/screens/scanner/order_scanner.dart';
import 'package:ketiga/screens/scanner/scanner.dart';
import 'package:ketiga/screens/users/home_profile_users.dart';
import 'package:provider/provider.dart';
import 'package:ketiga/notifier/notifier_user_account.dart';
import 'package:ketiga/screens/ui/accept_sku.dart';
import 'package:ketiga/screens/ui/deliver_page.dart';
import 'package:ketiga/screens/order/list_product.dart';
import 'package:ketiga/screens/order/main_sku_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    AuthNotifier notifier = Provider.of<AuthNotifier>(context, listen: false);
    UserAccount userAccount = notifier.userAccount;
    if(userAccount == null) return Container();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff68C93E),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
           SvgPicture.asset(
                "assets/svg/stockis_logo.svg",
                height: 40,
                width: 40,
            ),
            SizedBox(
              width: 20,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (_) => BottomNav(2)),
                        (Route<dynamic> route) => false);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: Icon(
                      Icons.person,
                      color: Color(0xff68C93E),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width / 2.3,
                decoration: BoxDecoration(
                  color: Color(0xff68C93E),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Center(
                    child: Text(
                      "Halo, ${userAccount.name}",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      "Selamat Datang di Etanee Stokis",
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AcceptOfSku(),
                              ),
                            );
                          },
                          child: Container(
                            height: 114,
                            width: 101,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 16.0,
                                    offset: Offset(
                                      0,
                                      2.0,
                                    ))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                ),
                                SvgPicture.asset('assets/svg/accep_sku_icon.svg'),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Text('Penerimaan Produk',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 13.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeliverPage(),
                              ),
                            );
                          },
                          child: Container(
                            height: 114,
                            width: 101,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 16.0,
                                    offset: Offset(
                                      0,
                                      2.0,
                                    ))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                ),
                                SvgPicture.asset('assets/svg/order_icon.svg'),
                                SizedBox(
                                  height: 12.0,
                                ),
                                Text(
                                  'Pesanan',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Masuk',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 13.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainSkuPage(),
                              ),
                            );
                          },
                          child: Container(
                            height: 114,
                            width: 101,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 16.0,
                                    offset: Offset(
                                      0,
                                      2.0,
                                    ),)
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                ),
                                SvgPicture.asset('assets/svg/list_product_icon.svg'),
                                SizedBox(
                                  height: 21.0,
                                ),
                                Text(
                                  'Daftar',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Produk',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    // onTap: () {
                    //   Navigator.pushReplacement(
                    //    context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ScanPenerimaan(),
                    //     ),
                    //   );
                    //   },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 12.0),
                            Container(
                              width: 50,
                              height: 50,
                              child: SvgPicture.asset('assets/svg/logo_scan.svg')),
                            SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 13.0),
                                Text('Scan', style: TextStyle(color: Colors.white),),
                                Text('Perimanaan', style: TextStyle(color: Colors.white),),
                                Text('Sku',style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ],
                        ),
                        height: 76,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Color(0xff34DE6E),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  SizedBox(
                    width: 8.0,
                  ),
                  GestureDetector(
                    /*onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScanPengeluaran(),
                      ),
                    );
                    },*/
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 12.0),
                            Container(
                              width: 50,
                              height: 50,
                              child: SvgPicture.asset('assets/svg/logo_scan1.svg')),
                            SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 13.0),
                                Text('Scan', style: TextStyle(color: Colors.white),),
                                Text('Pengeluaran', style: TextStyle(color: Colors.white),),
                                Text('Sku',style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ],
                        ),
                      height: 76,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Color(0xffFFC962),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Daftar SKU Terbaru',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Lihat Semua',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff68C93E)),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListProductHome(),
        ],
      ),
    );
  }
}
