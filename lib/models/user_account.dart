import 'package:flutter/material.dart';

@immutable
class UserAccount {
  final String id;
  final String email;
  final String password;
  String name;
  final String fname;
  final String lname;
  String phoneNumber;
  final bool login;
  final bool logout;
  
  UserAccount({
    this.id,
    this.email,
    this.password,
    this.name,
    this.fname,
    this.lname,
    this.phoneNumber,
    this.login,
    this.logout
  });

  factory UserAccount.fromMap(Map data){
    return UserAccount(
      id: data['id'],
      email: data['email'],
      password: data['password'],
      name: data['firstName'],
      fname: data['firstName'] + ' ' + data['lastName'],
      phoneNumber: data['phone'],
      login: true,
      logout: false
    );
  }
}