import 'package:flutter/material.dart';
import 'package:ketiga/screens/ui/history/isi_deliver.dart';

class DeliverOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: 20.0,
            ),
            IsiDeliver(),
          ],
        ),
      ),
    );
  }
}