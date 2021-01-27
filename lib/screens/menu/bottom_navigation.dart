import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ketiga/screens/ui/history/history_page.dart';
import 'package:ketiga/screens/ui/home_page.dart';
import 'package:ketiga/screens/users/home_profile_users.dart';

class BottomNav extends StatefulWidget {
  final int page;
  BottomNav(this.page);
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  @override
  void initState(){
    super.initState();
    _currentIndex = widget.page;
  }
  final List<Widget> _pages = [
    HomePage(),
    HistoryPage(),
    HomeProfile(),
  ];

  void onTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xff68C93E),
        items: [
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/home.svg'),
          activeIcon: SvgPicture.asset('assets/svg/home.svg',color: Color(0xff68C93E)),
          title: Text('Beranda')),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/history_icon.svg'),
          activeIcon: SvgPicture.asset('assets/svg/history_icon.svg',color: Color(0xff68C93E)),
          title: Text('Riwayat')),
          BottomNavigationBarItem(icon: SvgPicture.asset('assets/svg/account_icon.svg'),
          activeIcon: SvgPicture.asset('assets/svg/account_icon.svg',color: Color(0xff68C93E)),
          title: Text('Akun')),
        ],
      ),
    );
  }
}