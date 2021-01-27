import 'package:flutter/material.dart';
import 'package:ketiga/models/product.dart';
import 'package:ketiga/screens/ui/history/detail_receive.dart';
import 'package:ketiga/services/product_service.dart';
import 'package:ketiga/services/stock_service.dart';

class IsiReceive extends StatelessWidget {
  // final int index;
  // const IsiReceive(this.index, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
    future: ProductService().getProduct(),
    builder: (_, snapshot) {
    if (!snapshot.hasData) return Container();
    List<Product> produk = snapshot.data;
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: produk.length,
      itemBuilder: (BuildContext context, int index) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailReceive(index),
                    ),
                  );
          },
            child: Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            produk[index].namaProduk,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Kode Produk'),
                      Text(
                        produk[index].kodeProduk,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Color(0xff68C93E)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Jumlah : ${produk[index].stok}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  });}
}
