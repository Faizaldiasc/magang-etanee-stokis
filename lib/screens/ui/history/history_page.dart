import 'package:flutter/material.dart';
import 'package:ketiga/screens/ui/history/deliver_order.dart';
import 'package:ketiga/screens/ui/history/receive_page.dart';


class HistoryPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Riwayat Pesanan"),
        bottom: new TabBar(
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          controller: controller,
          //source code lanjutan
          tabs: <Widget>[
            new Tab(
              text: "Penerimaan",
            ),
            new Tab(
              text: "Penggiriman",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          ReceivePage(),
          DeliverOrder(),
          // OrderOnProgress(),
          // OrderFinish(10),
          // OrderFinish(11),
        ],
      ),
    );
  }
}
