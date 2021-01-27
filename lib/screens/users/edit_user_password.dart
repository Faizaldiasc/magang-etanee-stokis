import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ketiga/models/user_account.dart';
import 'package:ketiga/notifier/notifier_user_account.dart';
import 'package:ketiga/screens/users/home_profile_users.dart';
import 'package:ketiga/services/user_services.dart';
import 'package:provider/provider.dart';

class EditPassword extends StatefulWidget {
  final UserAccount userAccount;
  EditPassword(this.userAccount);
  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  // bool _isFieldOlPassworddValid;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmationPasswordController = TextEditingController();

  @override
  void initState() {
    if (widget.userAccount != null) {
      _oldPasswordController.text = widget.userAccount.password;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // AuthNotifier notifier = Provider.of<AuthNotifier>(context, listen: false);
    // UserAccount userAccount = notifier.userAccount;
    // _oldPasswordController.text = userAccount.password;
    // _newPasswordController.text = userAccount.newPassword;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Ubah Password'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('Password saat ini', style: TextStyle(color: Color(0xff828282)),)
          ),
          Padding(
            padding: const EdgeInsets.only(left:16.0, right:16),
            child: TextFormField(
              obscureText: true,
              controller: _oldPasswordController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('Password baru', style: TextStyle(color: Color(0xff828282)),)
          ),
          Padding(
            padding: const EdgeInsets.only(left:16.0, right:16),
            child: TextFormField(
              obscureText: true,
              controller: _newPasswordController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text('Konfirmasi password baru', style: TextStyle(color: Color(0xff828282)),)
          ),
          Padding(
            padding: const EdgeInsets.only(left:16.0, right:16),
            child: TextFormField(
              obscureText: true,
              controller: _confirmationPasswordController,
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
                    onPressed: () =>_updatePassword(context),
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }

  bool _validate() {
    if (_oldPasswordController.text.isEmpty) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('isi password lama anda terlebih dahulu'),));
      return false;
    }
    if (_newPasswordController.text.isEmpty) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('isi password baru anda terlebih dahulu'),));
      return false;
    }
    if (_confirmationPasswordController.text != _newPasswordController.text) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('konfirmasi password anda tidak berhasil'),));
    }
    return true;
  }
  void _updatePassword(context) async {
    if(!_validate()) return;
    await UserAccountService()
    .updatePassword(_oldPasswordController.text,_newPasswordController.text)
    .catchError((e) => print(e))
    .then((r) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeProfile()));
    });
  }
}
