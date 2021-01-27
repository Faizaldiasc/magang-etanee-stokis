import 'package:flutter/cupertino.dart';
import 'package:ketiga/models/user_account.dart';
// import 'package:ketiga/services/user_services.dart';

enum AuthState {
  Authenticated,
  Unauthencticated
}

class AuthNotifier with ChangeNotifier{
  AuthState _status = AuthState.Unauthencticated;
  UserAccount _account = UserAccount(name: "Anonim", login: false);
  

  set status(AuthState s){
    _status = s;
    notifyListeners();
  }

  get status => _status;

  get userAccount => _account;

  set userAccount(UserAccount ua){
    _account = ua;
    notifyListeners();
  }

  void updateNamePhone(String name, String phone){
    _account.name = name;
    _account.phoneNumber = phone;
    notifyListeners();
  }

  Future signOut() async {
    _status = AuthState.Unauthencticated;
    _account = UserAccount(name: "a", login: true);
    notifyListeners();
    // return Future.delayed(Duration.zero);
  } 
}