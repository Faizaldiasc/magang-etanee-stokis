import 'package:flutter/material.dart';
import 'package:ketiga/dio_config.dart';
import 'package:ketiga/models/user_account.dart';
import 'package:ketiga/notifier/notifier_user_account.dart';
import 'package:ketiga/screens/ui/history/history_page.dart';
import 'package:ketiga/screens/ui/home_page.dart';
import 'package:ketiga/screens/users/edit_user_password.dart';
import 'package:ketiga/screens/users/edit_user_profile.dart';
import 'package:ketiga/screens/users/login_user.dart';
import 'package:provider/provider.dart';

class HomeProfile extends StatefulWidget {
  @override
  _HomeProfileState createState() => _HomeProfileState();
  
}

class _HomeProfileState extends State<HomeProfile> {

  @override
  Widget build(BuildContext context) {
    AuthNotifier notifier = Provider.of<AuthNotifier>(context, listen: false);
    UserAccount userAccount = notifier.userAccount;
    
    if (userAccount == null) return Container();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width / 1.6,
                decoration: BoxDecoration(
                    color: Color(0xff6CD23F),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                    child: Text(
                      'Akun',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.only(top: 60.0),
                          child: SizedBox(
                            height: 328,
                            width: 350,
                            child: Padding(
                              padding: EdgeInsets.only(top: 28.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 50,),
                                  Column(
                                    children: <Widget>[
                                      Text('${userAccount.name}', 
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold
                                      ),),
                                      SizedBox(height: 10,),
                                      Text('${userAccount.email}', 
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),),
                                      SizedBox(height: 16.0,),
                                      Divider(color: Colors.grey,),
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Padding(
                                    padding: EdgeInsets.only(left:16, right:16),
                                      child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('No Telepon'),
                                        Text('${userAccount.phoneNumber}')
                                    ],),
                                  ),
                                  SizedBox(height: 32,),
                                  Padding(
                                    padding: EdgeInsets.only(left:16, right:16),
                                      child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text('Password'),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute (builder: (context) => EditPassword(userAccount)),);
                                          },
                                          child: Text('Ubah Password', style: TextStyle(color: Color(0xff68C93E)),)),
                                    ],),
                                  ),
                                  SizedBox(height: 50,),
                                  InkWell(
                                    onTap: () {
                                      DioConfig.clearToken();
                                      notifier.signOut();
                                    },
                                    child: Text('Keluar', style: TextStyle(color: Colors.red),),
                                  )
                                ],
                              ), 
                            ),
                          ),
                        ),
                      ), 
                      Center(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.grey.withOpacity(0.3),
                                blurRadius: 80.0,
                                offset: Offset(
                                  0,0.2
                                ))
                              ]
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 60,
                              child: Icon(Icons.person, size: 60, color: Color(0xff63C23A),),
                            ),
                          ),
                        ),
                      Padding(padding: EdgeInsets.only(top:96, left:317),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(userAccount)));
                        },
                        child: Icon(
                          Icons.border_color,color: Color(0xff63C23A), size: 20.0,),
                      ),)
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
