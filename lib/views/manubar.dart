import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/views/home.dart';
import 'package:flutter_firebase_connect/views/listdog.dart';
import 'package:flutter_firebase_connect/views/profile.dart';

class manubar extends StatefulWidget {
  @override
  _manubarState createState() => _manubarState();
}

class _manubarState extends State<manubar> {
  int _currentIndex = 0;
  final tabs = [
    Home(),
    listdog(),
    profile(),
    Center(
      child: Text('QRcode'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code), title: Text('QRcode'))
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
