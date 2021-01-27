import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ketiga/models/user_account.dart';
import 'package:ketiga/notifier/notifier_user_account.dart';
import 'package:ketiga/screens/menu/bottom_navigation.dart';
import 'package:ketiga/screens/users/home_profile_users.dart';
import 'package:ketiga/services/user_services.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final UserAccount userAccount;
  EditProfile(this.userAccount);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  bool _isFieldFullNameValid;
  bool _isFieldPhoneNumberValid;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    if (widget.userAccount != null) {
      _fullnameController.text = widget.userAccount.name;
      _phoneNumberController.text = widget.userAccount.phoneNumber;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Ubah Profil'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('Fullname', style: TextStyle(color: Color(0xff828282)),)
          ),
          Padding(
            padding: const EdgeInsets.only(left:16.0, right:16),
            child: TextFormField(
             controller: _fullnameController, 
              onChanged: (value) {
                bool isFieldValid = value.trim().isNotEmpty;
                if(isFieldValid != _isFieldFullNameValid) {
                  setState(()=> _isFieldFullNameValid == isFieldValid);
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('No. Telepon', style: TextStyle(color: Color(0xff828282)),)
          ),
          Padding(
            padding: const EdgeInsets.only(left:16.0, right:16),
            child: TextFormField(
              controller: _phoneNumberController,
              onChanged: (value) {
                bool isFieldValid = value.trim().isNotEmpty;
                if(isFieldValid != _isFieldPhoneNumberValid) {
                  setState(() => _isFieldPhoneNumberValid == isFieldValid);
                } 
              },
            ),
          ),
          Expanded(
            child: Center(
                child: ButtonTheme(
                  minWidth: 328,
                  height: 48,
                  child: RaisedButton(
                    child: Text('Simpan', style: TextStyle(color: Colors.white),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)
                    ),
                    color: Color(0xff68C93E),
                    // elevation: 2,
                    onPressed: () =>_updateProfile(context),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
  void showError(message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message),));
  }
  bool _validate(){
      if(_fullnameController.text.isEmpty){
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('nama anda harus diisi terlebih dahulu'),));
      return false;    
      }
      if(_phoneNumberController.text.isEmpty){
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('no telepon harus disi terlebih dahulu'),));
      return false;
      }
    return true;
  }
  void _updateProfile(context) async {
    if(!_validate()) return;
    await UserAccountService()
    .updateProfile(_fullnameController.text,_phoneNumberController.text)
    .catchError((e) => print(e))
    .then((r) {
      AuthNotifier notifier = Provider.of<AuthNotifier>(context, listen: false);
      notifier.updateNamePhone(_fullnameController.text, _phoneNumberController.text);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (_) => BottomNav(2)), (Route<dynamic> route) => false);
    });
    
  }
}
