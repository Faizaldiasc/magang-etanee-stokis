import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/models/user_account.dart';
import 'package:ketiga/notifier/notifier_user_account.dart';
import 'package:ketiga/screens/auth/forgot_password.dart';
import 'package:ketiga/services/user_services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 70, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 80),
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/svg/login_logo.svg',
                  height: 100.0,
                ),
              ),
              SizedBox(
                height: 29.0,
              ),
              Padding(
                padding: EdgeInsets.only(right: 250.0),
                child: Text('Email',
                style: TextStyle(
                  color: Colors.black
                ),),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
              width: 288,
              child: TextField(
                controller: _emailController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Email",
                  contentPadding: EdgeInsets.all(8),
                  // labelText: "Email",
                ),
              ),
            ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(right: 220.0),
                child: Text('Password', 
                style: TextStyle(
                  color: Colors.black
                ),),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
              width: 288,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 1.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Password",
                  contentPadding: EdgeInsets.all(8),
                  // labelText: "Email",
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
                onTap: () {
                  final result = Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ForgotPassword(),
                    ),
                  );
                  // result.then(
                  //   (r) => _scaffoldKey.currentState.showSnackBar(
                  //     (r),
                  //   ),
                  // );
                },
                  child: Padding(padding: EdgeInsets.only(left:195.0),
                    child: Text(
                      "Lupa kata sandi?",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 288 ,
                height: 50,
                child: RaisedButton(
                  color: Color(0xff34DE6E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Text('Masuk', style: TextStyle(color: Colors.white),),
                  onPressed: () {
                      _login();
                    },
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Container(
                  child: SvgPicture.asset('assets/svg/image_bottom.svg'),
                  alignment: Alignment(0.0,0.3),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void showError(message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message),));
  }
  bool _validate() {
    if(_emailController.text.isEmpty && _passwordController.text.isEmpty){
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('email dan password tidak boleh kosong'),));
      return false;
    }
    if(_emailController.text.isEmpty){
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('email harus di isi'),));
      return false;
    }
    if(_passwordController.text.isEmpty){
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('password harus di isi'),));
      return false;
    }
    return true;
  }
  void _login() async {
    if(!_validate()) return;
    final auth = Provider.of<UserAccountService>(context);
    final notifier = Provider.of<AuthNotifier>(context);
    
    UserAccount userAccount = await auth
    .login(_emailController.text, _passwordController.text)
    .catchError((e) => showError(e.response.data['message']));

    if(userAccount != null){
      notifier.userAccount = userAccount;
      notifier.status = AuthState.Authenticated;
    }
  }
}
