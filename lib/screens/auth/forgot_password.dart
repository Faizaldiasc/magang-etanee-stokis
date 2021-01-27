import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/screens/auth/action_button.dart';
import 'package:ketiga/services/user_services.dart';

class ForgotPassword extends StatelessWidget {
  final ctrl = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(17, 25, 17, 25),
        child: Column(
          children: <Widget>[
            SizedBox(height: 40),
            Center(
              child: SvgPicture.asset(
                  'assets/svg/login_logo.svg',
                  height: 70.0,
                ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.black,
              thickness: 0.1,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Perbaruhi kata sandi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff34DE6E),
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 45,
              child: TextField(
                controller: ctrl,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff34DE6E), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff34DE6E), width: 1.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Email",
                  contentPadding: EdgeInsets.all(8),
                  // labelText: "Email",
                ),
              ),
            ),
            SizedBox(height: 10),
            ActionButton(
              "Lupa kata sandi",
              () async {
                if (ctrl.text.isEmpty) {
                  showMessage("Email harus diisi");
                  return;
                }
                await UserAccountService()
                    .forgotPassword(ctrl.text)
                    .catchError((e) => showMessage(e.response.data["message"]));
                Navigator.pop(
                  context,
                  "Link untuk reset password telah dikirimkan ke email Anda",
                );
              },
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                "Kembali ke halaman Masuk",
                style: TextStyle(color: Color(0xff34DE6E)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showMessage(String message) {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}