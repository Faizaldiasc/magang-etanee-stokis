import 'package:flutter/material.dart';

class OrderEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/empty_cart.png",
            width: 300,
          ),
          // Text(
          //   "tidak ada pesanan",
          //   style: TextStyle(color: Colors.grey),
          // ),
        ],
      ),
    );
  }
}
