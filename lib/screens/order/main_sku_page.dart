import 'package:flutter/material.dart';
import 'package:ketiga/screens/order/list_product.dart';


class MainSkuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(top: .0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 40.0,
                    child: TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // hintText: 'Cari nama SKU disini',
                      ),
                    ),
                  
                ),
              ),
              SizedBox(width: 16.0),
              Icon(
                  Icons.format_list_bulleted,
                  size: 25.0,
                ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListProduct(),
        ],
      ),
    );
  }
}
