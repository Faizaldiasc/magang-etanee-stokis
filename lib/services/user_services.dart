import 'package:ketiga/dio_config.dart';
import 'package:dio/dio.dart';
import 'package:ketiga/models/user_account.dart';

class UserAccountService{
  // final String googleId;
  // UserAccountService(this.googleId);
  Future<UserAccount> login(String email, String password) async {
    Map param = {
      "email" : email,
      "password" : password
    };
    Response response = await DioConfig.get().post(
      "/login",
      data:param);

      Headers headers = response.headers;
      String token = headers.value("Token");
      DioConfig.setToken(token);
      UserAccount user = UserAccount.fromMap(response.data["data"]);
      return user;
  }
  Future<UserAccount> findByGoogleId(String email) async{
    var param = {
      "provider": "GOOGLE",
      "email": email
    };
  } 
  Future<void> updateProfile(String fullname, String phoneNumber) async {
    List names = fullname.split(" ");
    var lastNames = '';

    for (int i =1; i < names.length; i++) {
      lastNames = lastNames + names[i] + ' ';
    }
    var param = {
      "firstName" : names[0],
      "lastName" : lastNames.trim(),
      "phone" : phoneNumber,
    };
    Response response = await DioConfig.get().post(
      "/edit-profile",
      data:param);
      return UserAccount.fromMap(response.data["data"]);
  }

  Future<void> updatePassword(String oldPassword, String newPassword) async {
    var param = {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    };

    Response response = await DioConfig.get().post(
      "/changePassword",
      data: param,
    );
    return UserAccount.fromMap(response.data["data"]);
  }

  Future<void> forgotPassword(String email) async {
    await DioConfig.get().post("/forgotpassword", data: email);
  }

}

