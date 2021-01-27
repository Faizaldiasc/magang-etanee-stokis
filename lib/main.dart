import 'package:flutter/material.dart';
import 'package:ketiga/models/user_account.dart';
import 'package:ketiga/notifier/notifier_user_account.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';
import 'package:ketiga/screens/users/login_user.dart';
import 'package:ketiga/services/stock_service.dart';
import 'package:provider/provider.dart';
import 'package:ketiga/services/user_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      Provider<UserAccountService>(
        create: (_) => UserAccountService(),),
      ChangeNotifierProvider<AuthNotifier>(
        create: (_) => AuthNotifier(),),
      Provider<UserAccount>.value(value: UserAccount(name: "", email: "", phoneNumber: ""),),
      Provider<StockService>(
        create: (_) => StockService(),)
    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffFFB321),
        accentColor: Colors.white,
        
      ),
      home: Consumer<AuthNotifier>(
        builder: (_, authNotifier, __){
          switch (authNotifier.status){
            case AuthState.Authenticated:
              return BottomNav(0);
            case AuthState.Unauthencticated:
              return LoginPage();
          default: 
            return LoginPage();
          }
        }
      ),
    ));
    
  }
}

