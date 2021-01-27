import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/models/product.dart';
import 'package:ketiga/screens/order/detail_product.dart';
import 'package:ketiga/services/product_service.dart';
import 'package:ketiga/services/stock_service.dart';

class ListProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: ProductService().getProduct(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) return Container();
          List<Product> produks = snapshot.data;
          return ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: produks.length,
            itemBuilder: (BuildContext context, int index) => Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProduct(produks[index]),
                    ),
                  );
                },
                child: Card(
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
                                width: 70.0,
                                height: 70.0,
                                child: produks[index].foto != null
                                    ? Image.network(produks[index].foto)
                                    : SvgPicture.asset('assets/svg/scalaton.svg')),
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
                                    produks[index].namaProduk,
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
                                    "Stok : ${produks[index].stok}",
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
              ),
            ),
          );
        });
  }
}
